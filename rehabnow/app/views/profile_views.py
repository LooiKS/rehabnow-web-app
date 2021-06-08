from django.shortcuts import render, redirect
from rehabnow.app.models import (
    Patient,
    Part,
)
from rehabnow.app.serializers import UserSerializer, ExerciseRecordsSerializer
from rehabnow.app.forms.edit_profile_form import EditProfileForm
import time
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.conf import settings
import os
from PIL import Image
from django.views import View
from django.core.exceptions import ValidationError
from rehabnow.app.services.profile_image_service import ProfileImageService
from sklearn.linear_model import LinearRegression
from datetime import timedelta
import math
from django.contrib.auth.decorators import login_required, permission_required


class ViewProfile(View):
    permission_required = "app.web_permission"

    def get(self, request, *args, **kwargs):
        return render(
            request, "postlogin/profile/view-profile.html", {"user": request.user}
        )


class EditProfile(View):
    permission_required = "app.web_permission"

    def post(self, request, *args, **kwargs):
        form = EditProfileForm(request.POST, request.FILES)
        user = request.user
        print(form["photo"].value())
        if form["current_password"].data or form["new_password"].data:
            if user.check_password(form["current_password"].data) is False:
                form.add_error(
                    "current_password",
                    ValidationError("The password is not correct", "invalid"),
                )

        if form.is_valid() is True:
            user.first_name = form.cleaned_data["first_name"]
            user.last_name = form.cleaned_data["last_name"]
            user.ic_passport = form.cleaned_data["ic_passport"]
            user.phone_num = form.cleaned_data["phone_num"]
            user.gender = form.cleaned_data["gender"]
            user.dob = form.cleaned_data["dob"]
            user.nationality = form.cleaned_data["nationality"]
            user.address = form.cleaned_data["address"]
            user.postcode = form.cleaned_data["postcode"]
            user.city = form.cleaned_data["city"]
            user.state = form.cleaned_data["state"]
            user.country = form.cleaned_data["country"]
            if form.cleaned_data["new_password"]:
                user.set_password(form.cleaned_data["new_password"])
                update_session_auth_hash(request, user)

            if form.cleaned_data["photo"]:
                print(form.cleaned_data["photo"])
                cropped = img = Image.open(form.cleaned_data["photo"])
                width = img.width
                height = img.height
                if width < height:
                    length_to_cropped = (height - width) / 2
                    cropped = img.crop(
                        (
                            0,
                            length_to_cropped,
                            width,
                            length_to_cropped + width,
                        )
                    )
                elif height < width:
                    length_to_cropped = (width - height) / 2
                    cropped = img.crop(
                        (length_to_cropped, 0, length_to_cropped + height, height)
                    )

                t = str(time.time() * 1000)
                filepath = "/profile-images/"
                filename = (
                    user.id
                    + "-"
                    + t[: t.index(".")]
                    + request.FILES["photo"].name[
                        request.FILES["photo"].name.index(".") :
                    ]
                )
                absolute_filepath = settings.MEDIA_ROOT + filepath + filename
                try:
                    os.remove(settings.MEDIA_ROOT + user.photo)
                except Exception as e:
                    print(e)
                cropped.save(absolute_filepath)
                user.photo = filepath + filename
            user.save()
            messages.success(request, "Profile Updated.")
            return redirect("profile")
        return render(
            request,
            "postlogin/profile/edit-profile.html",
            {"form": form},
        )

    def get(self, request, *args, **kwargs):
        if request.user.dob:
            dob = request.user.dob.strftime("%Y-%m-%d")
        else:
            dob = time.time()
        form = EditProfileForm(
            instance=request.user,
            initial={"dob": dob},
        )

        print(form["photo"])

        return render(
            request,
            "postlogin/profile/edit-profile.html",
            {"form": form},
        )


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_profile(request):
    return Response(UserSerializer(request.user).data)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def save_profile(request):
    status = "failed"
    print(request.data)
    # print(request.FILES["photo"])
    email = request.user.email
    form = EditProfileForm(request.data, instance=request.user)
    print(form["current_password"])
    print(form["new_password"])

    if form["current_password"].data or form["new_password"].data:
        if request.user.check_password(form["current_password"].data) is False:
            form.add_error(
                "current_password",
                ValidationError("The password is incorrect.", "wrong_password"),
            )

    if form.is_valid():
        puser = form.save(commit=False)
        puser.email = email
        # puser.email = "kianseng213@gmail.com"
        print(request.user.email)

        if request.FILES.get("photo"):
            pis = ProfileImageService(
                request.FILES["photo"], puser.id, request.FILES["photo"].name
            )
            puser.photo = pis.save_and_delete(puser.photo)
        puser.save()
        status = "success"

    print(form.errors.get_json_data())
    return Response(
        {
            "data": {
                "user": UserSerializer(request.user).data,
                "form": form.cleaned_data,
                "errors": form.errors.get_json_data(),
            },
            "status": status,
        }
    )


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_patient_prediction(request, patient_id):
    parts = Part.objects.filter(
        case_id__patient_id=patient_id,
        case_id__patient_id__physiotherapist=request.user.id,
        status="Under Treatment",
    )
    responses = []

    for part in parts:
        data = {}

        exercises = part.exercises.all().order_by("created_dt")
        target = part.targets.all()[0]

        if len(exercises) > 0:
            X = list([e.oscillation_num] for e in exercises)
            y = list([i] for i in range(len(exercises)))
            print(X)
            print(y)
            reg = LinearRegression().fit(X, y)
            reg.score(X, y)

            x = len(X)
            predict = 0
            while x < 100 + len(X):  # and predict < target.oscillation_num:
                predict = reg.predict([[x]])
                x = x + 1

                num = x - len(X)
                if target.frequency == 1:
                    pass
                elif target.frequency == 2:
                    num = num / 2
                elif target.frequency == 3:
                    num = num / 3
                elif target.frequency == 4:
                    num = num * 2
                else:
                    num = num * 3

                data[
                    int(
                        (
                            exercises[len(exercises) - 1].created_dt
                            + timedelta(days=math.ceil(num))
                        ).timestamp()
                        * 1000
                    )
                ] = int(predict[0][0] if predict[0][0] > 0 else 0)

        responses.append(
            {"part_name": part.name, "case_name": part.case_id.name, "data": data}
        )

    return Response(responses)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_patient_performance(request, patient_id):
    parts = Part.objects.filter(
        case_id__patient_id=patient_id,
        case_id__patient_id__physiotherapist=request.user.id,
        status="Under Treatment",
    )
    print(request.user.id)
    return Response(ExerciseRecordsSerializer(parts, many=True).data)


@api_view(["GET"])
# @permission_classes([IsAuthenticated])
def get_patient_category(request):
    id = request.user.id
    patients = Patient.objects.filter(physiotherapist__physiotherapist__id=id)
    recovered = 0
    under_treatment = 0
    no_cases = 0
    no_under_treatment = False

    for patient in patients:
        cases = patient.cases.all()
        if not cases:
            no_cases += 1

        for case in cases:
            if case.status == "Under Treatment":
                under_treatment += 1
                break
            else:
                no_under_treatment = True
        if no_under_treatment is True:
            recovered += 1

    return Response([recovered, under_treatment, no_cases])

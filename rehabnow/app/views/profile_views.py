from django.shortcuts import render, redirect
from rehabnow.app.serializers import UserSerializer
from rehabnow.app.forms.edit_profile_form import EditProfileForm
import time
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.views import View
from django.core.exceptions import ValidationError
from rehabnow.app.services.profile_image_service import ProfileImageService
from django.contrib.auth.decorators import permission_required


class ViewProfile(View):
    permission_required = "app.web_permission"

    def get(self, request, *args, **kwargs):
        return render(
            request, "postlogin/profile/view-profile.html", {"user": request.user}
        )


class EditProfile(View):
    permission_required = "app.web_permission"

    def post(self, request, *args, **kwargs):
        user = request.user
        post = request.POST.copy()
        post["email"] = user.email
        form = EditProfileForm(
            post,
            request.FILES,
            instance=request.user,
        )

        if form["current_password"].data or form["new_password"].data:
            if user.check_password(form["current_password"].data) is False:
                form.add_error(
                    "current_password",
                    ValidationError("The password is not correct", "invalid"),
                )

        if user.photo is None:
            form.fields.get("photo").required = True

        if form.is_valid() is True:
            user = form.save(commit=False)

            if form.cleaned_data["new_password"]:
                user.set_password(form.cleaned_data["new_password"])
                update_session_auth_hash(request, user)

            if form.cleaned_data["photo"]:
                pis = ProfileImageService(
                    form.cleaned_data["photo"], user.id, request.FILES["photo"].name
                )
                user.photo = pis.save()
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

        return render(
            request,
            "postlogin/profile/edit-profile.html",
            {"form": form},
        )


@api_view(["GET"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def get_profile(request):
    return Response(UserSerializer(request.user).data)


@api_view(["POST"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def save_profile(request):
    status = "failed"
    email = request.user.email
    form = EditProfileForm(request.data, instance=request.user)

    if form["current_password"].data or form["new_password"].data:
        if request.user.check_password(form["current_password"].data) is False:
            form.add_error(
                "current_password",
                ValidationError("The password is incorrect.", "wrong_password"),
            )

    if form.is_valid():
        puser = form.save(commit=False)
        puser.email = email

        if request.FILES.get("photo"):
            pis = ProfileImageService(
                request.FILES["photo"], puser.id, request.FILES["photo"].name
            )
            puser.photo = pis.save_and_delete(puser.photo)

        if form.cleaned_data["new_password"]:
            puser.set_password(form.cleaned_data["new_password"])

        puser.save()
        status = "success"

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

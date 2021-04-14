from django.shortcuts import render, redirect
from rehabnow.app.models import Country, State, City, StateSerializer, User
from rehabnow.app.forms.edit_profile_form import EditProfileForm
import time, datetime
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.conf import settings
import os


def view_profile(request):
    return render(request, "postlogin/profile/view-profile.html")


def view_profile_success(request):
    print("success")
    return render(request, "postlogin/profile/view-profile.html", {"edited": "edited"})


def edit_profile(request):
    if request.method == "POST":
        form = EditProfileForm(
            request.POST, request.FILES, initial={"dob": datetime.time}
        )

        form.fields["state"].choices = list(
            map(
                lambda x: (x.id, x.state),
                State.objects.filter(iso2=form["country"].data),
            )
        )

        form.fields["city"].choices = list(
            map(
                lambda x: (x.city, x.city),
                City.objects.filter(state=form["state"].data),
            )
        )

        user = request.user
        from django.core.exceptions import ValidationError

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
                t = str(time.time() * 1000)
                filepath = (
                    os.path.join(settings.BASE_DIR, "rehabnow/storage/profile-images/")
                    + user.id
                    + "-"
                    + t[: t.index(".")]
                    + request.FILES["photo"].name[
                        request.FILES["photo"].name.index(".") :
                    ]
                )
                with open(
                    filepath,
                    "wb+",
                ) as destination:
                    for chunk in request.FILES["photo"].chunks():
                        destination.write(chunk)
                user.photo = ""
            user.save()
            messages.success(request, "Profile Updated.")
            return redirect("lprofile1")
    else:
        form = EditProfileForm(
            instance=request.user,
            initial={"dob": request.user.dob.strftime("%Y-%m-%d")},
        )  # {"country": "Malaysia", "first_name": "johndoe 1"})
        form.fields["state"].choices = list(
            map(
                lambda x: (x.id, x.state),
                State.objects.filter(iso2=form["country"].value()),
            )
        )
        print(form["dob"].value())
        form.fields["city"].choices = list(
            map(
                lambda x: (x.city, x.city),
                City.objects.filter(state=form["state"].value()),
            )
        )
    print(request.user.dob)

    return render(
        request,
        "postlogin/profile/edit-profile.html",
        {"form": form},
    )


@api_view(["GET"])
def get_states(request, iso2):
    t = str(time.time() * 1000)
    print(t.index("."))
    states = StateSerializer(
        State.objects.prefetch_related("cities").filter(iso2=iso2), many=True
    ).data
    return Response(states)

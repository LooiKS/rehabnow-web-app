from django.shortcuts import render, redirect
from rehabnow.app.models import Patient, User
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMessage
from django.conf import settings
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
import re
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rehabnow.app.services.email_service import EmailService
from django.contrib import messages


def set_password(uidb64, token, password):
    uid = urlsafe_base64_decode(uidb64).decode()
    try:
        user = User.objects.get(pk=uid)
    except:
        user = None

    # check token <> User
    if user is not None and default_token_generator.check_token(user, token):
        if (
            re.search("^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$", password)
            is None
        ):
            error = "Password does not match the requirement of at least 8 characters (including alphabet, digit and special character)."
        else:
            user.set_password(password)
            user.save()
            error = ""
    else:
        error = "Link is invalid, please get a new reset link."
    return error


def forgot_password(request):
    if request.method == "POST":
        email = request.POST["email"]
        try:
            user = User.objects.get(email=email)
        except:
            error = "The email address is not registered."
            return render(request, "prelogin/forgot-password.html", {"error": error})

        if user is not None:
            message = render_to_string(
                "email/reset-password.html",
                {
                    "domain": get_current_site(request),
                    "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                    "token": default_token_generator.make_token(user),
                },
            )
            email = EmailMessage(
                "RehabNow Password Reset",
                message,
                settings.DEFAULT_FROM_EMAIL,
                [email],
                [settings.DEFAULT_FROM_EMAIL],
            )
            email.content_subtype = "html"
            email.send()
            return render(request, "prelogin/forgot-password-link-sent.html")
    return render(request, "prelogin/forgot-password.html")


def reset_password(request, uidb64, token):
    if request.method == "POST":
        password = request.POST["password"]
        # decode uid, get User
        error = set_password(uidb64, token, password)
        if not error:
            return redirect("reset-password-success")
        else:
            return render(request, "prelogin/reset-password.html", {"error": error})
    # GET
    return render(request, "prelogin/reset-password.html")


def set_patient_first_password(request, uidb64, token):
    if request.method == "POST":
        password = request.POST["password"]
        # decode uid, get User
        error = set_password(uidb64, token, password)
        if not error:
            uid = urlsafe_base64_decode(uidb64).decode()
            user = User.objects.get(pk=uid)
            user.status = "active"
            user.save()
            messages.success(request, "Password set successfully")
        else:
            return render(request, "prelogin/set-password.html", {"error": error})
    # GET
    return render(request, "prelogin/set-password.html")


def reset_password_success(request):
    return render(request, "prelogin/reset-password-success.html")


@api_view(["POST"])
def reset_password_api(request):
    response = {"status": "success"}
    data = request.data
    try:
        patient = Patient.objects.get(patient__email=data["email"]).patient
        if patient.status == "active":
            context = {
                "domain": get_current_site(request),
                "uid": urlsafe_base64_encode(force_bytes(patient.pk)),
                "token": default_token_generator.make_token(patient),
            }
            emailService = EmailService(
                "reset-password.html",
                context,
                "RehabNow Password Reset",
                data["email"],
            )
            emailService.send_email()
        else:
            response["status"] = "failed"
            response["errorMessage"] = "Activate"
    except Exception as e:
        response["status"] = "failed"
        response["errorMessage"] = "Email Invalid"
    return Response(response)

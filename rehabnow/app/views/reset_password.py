from django.shortcuts import render, redirect
from rehabnow.app.models import Snippet, User
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail, EmailMessage
from django.conf import settings
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
import re


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
        print(request.POST)
        password = request.POST["password"]
        # decode uid, get User
        uid = urlsafe_base64_decode(uidb64).decode()
        try:
            user = User.objects.get(pk=uid)
        except:
            user = None
        print(user)
        # check token <> User
        if user is not None and default_token_generator.check_token(user, token):
            if (
                re.search(
                    "^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$", password
                )
                is None
            ):
                error = "Password does not match the requirement of at least 8 characters (including alphabet, digit and special character)."
            else:
                user.set_password(password)
                user.save()
                return redirect("reset-password-success")
        else:
            error = "Link is invalid, please get a new reset link."
        return render(request, "prelogin/reset-password.html", {"error": error})
    # GET
    return render(request, "prelogin/reset-password.html")


def reset_password_success(request):
    return render(request, "prelogin/reset-password-success.html")

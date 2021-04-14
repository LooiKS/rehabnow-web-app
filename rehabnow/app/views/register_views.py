from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from rehabnow.app.models import Snippet, User
from django.contrib.auth.tokens import default_token_generator
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail, EmailMessage
from django.conf import settings
import re
from django.utils.encoding import force_bytes


def activate(request, uidb64, token):
    try:
        id = urlsafe_base64_decode(uidb64).decode()
        user = User.objects.get(pk=id)
    except:
        user = None

    if (
        user is not None
        and default_token_generator.check_token(user, token)
        and user.status == "unverified"
    ):
        user.status = "active"
        user.save()
        return render(request, "prelogin/activated.html")
    return render(request, "prelogin/activation-failed.html")


def resend_activation_link(request):
    email = request.POST["email"]
    try:
        user = User.objects.get(email=email)
    except:
        user = None

    if user is not None:
        message = render_to_string(
            "email/registration.html",
            {
                "domain": get_current_site(request),
                "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                "token": default_token_generator.make_token(user),
            },
        )
        email = EmailMessage(
            "Welcome To RehabNow!",
            message,
            settings.DEFAULT_FROM_EMAIL,
            [email],
            [settings.DEFAULT_FROM_EMAIL],
        )
        email.content_subtype = "html"
        email.send()
    return redirect("resend-activation-link-success")


def resend_activation_link_success(request):
    return render(request, "prelogin/resend-activation-link-success.html")


def register(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        error = ""
        print(re.search("^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$", ""))
        if re.search("[\w\.-]+@[\w\.-]+\.\w{2,4}", email) is None:
            error = "Email address is not valid."
        elif (
            re.search("^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$", password)
            is None
        ):
            error = "Password does not match the requirement of at least 8 characters (including alphabet, digit and special character)."
        else:
            try:
                user = User.objects.create_user(email, "1990-10-10", password)
            except:
                error = "Email address is registered."

        if error == "":
            message = render_to_string(
                "email/registration.html",
                {
                    "domain": get_current_site(request),
                    "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                    "token": default_token_generator.make_token(user),
                },
            )
            email = EmailMessage(
                "Welcome To RehabNow!",
                message,
                settings.DEFAULT_FROM_EMAIL,
                [request.POST["email"]],
                [settings.DEFAULT_FROM_EMAIL],
            )
            email.content_subtype = "html"
            email.send()
            return redirect("registration-success")
        else:
            return render(
                request, "prelogin/register.html", {"email": email, "error": error}
            )

    return render(request, "prelogin/register.html")


def registration_success(request):
    return render(request, "prelogin/registration-success.html")
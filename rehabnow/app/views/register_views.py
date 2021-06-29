from rehabnow.app.forms.physiotherapist_form import PhysiotherapistForm
from rehabnow.app.models import User, Physiotherapist, sequence_id
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.conf import settings
from django.utils.encoding import force_bytes
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from rehabnow.app.services.email_service import EmailService


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
        context = {
            "domain": get_current_site(request),
            "uid": urlsafe_base64_encode(force_bytes(user.pk)),
            "token": default_token_generator.make_token(user),
        }
        emailService = EmailService(
            "registration.html", context, "Welcome To RehabNow!", [email]
        )
        emailService.send_email()
    return redirect("resend-activation-link-success")


def resend_activation_link_success(request):
    return render(request, "prelogin/resend-activation-link-success.html")


def register(request):
    form = PhysiotherapistForm()
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        form = PhysiotherapistForm(request.POST)

        if form.is_valid():
            user = User.objects.create(
                email=form.cleaned_data["email"], id=sequence_id(), status="unverified"
            )
            user.set_password(form.cleaned_data["password"])
            user.save()
            p = Physiotherapist.objects.create(physiotherapist=user)
            p.save()

            context = {
                "domain": get_current_site(request),
                "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                "token": default_token_generator.make_token(user),
            }
            emailService = EmailService(
                "registration.html", context, "Welcome To RehabNow!", [user.email]
            )
            emailService.send_email()
            return redirect("registration-success")

    return render(request, "prelogin/register.html", {"form": form})


def registration_success(request):
    return render(request, "prelogin/registration-success.html")

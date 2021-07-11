from django.contrib.auth import (
    authenticate as django_authenticate,
    login as django_login,
    logout as django_logout,
)
from django.http.response import HttpResponseRedirect
from django.shortcuts import render, redirect
from rest_framework.authtoken.models import Token
from rehabnow.app.models import User, Patient
from rehabnow.app.serializers import UserSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.utils.http import is_safe_url
from django.contrib.sites.shortcuts import get_current_site


def login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        user = django_authenticate(request, username=email, password=password)

        if user is not None:
            if user.status == "active":
                django_login(request, user)
                next_url = request.GET.get("next")
                if next_url and is_safe_url(
                    next_url, allowed_hosts=get_current_site(request)
                ):
                    return HttpResponseRedirect(next_url)
                return redirect("index")
            else:
                return render(
                    request,
                    "prelogin/login.html",
                    {
                        "email": email,
                        "error": "The email address is unverified. Please find the verification link in your email.",
                    },
                )
        else:
            return render(
                request,
                "prelogin/login.html",
                {"email": email, "error": "Wrong credential. Please try again."},
            )

    if request.user.is_authenticated is True:
        return redirect("index")
    return render(request, "prelogin/login.html")


def logout(request):
    django_logout(request)
    return render(request, "prelogin/logout.html")


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def rest_logout(request):
    request.user.auth_token.delete()
    django_logout(request)
    return Response()


@api_view(["POST"])
def rest_login(request):
    data = request.data
    try:
        user = Patient.objects.get(patient__email=data["email"]).patient
        if user.status != "active":
            return Response(
                {
                    "status": "failed",
                    "errorMessage": "The account is not activated. Check your email to activate.",
                }
            )
        else:
            token, created = Token.objects.get_or_create(user=user)
            return Response(
                {
                    "data": {
                        "token": token.key,
                        "user": UserSerializer(user).data,
                    },
                    "status": "success",
                }
            )
    except:
        return Response(
            {
                "status": "failed",
                "errorMessage": "Wrong credential.",
            }
        )

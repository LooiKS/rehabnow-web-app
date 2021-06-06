from django.contrib.auth import (
    authenticate as django_authenticate,
    login as django_login,
    logout as django_logout,
)
from django.shortcuts import render, redirect


def login(request):
    print(f"R{108:07}")
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        user = django_authenticate(request, username=email, password=password)
        if user is not None:
            if user.status == "active":
                django_login(request, user)
                print(user)
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

    print(request.user.is_authenticated)
    if request.user.is_authenticated is True:
        return redirect("index")
    return render(request, "prelogin/login.html")


def logout(request):
    django_logout(request)
    return render(request, "prelogin/logout.html")


from rest_framework.authtoken.models import Token
from rehabnow.app.models import UserSerializer, User
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def rest_logout(request):
    request.user.auth_token.delete()
    django_logout(request)
    return Response()


@api_view(["POST"])
def rest_login(request):
    data = request.data
    print(data)
    users = User.objects.all()
    # for u in users:
    # u.set_password("aaa111!!!")
    # u.save()
    user = django_authenticate(
        request, username=data["email"], password=data["password"]
    )
    if user is not None:
        if user.status == "active":
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
        else:
            return Response(
                {
                    "status": "failed",
                    "errorMessage": "The account is not activated. Check your email to activate.",
                }
            )
    else:
        return Response(
            {
                "status": "failed",
                "errorMessage": "Wrong credential.",
            }
        )

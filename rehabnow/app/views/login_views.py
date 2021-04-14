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
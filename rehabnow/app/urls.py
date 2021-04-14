from django.urls import path
from rehabnow.app import views

urlpatterns = [
    path("snippets", views.SnippetList.as_view()),
    path("snippets/<int:pk>/", views.SnippetDetail.as_view()),
    path("states/<iso2>/", views.get_states),
    path("users/", views.UserList.as_view()),
    path("users/<int:pk>/", views.UserDetail.as_view()),
    path("", views.index, name="index"),
    path("detail/<int:id>", views.detail),
    # login
    path("login", views.login, name="login"),
    path("logout", views.logout),
    # register
    path("register", views.register),
    path(
        "registration-success", views.registration_success, name="registration-success"
    ),
    path("activate/<uidb64>/<token>", views.activate, name="activate"),
    path("resend-activation-link", views.resend_activation_link),
    path(
        "resend-activation-link-success",
        views.resend_activation_link_success,
        name="resend-activation-link-success",
    ),
    path("forgot-password", views.forgot_password),
    path(
        "reset-password/<uidb64>/<token>", views.reset_password, name="reset-password"
    ),
    path(
        "reset-password-success",
        views.reset_password_success,
        name="reset-password-success",
    ),
    # profile
    path("profile", views.view_profile, name="profile"),
    path("profile", views.view_profile_success, name="lprofile1"),
    path("edit-profile", views.edit_profile),
    # path("authenticate", views.authenticate),
]

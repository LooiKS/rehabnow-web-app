from django.conf.urls import url
from django.urls import path
from rehabnow.app import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path("api/states/<iso2>/", views.get_states),
    path("", views.index, name="index"),
    # login
    path("login", views.login, name="login"),
    path("logout", views.logout, name="logout"),
    # register
    path("register", views.register, name="register"),
    path(
        "registration-success", views.registration_success, name="registration-success"
    ),
    path("activate/<uidb64>/<token>", views.activate, name="activate"),
    path(
        "resend-activation-link",
        views.resend_activation_link,
        name="resend-activation-link",
    ),
    path(
        "resend-activation-link-success",
        views.resend_activation_link_success,
        name="resend-activation-link-success",
    ),
    path("forgot-password", views.forgot_password, name="forgot-password"),
    path(
        "reset-password/<uidb64>/<token>", views.reset_password, name="reset-password"
    ),
    path(
        "reset-password-success",
        views.reset_password_success,
        name="reset-password-success",
    ),
    # profile
    path("profile", login_required(views.ViewProfile.as_view()), name="profile"),
    path(
        "edit-profile", login_required(views.EditProfile.as_view()), name="edit-profile"
    ),
    # path("authenticate", views.authenticate),
    # patient
    path("patients", login_required(views.ViewPatients.as_view()), name="patients"),
    path("patients/add", login_required(views.add_patient), name="add-patient"),
    path(
        "patients/<patient_id>",
        login_required(views.ViewPatient.as_view()),
        name="patient",
    ),
    path(
        "patients/<patient_id>/edit",
        login_required(views.edit_patient),
        name="edit-patient",
    ),
    path(
        "patients/<patient_id>/delete",
        login_required(views.delete_patient),
        name="delete-patient",
    ),
    # case
    path("cases/<patient_id>/add", login_required(views.add_case), name="add-case"),
    path(
        "cases/<patient_id>/<case_id>/edit",
        login_required(views.edit_case),
        name="edit-case",
    ),
    path(
        "cases/<patient_id>/<case_id>/delete",
        login_required(views.delete_cases),
        name="delete-case",
    ),
]

from rest_framework.authtoken import views as rest_views

urlpatterns += [
    # login
    path("api/login", views.rest_login),
    path("api/logout", views.rest_logout),
    # profile
    path("api/get-profile", views.get_profile),
    # reset password
    path("api/reset-password", views.reset_password_api),
    # save profile
    path("api/save-profile", views.save_profile),
    # address data
    # path("api/get-states", views.get_states)
    path("api/get-countries", views.get_nationalities),
    path("api/get-states/<iso2>", views.get_states_by_iso2),
    path("api/get-cities/<state_id>", views.get_cities_by_state_id),
    # main page get cases data
    url(r"api/get-cases$", views.get_cases),
    path("api/get-parts/<case_id>", views.get_parts),
    # predicted data
    # upload data
    path("api/upload-exercise", views.upload_exercise),
    path("api/get-exercises/<part_id>", views.get_exercises),
    path("api/get-exercises-records", views.get_exercises_records),
    path("api/get-patient-category", views.get_patient_category),
    path("api/get-patient-performance/<patient_id>", views.get_patient_performance),
    path("api/get-patient-prediction/<patient_id>", views.get_patient_prediction),
]
# handler404 = views.handler404

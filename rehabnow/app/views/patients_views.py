from django.views import View
from django.shortcuts import render, redirect
from rehabnow.app.models import Patient, Physiotherapist, sequence_id, User, Case
from rehabnow.app.forms.edit_profile_form import EditProfileForm, PatientForm
from django.contrib import messages
from rehabnow.app.services.email_service import EmailService
from rehabnow.app.services.profile_image_service import ProfileImageService
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
from django.contrib.auth.decorators import login_required, permission_required


class ViewPatients(View):
    permission_required = "app.web_permission"

    def get(self, request, *arg, **kwargs):
        """
        return view of list of patients of the physiotherapist
        """
        users = Patient.objects.filter(physiotherapist=request.user.id)
        print(users)
        return render(
            request, "postlogin/patients/view-patients.html", {"users": users}
        )


class ViewPatient(View):
    permission_required = "app.web_permission"

    def get(self, request, *arg, **kwargs):
        """
        return view of the single patient of the physiotherapist
        """
        patient_id = kwargs["patient_id"]
        user_id = request.user.id
        patient = Patient.objects.filter(physiotherapist=user_id, patient=patient_id)
        if not patient.exists():
            return redirect("patients")
        cases = Case.objects.filter(patient_id=patient[0].patient.id).order_by("id")
        # parts = Part.objects.all().select_related()
        # print(parts[0].case_id)
        # for case in cases:
        #     print(case.parts.all())
        return render(
            request,
            "postlogin/patients/view-patient.html",
            {"user": patient[0].patient, "cases": cases},
        )


@login_required
@permission_required("app.web_permission")
def edit_patient(request, patient_id):
    user_id = request.user.id
    patients = Patient.objects.filter(physiotherapist=user_id, patient=patient_id)
    if not patients.exists():
        return redirect("patients")
    patient = patients[0].patient

    if request.method == "POST":
        post = request.POST.copy()
        post["email"] = patient.email
        form = EditProfileForm(post, request.FILES, instance=patient)
        if form.is_valid():
            patient = form.save()
            print("photo", form.cleaned_data.get("photo", None))
            if request.FILES.get("photo", None) is not None:
                pis = ProfileImageService(
                    form.cleaned_data.get("photo"),
                    patient.id,
                    request.FILES["photo"].name,
                )
                patient.photo = pis.save_and_delete(patient.photo)
            patient.save()

            messages.success(request, "Profile updated.")
            return redirect("patient", patient_id=patient_id)
        print(form.cleaned_data)
        return render(
            request,
            "postlogin/patients/edit-patient.html",
            {"form": form, "patient_id": patient_id},
        )

    else:
        """
        return view of the single patient of the physiotherapist
        """
        form = EditProfileForm(
            instance=patient,
            initial={"dob": patient.dob.strftime("%Y-%m-%d")},
        )
        return render(
            request,
            "postlogin/patients/edit-patient.html",
            {"form": form, "patient_id": patient_id},
        )


@login_required
@permission_required("app.web_permission")
def add_patient(request):
    if request.method == "POST":
        post = request.POST.copy()
        post["state"] = int(post["state"])
        form = PatientForm(post, request.FILES)
        print(post)
        if form.is_valid():
            print("save form")
            patient = form.save(commit=False)
            patient.id = sequence_id()

            if form.cleaned_data["photo"]:
                print(form.cleaned_data["photo"])
                pis = ProfileImageService(
                    form.cleaned_data["photo"], patient.id, request.FILES["photo"].name
                )
                patient.photo = pis.save()
            patient.status = "unverified"
            patient.save()
            Patient.objects.create(
                physiotherapist=Physiotherapist.objects.get(
                    physiotherapist=request.user.id
                ),
                patient=patient,
            )
            context = {
                "domain": get_current_site(request),
                "uid": urlsafe_base64_encode(force_bytes(patient.pk)),
                "token": default_token_generator.make_token(patient),
            }

            email_service = EmailService(
                "patient-welcome.html",
                context,
                "Welcome to RehabNow!",
                [form.fields["email"]],
            )
            email_service.send_email()
            return redirect("patient", patient_id=patient.id)
        else:
            print(form.errors.as_json())

    else:
        form = PatientForm()
    return render(request, "postlogin/patients/add-patient.html", {"form": form})


@login_required
@permission_required("app.web_permission")
def delete_patient(request, patient_id):
    patients = Patient.objects.filter(
        physiotherapist=request.user.id, patient=patient_id
    )
    if patients.exists():
        patients[0].delete()
        User.objects.get(id=patient_id).delete()
        messages.success(request, "Patient %s Deleted." % patient_id)

    return redirect("patients")

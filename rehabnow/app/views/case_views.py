from datetime import datetime
from django.core.exceptions import ValidationError
from django.shortcuts import render, redirect
from django.utils.timezone import make_aware
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rehabnow.app.models import (
    Patient,
    Case,
    Part,
    Target,
)
from rehabnow.app.serializers import CaseSerializer
from rehabnow.app.forms.case_form import CaseForm
from rehabnow.app.forms.part_form import PartForm
from rehabnow.app.forms.target_form import TargetForm
from django.forms import formset_factory, modelformset_factory
import time
from django.contrib import messages
from django.views.decorators.http import require_POST
from rest_framework.response import Response
from django.contrib.auth.decorators import login_required, permission_required


@require_POST
@login_required
@permission_required("app.web_permission")
def delete_cases(request, case_id, patient_id):
    try:
        patient = Patient.objects.get(
            physiotherapist=request.user.id, patient=patient_id
        )
        case = Case.objects.get(patient_id=patient, id=case_id)
    except:
        return redirect("patient", patient_id=patient_id)

    case.delete()
    messages.success(request, "Deleted")
    return redirect("patient", patient_id=patient_id)


@login_required
@permission_required("app.web_permission")
def edit_case(request, patient_id, case_id):
    # print(request.POST)
    try:
        patient = Patient.objects.get(
            physiotherapist=request.user.id, patient=patient_id
        )
        case = Case.objects.get(patient_id=patient, id=case_id)
        parts_id = list(case.parts.values_list("id", flat=True))
        targets_id = list(case.parts.values_list("targets__id", flat=True))
    except:
        return redirect("patient", patient_id=patient_id)
    from django.db.models.query import QuerySet

    PartFormSet = modelformset_factory(
        form=PartForm, model=Part, can_delete=True, extra=0
    )
    TargetFormSet = modelformset_factory(
        form=TargetForm, model=Target, can_delete=True, extra=0
    )
    parts = case.parts.all()
    q = Target.objects.none()
    for p in parts:
        q |= p.targets.all()
    # print(parts)
    if request.method == "POST":
        case_form = CaseForm(request.POST, prefix="case", instance=case)
        part_forms = PartFormSet(prefix="part", queryset=parts, data=request.POST)
        target_forms = TargetFormSet(prefix="target", queryset=q, data=request.POST)
        if case_form.is_valid() and part_forms.is_valid() and target_forms.is_valid():
            case = case_form.save(commit=False)
            case.status = "Recovered"

            for part_form, target_form in zip(part_forms, target_forms):
                if (
                    part_form["id"].data not in parts_id
                    or target_form["id"].data not in targets_id
                ):
                    pass
                if part_form.cleaned_data.get("DELETE"):
                    # print("delete")
                    # print(part_form.cleaned_data["id"].id)
                    Part.objects.get(pk=part_form.cleaned_data["id"].id).delete()
                    continue
                else:
                    part = part_form.save(commit=False)
                    target = target_form.save(commit=False)
                    part.case_id = case
                    if part.recovery_dt:
                        part.status = "Recovered"
                    elif part.status == "Recovered":
                        part.recovery_dt = make_aware(datetime.now())
                    else:
                        case.status = "Under Treatment"
                    part.save()
                    target.part_id = part
                    target.save()

            case.save()
            messages.success(request, "Case updated")
            return redirect("patient", patient_id=patient_id)

    else:
        case_form = CaseForm(prefix="case", instance=case)
        part_forms = PartFormSet(prefix="part", queryset=parts)
        target_forms = TargetFormSet(prefix="target", queryset=q)

    forms = []
    for p, t in map(lambda x, y: (x, y), part_forms, target_forms):
        print(p)
        print(t)
        # print(t.errors.as_json())
        # print(p.errors.as_json())
        if (not p.is_bound and not t.is_bound) or (
            not p.cleaned_data.get("DELETE") and not t.cleaned_data.get("DELETE")
        ):
            forms.append((p, t))
            # # print(t.cleaned_data)

    return render(
        request,
        "postlogin/cases/add-case.html",
        {
            "user": patient.patient,
            "part_forms": part_forms,
            "case_form": case_form,
            "target_forms": target_forms,
            "forms": forms,
            "cardTitle": "Edit Case",
        },
    )


@login_required
@permission_required("app.web_permission")
def add_case(request, patient_id):
    """
    cannot add body part that is currently "Under Treatment"
    """
    try:
        patient = Patient.objects.get(
            physiotherapist=request.user.id, patient=patient_id
        )
        active_parts = Part.objects.filter(
            status="Under Treatment", case_id__patient_id=patient
        )
        # print(active_parts)
    except:
        return redirect("patients")

    # print("initiate formsets")
    PartFormSet = formset_factory(PartForm, can_delete=True, min_num=1, extra=0)
    TargetFormSet = formset_factory(TargetForm, can_delete=True, min_num=1, extra=0)

    if request.method == "POST":
        # print(request.POST)
        case_form = CaseForm(request.POST, prefix="case")
        part_forms = PartFormSet(request.POST, prefix="part")
        target_forms = TargetFormSet(request.POST, prefix="target")

        # current_part_names = list(
        #     Part.objects.filter(
        #         status="Under Treatment", case_id__patient_id=patient
        #     ).values_list("name", flat=True)
        # )

        # for part_form in part_forms:
        #     if part_form["name"].data in current_part_names:
        #         part_form.add_error(
        #             "name", ValidationError("The name is chosen", "redundant")
        #         )
        #     current_part_names.append(part_form["name"].data)

        case_form.is_valid()
        part_forms.is_valid()
        target_forms.is_valid()
        if case_form.is_valid() and part_forms.is_valid() and target_forms.is_valid():
            case = case_form.save(commit=False)
            case.patient_id = patient
            # case.created_dt = time.time()
            # print(time.time())
            case.created_by = request.user.pk
            case.status = "Under Treatment"
            case.save()

            for p, t in map(lambda x, y: (x, y), part_forms, target_forms):
                if not p.cleaned_data.get("DELETE") and not t.cleaned_data.get(
                    "DELETE"
                ):
                    # print(p.cleaned_data)
                    # print(t.cleaned_data)
                    part = p.save(commit=False)
                    # part.created_dt = time.time()
                    part.created_by = request.user.pk
                    part.case_id = case
                    part.save()
                    target = t.save(commit=False)
                    # target.created_dt = time.time()
                    target.created_by = request.user.pk
                    target.part_id = part
                    target.save()
            messages.success(request, "New case added")
            return redirect("patient", patient_id=patient_id)

        # print(part_forms.errors)
        # print(target_forms.errors)
        # print(target_forms.deleted_forms)

    else:
        case_form = CaseForm(prefix="case")
        # print("partformset")
        part_forms = PartFormSet(prefix="part", initial=[{"patient": patient}])
        target_forms = TargetFormSet(prefix="target")

    forms = []
    # print(map(lambda x, y: (x, y), part_forms, target_forms))
    for p, t in map(lambda x, y: (x, y), part_forms, target_forms):
        if (not p.is_bound and not t.is_bound) or (
            not p.cleaned_data.get("DELETE") and not t.cleaned_data.get("DELETE")
        ):
            print(t.errors.as_json())
            print(p.errors.as_json())
            forms.append((p, t))

    print(case_form.errors.as_json())
    # print(part_forms.management_form.fields)
    return render(
        request,
        "postlogin/cases/add-case.html",
        {
            "user": patient.patient,
            "case_form": case_form,
            "part_forms": part_forms,
            "target_forms": target_forms,
            "forms": forms,
            "cardTitle": "Add Case",
        },
    )


@api_view(["GET"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def get_cases(request):
    if request.GET.get("status"):
        cases = Case.objects.filter(
            status=request.GET["status"],
            patient_id=request.user.id,  # request.user.id
        )
    else:
        cases = Case.objects.filter(patient_id=request.user.id)  # request.user.id

    return Response(CaseSerializer(cases, many=True).data)

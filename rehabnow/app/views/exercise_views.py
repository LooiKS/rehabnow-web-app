from django.contrib.auth.decorators import permission_required
from django.db.models.query import Prefetch
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rehabnow.app.models import Part, Exercise, Target, PredictedRecovery, Case
from rehabnow.app.serializers import ExerciseRecordsSerializer, ExerciseSerializer
from sklearn.linear_model import LinearRegression
from datetime import datetime
from datetime import timedelta
import math
from django.utils.timezone import make_aware
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, permission_required


@login_required
@permission_required("app.web_permission")
def view_exercise_records(request, case_id):
    exercises = Exercise.objects.order_by("created_dt")
    try:
        case = Case.objects.prefetch_related(
            Prefetch("parts__exercises", exercises)
        ).get(id=case_id, patient_id__physiotherapist=request.user.pk)
    except:
        return redirect("patients")

    patient = case.patient_id.patient
    return render(
        request,
        "postlogin/exercises/exercise-records.html",
        {"patient": patient, "case": case},
    )


@api_view(["GET"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def get_exercises_records(request):
    exercises = Exercise.objects.order_by("created_dt")
    return Response(
        ExerciseRecordsSerializer(
            Part.objects.prefetch_related(Prefetch("exercises", exercises)).filter(
                case_id__patient_id=request.user.id
            ),
            many=True,
        ).data
    )


@api_view(["GET"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def get_exercises(request, part_id):
    return Response(
        ExerciseSerializer(
            Exercise.objects.filter(
                part_id=part_id, part_id__case_id__patient_id=request.user.id
            ),
            many=True,
        ).data
    )


@api_view(["POST"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def upload_exercise(request):
    status = "success"
    part_id = int(request.data["partId"])
    oscillation_num = int(request.data["oscillationNum"])
    time_taken = request.data["timeTaken"]

    target = Target.objects.get(
        part_id=part_id, part_id__case_id__patient_id=request.user.id
    )
    done = target.oscillation_num <= oscillation_num

    Exercise.objects.create(
        oscillation_num=oscillation_num,
        time_taken=time_taken,
        part_id_id=part_id,
        done=done,
    )

    exercises = (
        Exercise.objects.filter(part_id_id=part_id)
        .values_list("oscillation_num")
        .order_by("created_dt")
    )

    X = list(list(e) for e in exercises)
    y = list([i] for i in range(len(exercises)))
    reg = LinearRegression().fit(X, y)
    reg.score(X, y)

    x = len(X)
    predict = 0
    while x < 100 + len(X) and predict < target.oscillation_num:
        predict = reg.predict([[x]])
        x = x + 1

    if predict != 0:
        num = x - len(X)
        if target.frequency == 1:
            pass
        elif target.frequency == 2:
            num = num / 2
        elif target.frequency == 3:
            num = num / 3
        elif target.frequency == 4:
            num = num * 2
        else:
            num = num * 3

        PredictedRecovery.objects.update_or_create(
            part_id_id=part_id,
            defaults={
                "created_by": request.user.id,
                "recovery_dt": make_aware(
                    datetime.now() + timedelta(days=math.ceil(num))
                ),
            },
        )
    else:
        try:
            recovery = PredictedRecovery.objects.get(part_id_id=part_id)
            recovery.delete()
        except:
            pass

    return Response({"data": {}, "status": status})

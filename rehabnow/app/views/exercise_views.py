from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rehabnow.app.models import (
    Part,
    Exercise,
    Target,
    PredictedRecovery,
)
from rehabnow.app.serializers import ExerciseRecordsSerializer, ExerciseSerializer
from sklearn.linear_model import LinearRegression
from datetime import datetime
from datetime import timedelta
import math
from django.utils.timezone import make_aware


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_exercises_records(request):
    return Response(
        ExerciseRecordsSerializer(
            Part.objects.filter(case_id__patient_id=request.user.id)
            # .order_by(
            #     "exercises_created_dt"
            # )
            ,
            many=True,
        ).data
    )


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def get_exercises(request, part_id):
    return Response(
        ExerciseSerializer(Exercise.objects.filter(part_id=part_id), many=True).data
    )


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def upload_exercise(request):
    status = "success"
    part_id = int(request.data["partId"])
    oscillation_num = int(request.data["oscillationNum"])
    time_taken = request.data["timeTaken"]

    target = Target.objects.get(part_id=part_id)
    done = target.oscillation_num <= oscillation_num

    Exercise.objects.create(
        # created_dt=time.time(),
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

    return Response({"data": {}, "status": status})
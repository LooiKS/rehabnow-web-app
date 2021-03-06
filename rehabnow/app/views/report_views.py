from django.db.models.query import Prefetch
from sklearn.linear_model import LinearRegression
from datetime import timedelta
import math
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rehabnow.app.models import Exercise, Patient, Part
from rehabnow.app.serializers import ExerciseRecordsSerializer
from django.contrib.auth.decorators import permission_required


@api_view(["GET"])
@permission_classes([IsAuthenticated])
@permission_required("app.web_permission")
def get_patient_prediction(request, patient_id):
    parts = Part.objects.filter(
        case_id__patient_id=patient_id,
        case_id__patient_id__physiotherapist=request.user.id,
        status="Under Treatment",
    )
    responses = []

    for part in parts:
        data = {}

        exercises = part.exercises.all().order_by("created_dt")
        target = part.targets.all()[0]

        if len(exercises) > 0:
            y = list([e.oscillation_num] for e in exercises)
            X = list([i] for i in range(len(exercises)))
            reg = LinearRegression().fit(X, y)
            reg.score(X, y)

            x = len(X)
            predict = 0
            while x < 100 + len(X):  # and predict < target.oscillation_num:
                predict = reg.predict([[x]])
                x = x + 1

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

                data[
                    int(
                        (
                            exercises[len(exercises) - 1].created_dt
                            + timedelta(days=math.ceil(num))
                        ).timestamp()
                        * 1000
                    )
                ] = int(predict[0][0] if predict[0][0] > 0 else 0)

        responses.append(
            {"part_name": part.name, "case_name": part.case_id.name, "data": data}
        )

    return Response(responses)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
@permission_required("app.web_permission")
def get_patient_performance(request, patient_id):
    case_id = request.GET.get("case_id")
    exercises = Exercise.objects.order_by("created_dt")
    if case_id is not None:
        parts = Part.objects.prefetch_related(Prefetch("exercises", exercises)).filter(
            case_id__id=case_id,
            case_id__patient_id=patient_id,
            case_id__patient_id__physiotherapist=request.user.id,
            status="Under Treatment",
        )
    else:
        parts = Part.objects.prefetch_related(Prefetch("exercises", exercises)).filter(
            case_id__patient_id=patient_id,
            case_id__patient_id__physiotherapist=request.user.id,
            status="Under Treatment",
        )
    return Response(ExerciseRecordsSerializer(parts, many=True).data)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
@permission_required("app.web_permission")
def get_patient_category(request):
    id = request.user.id
    patients = Patient.objects.filter(physiotherapist__physiotherapist__id=id)
    recovered = 0
    under_treatment = 0
    no_cases = 0

    for patient in patients:
        no_under_treatment = False
        cases = patient.cases.all()
        if not cases:
            no_cases += 1
            continue

        for case in cases:
            if case.status == "Under Treatment":
                under_treatment += 1
                break
            else:
                no_under_treatment = True
        if no_under_treatment is True:
            recovered += 1

    return Response([recovered, under_treatment, no_cases])

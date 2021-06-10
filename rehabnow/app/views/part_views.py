from django.contrib.auth.decorators import permission_required
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rehabnow.app.models import Part
from rehabnow.app.serializers import PartSerializer


@api_view(["GET"])
@permission_required("app.mobile_permission")
@permission_classes([IsAuthenticated])
def get_parts(request, case_id):
    # todo: change pid
    # print(request.GET["status"])
    return Response(
        PartSerializer(
            Part.objects.prefetch_related("targets").filter(
                case_id__patient_id=request.user.id, case_id=case_id
            ),
            many=True,
        ).data
    )

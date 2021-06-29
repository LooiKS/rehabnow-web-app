from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes
from rehabnow.app.models import (
    Country,
    State,
    City,
)
from rehabnow.app.serializers import (
    ApiCountrySerializer,
    ApiStateSerializer,
    ApiCitySerializer,
    StateSerializer,
)
import time


@api_view(["GET"])
# @permission_classes([IsAuthenticated])
def get_states(request, iso2):
    states = StateSerializer(
        State.objects.prefetch_related("cities").filter(iso2=iso2), many=True
    ).data
    return Response(states)


@api_view(["GET"])
def get_nationalities(request):
    return Response(
        ApiCountrySerializer(Country.objects.all().order_by("country"), many=True).data
    )


@api_view(["GET"])
def get_states_by_iso2(request, iso2):
    return Response(
        ApiStateSerializer(
            State.objects.filter(iso2=iso2).order_by("state"), many=True
        ).data
    )


@api_view(["GET"])
def get_cities_by_state_id(request, state_id):
    return Response(
        ApiCitySerializer(
            City.objects.filter(state=state_id).order_by("city"), many=True
        ).data
    )

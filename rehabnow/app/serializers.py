from rehabnow.app.models import (
    User,
    State,
    Country,
    City,
    PredictedRecovery,
    Case,
    Exercise,
    Part,
    Target,
)
from rest_framework import serializers
import datetime


class UserSerializer(serializers.ModelSerializer):
    full_state = serializers.SerializerMethodField()
    full_country = serializers.SerializerMethodField()
    full_nationality = serializers.SerializerMethodField()
    dob = serializers.SerializerMethodField()

    class Meta:
        model = User
        exclude = ["password"]

    def get_full_state(self, user):
        return State.objects.get(id=user.state).state

    def get_full_country(self, user):
        return Country.objects.get(iso2=user.country).country

    def get_full_nationality(self, user):
        return Country.objects.get(iso2=user.nationality).nationality

    def get_dob(self, user):
        return (int)((user.dob - datetime.date(1970, 1, 1)).total_seconds() * 1000)


class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = "__all__"


class StateSerializer(serializers.ModelSerializer):
    cities = CitySerializer(many=True)

    class Meta:
        model = State
        fields = ["iso2", "state", "id", "cities"]


class CountrySerializer(serializers.ModelSerializer):
    states = StateSerializer(many=True, read_only=True)

    class Meta:
        model = Country
        fields = ["country", "states", "nationality", "iso2"]


class PredictedRecoverySerializer(serializers.ModelSerializer):
    created_dt = serializers.SerializerMethodField()
    recovery_dt = serializers.SerializerMethodField()

    class Meta:
        model = PredictedRecovery
        fields = "__all__"

    def get_created_dt(self, part):
        return (int)((part.created_dt.timestamp() * 1000))

    def get_recovery_dt(self, part):
        return (int)((part.recovery_dt.timestamp() * 1000))


class CaseSerializer(serializers.ModelSerializer):
    created_dt = serializers.SerializerMethodField()
    created_by = serializers.SerializerMethodField()

    class Meta:
        model = Case
        fields = "__all__"

    def get_created_dt(self, case):
        return (int)((case.created_dt.timestamp() * 1000))

    def get_created_by(self, target):
        return User.objects.get(id=target.created_by).get_full_name()


class TargetSerializer(serializers.ModelSerializer):
    created_dt = serializers.SerializerMethodField()
    created_by = serializers.SerializerMethodField()

    class Meta:
        model = Target
        fields = "__all__"

    def get_created_dt(self, part):
        return (int)((part.created_dt.timestamp() * 1000))

    def get_created_by(self, target):
        return User.objects.get(id=target.created_by).get_full_name()


class PartSerializer(serializers.ModelSerializer):
    created_dt = serializers.SerializerMethodField()
    recovery_dt = serializers.SerializerMethodField()
    targets = TargetSerializer(many=True)
    created_by = serializers.SerializerMethodField()
    predicted_recoveries = PredictedRecoverySerializer(many=True)

    class Meta:
        model = Part
        fields = [
            "description",
            "name",
            "recovery_dt",
            "status",
            "created_dt",
            "created_by",
            "case_id",
            "id",
            "targets",
            "predicted_recoveries",
        ]

    def get_created_dt(self, part):
        return (int)((part.created_dt.timestamp() * 1000))

    def get_recovery_dt(self, part):
        return (
            part.recovery_dt
            if part.recovery_dt is None
            else (int)((part.recovery_dt.timestamp() * 1000))
        )

    def get_created_by(self, target):
        return User.objects.get(id=target.created_by).get_full_name()


class ExerciseSerializer(serializers.ModelSerializer):
    created_dt = serializers.SerializerMethodField()

    class Meta:
        model = Exercise
        fields = "__all__"

    def get_created_dt(self, part):
        datetime.datetime
        return (int)((part.created_dt.timestamp() * 1000))


class ExerciseDataSerializer(serializers.Serializer):
    date_time = serializers.SerializerMethodField()
    oscillation_num = serializers.IntegerField()

    def get_date_time(self, instance):
        return (int)((instance.created_dt.timestamp() * 1000))


class ExerciseRecordsSerializer(serializers.Serializer):
    part_name = serializers.SerializerMethodField()
    case_name = serializers.SerializerMethodField()
    exercises = ExerciseDataSerializer(many=True)
    targets = TargetSerializer(many=True)

    def get_part_name(self, instance):
        return instance.name

    def get_case_name(self, instance):
        return instance.case_id.name


# SERIALIZER FOR API
class ApiCountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = ["country", "nationality", "iso2"]


class ApiCitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = "__all__"


class ApiStateSerializer(serializers.ModelSerializer):
    class Meta:
        model = State
        fields = ["iso2", "state", "id"]
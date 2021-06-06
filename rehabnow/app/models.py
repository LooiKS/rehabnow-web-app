# from django.db import models
from django.db import models, connection
from pygments.lexers import get_all_lexers, get_lexer_by_name
from pygments.formatters.html import HtmlFormatter
from pygments.styles import get_all_styles
from pygments import highlight
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone
from django.core.mail import EmailMessage
from rest_framework import serializers
import datetime

LEXERS = [item for item in get_all_lexers() if item[1]]
LANGUAGE_CHOICES = sorted([(item[1][0], item[0]) for item in LEXERS])
STYLE_CHOICES = sorted([(item, item) for item in get_all_styles()])
# Create your models here.


def sequence_id():
    with connection.cursor() as cursor:
        cursor.execute("""SELECT NEXTVAL('app_user_id_seq')""")
        val = cursor.fetchone()[0]
        print("user id:\n\n\n\n\n\n", val)
        return f"R{val:07}"


class UserManager(BaseUserManager):
    def create_user(self, email, dob, password=None):
        user = self.model(email=self.normalize_email(email), status="unverified")
        user.set_password(password)
        user.save()
        print("create_user")
        return user


class User(AbstractBaseUser):
    id = models.CharField(
        max_length=20,
        unique=True,
        primary_key=True,  # default=sequence_id, auto_created=
    )
    email = models.EmailField("Email Address", unique=True)
    created_dt = models.DateTimeField("Created Date Time", default=timezone.now)
    dob = models.DateField("Date of Birth")
    first_name = models.CharField(max_length=50)
    gender = models.CharField(max_length=10)
    ic_passport = models.CharField(max_length=20)
    last_name = models.CharField(max_length=100)
    nationality = models.CharField(max_length=50)
    phone_num = models.CharField(max_length=20)
    status = models.CharField(max_length=50)
    photo = models.CharField(max_length=50)
    is_admin = models.BooleanField(default=False)

    city = models.CharField("City", max_length=50)
    country = models.CharField("Country", max_length=50, null=True)
    state = models.IntegerField()
    postcode = models.CharField(max_length=10)
    address = models.TextField("Address")

    USERNAME_FIELD = "email"
    objects = UserManager()

    def __str__(self):
        return ",".join(
            (self.id, self.email, self.phone_num, self.ic_passport, self.dob.__str__())
        )

    @property
    def is_staff(self):
        return self.is_admin

    def has_perm(self, perm):
        return True

    def has_module_perms(self, app_label):
        return True

    def get_full_address(self):
        return (
            self.address
            + ",\n"
            + self.postcode
            + ",\n"
            + self.city
            + ",\n"
            + State.objects.get(id=self.state).state
            + ",\n"
            + Country.objects.get(iso2=self.country).country
        )

    def get_nationality(self):
        return Country.objects.get(iso2=self.nationality).nationality

    def get_full_name(self):
        return self.first_name + " " + self.last_name


class Physiotherapist(models.Model):
    physiotherapist = models.OneToOneField(
        User, related_name="physiotherapist", on_delete=models.CASCADE, primary_key=True
    )


class Patient(models.Model):
    patient = models.OneToOneField(
        User, related_name="patient", on_delete=models.CASCADE, primary_key=True
    )
    physiotherapist = models.ForeignKey(
        Physiotherapist, related_name="patient", on_delete=models.CASCADE
    )


class Country(models.Model):
    country = models.CharField(max_length=100)
    nationality = models.CharField(max_length=100)
    iso2 = models.CharField(max_length=5, primary_key=True)

    class Meta:
        db_table = "app_data_country"


class State(models.Model):
    iso2 = models.ForeignKey(
        Country, related_name="states", on_delete=models.CASCADE, db_column="iso2"
    )
    state = models.CharField(max_length=100)
    id = models.IntegerField(unique=True, primary_key=True)

    class Meta:
        db_table = "app_data_state"


class City(models.Model):
    city = models.CharField(max_length=100, primary_key=True)
    state = models.ForeignKey(
        State, related_name="cities", on_delete=models.CASCADE, db_column="state"
    )

    class Meta:
        db_table = "app_data_city"


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


from django.core.validators import MinValueValidator


class Case(models.Model):
    name = models.CharField(max_length=100, default="")
    description = models.TextField(default="")
    status = models.CharField(max_length=50)
    patient_id = models.ForeignKey(
        Patient, related_name="cases", on_delete=models.CASCADE
    )
    created_by = models.CharField(max_length=50)
    created_dt = models.DateTimeField(
        # default="",
        auto_now_add=True
    )

    def __str__(self):
        return ", ".join(
            [
                self.name,
                self.description,
                self.status,
                self.patient_id.patient.id,
                self.created_by,
                self.created_dt.__str__(),
                # self.parts,
            ]
        )


class Part(models.Model):
    description = models.TextField(default="")
    name = models.CharField(max_length=20, default="")
    recovery_dt = models.DateTimeField(null=True)
    status = models.CharField(max_length=20)
    created_dt = models.DateTimeField(
        # default="",
        auto_now_add=True
    )
    created_by = models.CharField(max_length=20)
    case_id = models.ForeignKey(Case, related_name="parts", on_delete=models.CASCADE)
    id = models.AutoField(primary_key=True)


class Exercise(models.Model):
    created_dt = models.DateTimeField(
        # default="",
        auto_now_add=True
    )
    oscillation_num = models.IntegerField()
    time_taken = models.FloatField()
    part_id = models.ForeignKey(
        Part, related_name="exercises", on_delete=models.CASCADE
    )
    done = models.BooleanField()


class Target(models.Model):
    created_by = models.CharField(max_length=20)
    created_dt = models.DateTimeField(auto_now_add=True)
    frequency = models.IntegerField()
    oscillation_num = models.IntegerField(validators=[MinValueValidator(1)])
    time_taken = models.FloatField(validators=[MinValueValidator(1)])
    part_id = models.ForeignKey(Part, related_name="targets", on_delete=models.CASCADE)
    id = models.AutoField(primary_key=True)

    def __str__(self):
        return self.oscillation_num.__str__()


class PredictedRecovery(models.Model):
    created_by = models.CharField(max_length=20)
    created_dt = models.DateTimeField(auto_now_add=True)
    recovery_dt = models.DateTimeField()
    part_id = models.ForeignKey(
        Part, related_name="predicted_recoveries", on_delete=models.CASCADE
    )


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
        print(type(part.created_dt))
        datetime.datetime
        return (int)((part.created_dt.timestamp() * 1000))


class ExerciseDataSerializer(serializers.Serializer):
    date_time = serializers.SerializerMethodField()
    oscillation_num = serializers.IntegerField()

    def get_date_time(self, instance):
        # print(instance.part_id.name)
        return (int)((instance.created_dt.timestamp() * 1000))


class ExerciseRecordsSerializer(serializers.Serializer):
    part_name = serializers.SerializerMethodField()
    case_name = serializers.SerializerMethodField()
    exercises = ExerciseDataSerializer(many=True)
    targets = TargetSerializer(many=True)

    def get_part_name(self, instance):
        # print(instance.part_id.name)
        return instance.name

    def get_case_name(self, instance):
        # print(instance.part_id.name)
        return instance.case_id.name

    # def get_data(self, instance):
    #     print(instance.exercises.all())
    #     return ExerciseDataSerializer(instance.exercises.all(), many=True)

    # SELECT * FROM PART WHERE
    # SELECT * FROM CASE WHERE PATIENT_ID = 'PID'


# class ExerciseSummarySerializer(serializers.Serializer):
#     """
#     last_osc
#     target
#     """
#     upper_left =
#     upper_right =
#     lower_left =
#     lower_right =


class Snippet(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=100, blank=True, default="")
    code = models.TextField()
    linenos = models.BooleanField(default=False)
    language = models.CharField(
        choices=LANGUAGE_CHOICES, default="python", max_length=100
    )
    style = models.CharField(choices=STYLE_CHOICES, default="friendly", max_length=100)
    owner = models.ForeignKey(User, related_name="snippets", on_delete=models.CASCADE)
    highlighted = models.TextField()

    def __str__(self):
        return self.code

    class Meta:
        ordering = ["created"]

    def save(self, *args, **kwargs):
        """
        Use the `pygments` library to create a highlighted HTML
        representation of the code snippet.
        """
        lexer = get_lexer_by_name(self.language)
        linenos = "table" if self.linenos else False
        options = {"title": self.title} if self.title else {}
        formatter = HtmlFormatter(
            style=self.style, linenos=linenos, full=True, **options
        )
        self.highlighted = highlight(self.code, lexer, formatter)
        super(Snippet, self).save(*args, **kwargs)


"""


"""
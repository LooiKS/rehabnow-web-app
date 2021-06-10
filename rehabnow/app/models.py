from django.db import models, connection
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone
from django.core.validators import MinValueValidator


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
    dob = models.DateField("Date of Birth", null=True)
    first_name = models.CharField(max_length=50, null=True)
    gender = models.CharField(max_length=10, null=True)
    ic_passport = models.CharField(max_length=20, null=True)
    last_name = models.CharField(max_length=100, null=True)
    nationality = models.CharField(max_length=50, null=True)
    phone_num = models.CharField(max_length=20, null=True)
    status = models.CharField(max_length=50, null=True)
    photo = models.CharField(max_length=50, null=True)
    is_admin = models.BooleanField(default=False)

    city = models.CharField("City", max_length=50, null=True)
    country = models.CharField("Country", max_length=50, null=True)
    state = models.IntegerField(null=True)
    postcode = models.CharField(max_length=10, null=True)
    address = models.TextField("Address", null=True)

    USERNAME_FIELD = "email"
    objects = UserManager()

    def __init__(self, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self.has_perm = True

    @property
    def is_staff(self):
        return self.is_admin

    def has_perms(self, perm):
        print(Physiotherapist.objects.filter(physiotherapist__id=self.id).exists())
        if len(perm) > 0:
            if perm[0] == "app.web_permission":
                return Physiotherapist.objects.filter(
                    physiotherapist__id=self.id
                ).exists()
            else:  # if perm[0] == "app.mobile_permission":
                return Patient.objects.filter(patient__id=self.id).exists()
        else:
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
        unique_together = ("city", "state")


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


class PredictedRecovery(models.Model):
    created_by = models.CharField(max_length=20)
    created_dt = models.DateTimeField(auto_now_add=True)
    recovery_dt = models.DateTimeField()
    part_id = models.ForeignKey(
        Part, related_name="predicted_recoveries", on_delete=models.CASCADE
    )


class SupportPermission(models.Model):
    class Meta:
        managed = False
        default_permissions = ()
        permissions = (
            ("web_permission", "Access Web"),
            ("mobile_permission", "Access Mobile"),
        )

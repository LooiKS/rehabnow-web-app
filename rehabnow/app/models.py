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

LEXERS = [item for item in get_all_lexers() if item[1]]
LANGUAGE_CHOICES = sorted([(item[1][0], item[0]) for item in LEXERS])
STYLE_CHOICES = sorted([(item, item) for item in get_all_styles()])
# Create your models here.


def sequence_id():
    with connection.cursor() as cursor:
        cursor.execute("""SELECT NEXTVAL('app_user_id_seq')""")
        return cursor.fetchone()[0]


class UserManager(BaseUserManager):
    def create_user(self, email, dob, password=None):
        user = self.model(email=self.normalize_email(email), status="unverified")
        user.set_password(password)
        user.save()
        return user


class User(AbstractBaseUser):
    id = models.CharField(
        max_length=20, unique=True, primary_key=True, default=f"R{sequence_id():07}"
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
    is_admin = models.BooleanField()

    city = models.CharField("City", max_length=50)
    country = models.CharField("Country", max_length=50)
    state = models.CharField(max_length=50)
    postcode = models.CharField(max_length=10)
    address = models.TextField("Address")

    USERNAME_FIELD = "email"
    objects = UserManager()

    def __str__(self):
        return ",".join((self.id, self.email, self.phone_num))

    @property
    def is_staff(self):
        return self.is_admin

    def has_perm(self, perm):
        return True

    def has_module_perms(self, app_label):
        return True


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
        fields = ["country", "states"]


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

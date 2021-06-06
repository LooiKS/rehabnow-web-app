from django import forms
from rehabnow.app.models import Country, City, State, User


def get_countries():
    countries = list(
        map(
            lambda x: (x.iso2, x.country),
            Country.objects.all().order_by("country"),
        )
    )
    countries.insert(0, ("", "Please choose a country"))
    return countries


def get_nationalities():
    nationalities = list(
        map(
            lambda x: (x.iso2, x.nationality),
            Country.objects.all().order_by("nationality"),
        )
    )
    nationalities.insert(0, ("", "Please choose a nationality"))
    return nationalities


def get_cities():
    cities = list(map(lambda x: (x.city, x.city), City.objects.all().order_by("city")))
    cities.insert(0, ("", "Please choose a state"))
    return cities


def get_states():
    cities = list(map(lambda x: (x.id, x.state), State.objects.all().order_by("state")))
    cities.insert(0, ("", "Please choose a country"))
    return cities


class EditProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=50, initial="")
    last_name = forms.CharField(max_length=100, initial="")
    ic_passport = forms.CharField(max_length=20, initial="")
    phone_num = forms.CharField(max_length=20, initial="")
    gender = forms.ChoiceField(
        choices=(
            ("", "Please choose your gender"),
            ("Male", "Male"),
            ("Female", "Female"),
        ),
        initial="",
    )
    dob = forms.CharField(initial="1990-01-01")
    nationality = forms.ChoiceField(initial="", choices=get_nationalities)
    address = forms.CharField(max_length=100, initial="")
    postcode = forms.CharField(max_length=10, initial="")
    city = forms.ChoiceField(initial="", choices=[("", "Please choose a state")])
    state = forms.TypedChoiceField(
        initial="",
        choices=[("", "Please choose a country")],
        coerce=int,
        error_messages={
            "invalid_choice": "Select a valid choice.",
        },
    )
    country = forms.ChoiceField(
        initial="",
        choices=get_countries,  # .append(("", "Please choose a country")),
    )
    current_password = forms.CharField(required=False)
    new_password = forms.RegexField(
        "^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$",
        required=False,
        error_messages={
            "invalid": "Please enter password with at least 8 characters (including alphabet, digit and special character)"
        },
    )
    email = forms.CharField(required=False)
    photo = forms.ImageField(required=False)

    class Meta:
        model = User
        fields = [
            "first_name",
            "last_name",
            "ic_passport",
            "phone_num",
            "gender",
            "dob",
            "nationality",
            "address",
            "postcode",
            "country",
            "state",
            "city",
            "email",
            "photo",
        ]

    def __init__(self, *args, **kwargs):
        super(EditProfileForm, self).__init__(*args, **kwargs)
        print(self._meta.model.id)
        # print(args.state, kwargs)
        if self["country"].value():
            self.fields["state"].choices = list(
                map(
                    lambda x: (x.id, x.state),
                    State.objects.filter(iso2=self["country"].value()),
                )
            )
        print(self.fields["city"].choices)
        if self["state"].value():
            # self.data["state"] = 12
            print(self["state"].value())
            self.fields["city"].choices = list(
                map(
                    lambda x: (x.city, x.city),
                    City.objects.filter(state=self["state"].value()),
                )
            )
        print(self.fields["city"].choices)

    def __str__(self):
        return ",".join(self.get_initial_for_field)


class PatientForm(EditProfileForm):
    email = forms.CharField()
    photo = forms.ImageField()

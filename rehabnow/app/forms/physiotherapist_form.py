from django import forms
from rehabnow.app.models import User


class PhysiotherapistForm(forms.ModelForm):
    password = forms.RegexField(
        "^(?=.*[^A-z\s\d][\\\^]?)(?=.*\d)(?=.*[a-zA-Z]).{8,}$",
        required=False,
        error_messages={
            "invalid": "Please enter password with at least 8 characters (including alphabet, digit and special character)"
        },
    )
    

    class Meta:
        model = User
        fields = ["email", "password"]

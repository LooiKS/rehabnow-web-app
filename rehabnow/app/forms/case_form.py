from django import forms
from rehabnow.app.models import Case


CASE_STATUSES = ["Under Treatment", "Recovered"]
PART_NAMES = [
    "Upper Right Limb",
    "Upper Left Limb",
    "Lower Right Limb",
    "Lower Left Limb",
]


class CaseForm(forms.ModelForm):
    # status = forms.ChoiceField(choices=list(map(lambda x: (x, x), CASE_STATUSES)))

    class Meta:
        model = Case
        # fields = "__all__"
        exclude = ["created_dt", "patient_id", "created_by", "status"]

    def __init__(self, *args, **kwargs):
        super(CaseForm, self).__init__(*args, **kwargs)
        # self.fields["patient_id"].required = False
        # self.fields["created_by"].required = False
        # self.fields["created_dt"].required = False

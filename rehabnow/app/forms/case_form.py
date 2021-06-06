from django import forms
from rehabnow.app.models import Case, Part, Target


CASE_STATUSES = ["Under Treatment", "Recovered"]
PART_NAMES = [
    "Upper Right Limb",
    "Upper Left Limb",
    "Lower Right Limb",
    "Lower Left Limb",
]


class CaseForm(forms.ModelForm):
    status = forms.ChoiceField(choices=list(map(lambda x: (x, x), CASE_STATUSES)))

    class Meta:
        model = Case
        # fields = "__all__"
        exclude = ["created_dt", "patient_id", "created_by"]

    def __init__(self, *args, **kwargs):
        super(CaseForm, self).__init__(*args, **kwargs)
        # self.fields["patient_id"].required = False
        # self.fields["created_by"].required = False
        # self.fields["created_dt"].required = False


class PartForm(forms.ModelForm):
    name = forms.ChoiceField(choices=list(map(lambda x: (x, x), PART_NAMES)))
    status = forms.ChoiceField(choices=list(map(lambda x: (x, x), CASE_STATUSES)))

    class Meta:
        model = Part
        # fields = "__all__"
        exclude = ["created_dt", "created_by", "recovery_dt", "case_id"]

    def __init__(self, *args, **kwargs):
        super(PartForm, self).__init__(*args, **kwargs)
        self.empty_permitted = False
        # self.fields["created_by"].required = False
        # self.fields["created_dt"].required = False
        # self.fields["recovery_dt"].required = False
        # self.fields["case_id"].required = False


TARGET_FREQUENCIES = [
    (1, "Once per day"),
    (2, "Twice per day"),
    (3, "Thrice per day"),
    (4, "Once every two days"),
    (5, "Once every three days"),
]


class TargetForm(forms.ModelForm):
    frequency = forms.ChoiceField(choices=TARGET_FREQUENCIES)

    class Meta:
        model = Target
        # fields = "__all__"
        exclude = ["created_dt", "created_by", "part_id"]

    def __init__(self, *args, **kwargs):
        super(TargetForm, self).__init__(*args, **kwargs)
        self.empty_permitted = False
        # self.fields["created_by"].required = False
        # self.fields["created_dt"].required = False
        # self.fields["part_id"].required = False

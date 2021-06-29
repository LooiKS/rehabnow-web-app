from rehabnow.app.forms.case_form import CASE_STATUSES
from django import forms
from rehabnow.app.models import Part


PART_NAMES = [
    "Upper Right Limb",
    "Upper Left Limb",
    "Lower Right Limb",
    "Lower Left Limb",
]


class PartForm(forms.ModelForm):
    name = forms.ChoiceField(choices=list(map(lambda x: (x, x), PART_NAMES)))
    status = forms.ChoiceField(choices=list(map(lambda x: (x, x), CASE_STATUSES)))
    recovery_dt = forms.DateField(required=False)

    class Meta:
        model = Part
        # fields = "__all__"
        exclude = ["created_dt", "created_by", "case_id"]

    def __init__(self, *args, **kwargs):
        super(PartForm, self).__init__(*args, **kwargs)
        self.empty_permitted = False
        if not self["name"].value():
            # is an edit form
            self.fields["status"].choices = [("Under Treatment", "Under Treatment")]

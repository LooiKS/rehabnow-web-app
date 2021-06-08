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
        # print(args)
        # initial = kwargs.get("initial")
        # if initial:
        #     patient = initial.get("patient")
        #     if patient:
        #         active_part_names = list(
        #             patient.cases.filter(parts__status="Under Treatment").values_list(
        #                 "parts__name", flat=True
        #             )
        #         )
        #         part_names_avail = list(
        #             filter(lambda x: x not in active_part_names, PART_NAMES)
        #         )
        #         print(part_names_avail)
        #         self.fields["name"] = forms.ChoiceField(
        #             choices=list(map(lambda x: (x, x), part_names_avail))
        #         )
        #         # print(self)
        #         # self.fields["name"] = list(map(lambda x: (x, x), PART_NAMES))
        self.empty_permitted = False
        if not self["name"].value():
            # is an edit form
            self.fields["status"].choices = [("Under Treatment", "Under Treatment")]
        print("Self init")
        # self.fields["created_by"].required = False
        # self.fields["created_dt"].required = False
        # self.fields["recovery_dt"].required = False
        # self.fields["case_id"].required = False

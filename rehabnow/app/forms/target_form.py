from django import forms
from rehabnow.app.models import Target


TARGET_FREQUENCIES = [
    (1, "Once per day"),
    (2, "Twice per day"),
    (3, "Thrice per day"),
    (4, "Once every two days"),
    (5, "Once every three days"),
]


class TargetForm(forms.ModelForm):
    frequency = forms.ChoiceField(choices=TARGET_FREQUENCIES)
    oscillation_num = forms.IntegerField()
    time_taken = forms.FloatField()

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

from django import template
from rehabnow.app.forms.target_form import TARGET_FREQUENCIES

register = template.Library()


@register.filter
def index(indexable, i):
    return indexable[i]


@register.filter
def get_frequency_desc(i):
    return list(filter(lambda x: x[0] == i, TARGET_FREQUENCIES))[0][1]

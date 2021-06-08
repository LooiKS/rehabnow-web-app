from rehabnow.app.models import Patient
from django.shortcuts import render
from django.contrib.auth.decorators import login_required, permission_required
import time


@login_required
@permission_required("app.web_permission")
def index(request):
    patients = Patient.objects.filter(physiotherapist=request.user.id)
    print(time.time())
    return render(request, "postlogin/index.html", {"patients": patients})

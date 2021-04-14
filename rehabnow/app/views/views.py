# from django.shortcuts import render
# from rest_framework import viewsets
# from rehabnow.app.models import User1
# from rehabnow.app.serializers import UserSerializer

# # Create your views here.
# class UserViewSet(viewsets.ModelViewSet):
#     queryset = User1.objects.all()
#     serializer_class = UserSerializer

from rest_framework import generics
from rehabnow.app.models import Snippet, User
from rehabnow.app.serializers import SnippetSerializer, UserSerializer

# from django.contrib.auth.models import User
from rest_framework import permissions
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth import (
    authenticate as django_authenticate,
    login as django_login,
    logout as django_logout,
)
from django.core.mail import send_mail, EmailMessage
from django.conf import settings
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.utils.encoding import force_bytes
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.decorators import login_required


@login_required
def index(request):
    users = User.objects.all()
    print(users)
    return render(request, "postlogin/index.html", {"users": users})
    # HttpResponse(",".join([s.language for s in users]))


def detail(request, id):
    return HttpResponse("detail %s" % id)


class SnippetList(generics.ListCreateAPIView):
    """
    List all code snippets, or create a new snippet.
    """

    queryset = Snippet.objects.all()
    serializer_class = SnippetSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        print(self.request.user)
        serializer.save(owner=self.request.user)


class SnippetDetail(generics.RetrieveUpdateDestroyAPIView):
    """
    Retrieve, update or delete a code snippet.
    """

    queryset = Snippet.objects.all()
    serializer_class = SnippetSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

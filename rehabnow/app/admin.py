from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import Group
from .models import User


class UserAdmin(UserAdmin):
    list_display = ("email", "dob", "is_admin")
    list_filter = ("is_admin",)
    fieldsets = (
        (None, {"fields": ("email", "password")}),
        ("Personal info", {"fields": ("dob",)}),
        ("Permissions", {"fields": ("is_admin",)}),
    )
    filter_horizontal = ()
    ordering = ("email",)


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)

# Generated by Django 3.1.3 on 2021-06-08 06:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0012_delete_snippet'),
    ]

    operations = [
        migrations.CreateModel(
            name='SupportPermission',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'permissions': (('web_permission', 'Access Web'), ('mobile_permission', 'Access Mobile')),
                'managed': False,
                'default_permissions': (),
            },
        ),
    ]

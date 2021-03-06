# Generated by Django 3.1.3 on 2021-04-16 03:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_auto_20210409_1612'),
    ]

    operations = [
        migrations.AlterField(
            model_name='city',
            name='state',
            field=models.ForeignKey(db_column='state', on_delete=django.db.models.deletion.CASCADE, related_name='cities', to='app.state'),
        ),
        migrations.AlterField(
            model_name='state',
            name='iso2',
            field=models.ForeignKey(db_column='iso2', on_delete=django.db.models.deletion.CASCADE, related_name='states', to='app.country'),
        ),
        migrations.AlterField(
            model_name='user',
            name='id',
            field=models.CharField(default='R0001097', max_length=20, primary_key=True, serialize=False, unique=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='state',
            field=models.IntegerField(),
        ),
    ]

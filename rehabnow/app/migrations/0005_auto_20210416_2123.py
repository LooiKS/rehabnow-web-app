# Generated by Django 3.1.3 on 2021-04-16 13:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_auto_20210416_1151'),
    ]

    operations = [
        migrations.CreateModel(
            name='Case',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
                ('status', models.CharField(max_length=50)),
                ('created_by', models.CharField(max_length=50)),
                ('created_dt', models.DateTimeField()),
                ('patient_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='cases', to='app.patient')),
            ],
        ),
        migrations.CreateModel(
            name='Part',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
                ('name', models.CharField(max_length=20)),
                ('recovery_dt', models.DateTimeField()),
                ('status', models.CharField(max_length=20)),
                ('created_dt', models.DateTimeField()),
                ('created_by', models.CharField(max_length=20)),
                ('case_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='parts', to='app.case')),
            ],
        ),
        migrations.AlterField(
            model_name='user',
            name='id',
            field=models.CharField(max_length=20, primary_key=True, serialize=False, unique=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='is_admin',
            field=models.BooleanField(default=False),
        ),
        migrations.CreateModel(
            name='Target',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_by', models.CharField(max_length=20)),
                ('created_dt', models.DateTimeField()),
                ('frequency', models.IntegerField()),
                ('oscillation_num', models.IntegerField()),
                ('time_taken', models.FloatField()),
                ('part_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='targets', to='app.part')),
            ],
        ),
        migrations.CreateModel(
            name='PredictedRecovery',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_by', models.CharField(max_length=20)),
                ('created_dt', models.DateTimeField()),
                ('recovery_dt', models.DateTimeField()),
                ('part_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='predicted_recoveries', to='app.part')),
            ],
        ),
        migrations.CreateModel(
            name='Exercise',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_dt', models.DateTimeField()),
                ('oscillation_num', models.IntegerField()),
                ('time_taken', models.FloatField()),
                ('done', models.BooleanField()),
                ('part_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='exercises', to='app.case')),
            ],
        ),
    ]
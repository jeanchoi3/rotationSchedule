# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Block',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('length', models.PositiveIntegerField(default=1)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='EducationReq',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('minLength', models.PositiveIntegerField(default=1)),
                ('maxLength', models.PositiveIntegerField(default=1)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('startDate', models.DateField(default=datetime.date.today)),
                ('endDate', models.DateField(default=datetime.date.today)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Program',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('startDate', models.DateField(default=datetime.date.today)),
                ('endDate', models.DateField(default=datetime.date.today)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Resident',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('inProgram', models.BooleanField(default=True)),
                ('vacationStart1', models.DateField(null=True, blank=True)),
                ('vacationEnd1', models.DateField(null=True, blank=True)),
                ('vacationStart2', models.DateField(null=True, blank=True)),
                ('vacationEnd2', models.DateField(null=True, blank=True)),
                ('vacationStart3', models.DateField(null=True, blank=True)),
                ('vacationEnd3', models.DateField(null=True, blank=True)),
                ('vacationPreference', models.IntegerField(default=5, help_text=b'Weight out of 10, indicating importance versus elective, e.g. 5 = vacation and elective are of equal importance; 10 = only vacation is important', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(10)])),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Rotation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('minResidents', models.PositiveIntegerField(default=1)),
                ('maxResidents', models.PositiveIntegerField(default=1)),
                ('isElective', models.BooleanField(default=False)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RotationLength',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('minLength', models.PositiveIntegerField(default=1)),
                ('maxLength', models.PositiveIntegerField(default=1)),
                ('block', models.ForeignKey(to='rotationSchedule_app.Block')),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Schedule',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('utility', models.FloatField(default=0)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Track',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Year',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'PGY1', max_length=200)),
                ('requiredRotations', models.ManyToManyField(related_name=b'requiredRotations', through='rotationSchedule_app.EducationReq', to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='YearDemand',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('minResidents', models.PositiveIntegerField(default=1)),
                ('maxResidents', models.PositiveIntegerField(default=1)),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
                ('year', models.ForeignKey(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='year',
            name='rotationDemand',
            field=models.ManyToManyField(related_name=b'rotationDemand', through='rotationSchedule_app.YearDemand', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective1',
            field=models.ForeignKey(related_name=b'elective1', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective2',
            field=models.ForeignKey(related_name=b'elective2', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective3',
            field=models.ForeignKey(related_name=b'elective3', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective4',
            field=models.ForeignKey(related_name=b'elective4', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='tracks',
            field=models.ManyToManyField(default=None, related_name=b'tracks', null=True, to='rotationSchedule_app.Track', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='year',
            field=models.ForeignKey(to='rotationSchedule_app.Year', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='resident',
            field=models.ForeignKey(to='rotationSchedule_app.Resident'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='rotation',
            field=models.ForeignKey(to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='schedule',
            field=models.ForeignKey(to='rotationSchedule_app.Schedule'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='educationreq',
            name='rotation',
            field=models.ForeignKey(to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='educationreq',
            name='year',
            field=models.ForeignKey(to='rotationSchedule_app.Year'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='block',
            name='includedRotation',
            field=models.ManyToManyField(related_name=b'includedRotation', through='rotationSchedule_app.RotationLength', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
    ]

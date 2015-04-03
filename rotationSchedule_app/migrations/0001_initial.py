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
                ('maxNumRotations', models.PositiveIntegerField(default=5)),
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
                ('minClinicWeeks', models.IntegerField(default=0)),
                ('windowSize', models.IntegerField(default=0)),
                ('rigidXY', models.BooleanField(default=False, help_text=b'Check box if your program has a rigid X+Y or X+Y+Z structure that cannot be violated.  If this is a preference that can be violated, do not check the box.')),
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
                ('email', models.EmailField(max_length=100, null=True, blank=True)),
                ('inProgram', models.BooleanField(default=True)),
                ('vacationStart1', models.DateField(null=True, blank=True)),
                ('vacationEnd1', models.DateField(null=True, blank=True)),
                ('vacationStart2', models.DateField(null=True, blank=True)),
                ('vacationEnd2', models.DateField(null=True, blank=True)),
                ('vacationStart3', models.DateField(null=True, blank=True)),
                ('vacationEnd3', models.DateField(null=True, blank=True)),
                ('vacationPreference', models.IntegerField(default=5, help_text=b'Weight out of 10, indicating importance versus elective, e.g. 5 = vacation and elective are of equal importance; 10 = only vacation is important', validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(10)])),
                ('couple', models.ForeignKey(related_name=b'couple_match', blank=True, to='rotationSchedule_app.Resident', null=True)),
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
                ('minResidents', models.PositiveIntegerField(default=0)),
                ('maxResidents', models.PositiveIntegerField(default=100)),
                ('isElective', models.BooleanField(default=False)),
                ('recurrenceWindow', models.IntegerField(default=0, help_text=b'The number of weeks within which you would like this rotation to recur; i.e. in a window of X weeks, I would like residents to complete 2 weeks of this rotation')),
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
            name='Template',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('templateName', models.CharField(max_length=200)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TemplateEvent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('blockStartDate', models.DateField(default=datetime.date.today)),
                ('blockEndDate', models.DateField(default=datetime.date.today)),
                ('block', models.ForeignKey(to='rotationSchedule_app.Block')),
                ('template', models.ForeignKey(to='rotationSchedule_app.Template')),
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
                ('excludedBlocks', models.ManyToManyField(default=None, related_name=b'excludedBlocks', to='rotationSchedule_app.TemplateEvent', blank=True)),
                ('trackRequiredRotations', models.ManyToManyField(related_name=b'trackRequiredRotations', to='rotationSchedule_app.Rotation')),
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
                ('yearNum', models.PositiveIntegerField(default=1)),
                ('requiredRotations', models.ManyToManyField(related_name=b'requiredRotations', to='rotationSchedule_app.Rotation')),
                ('rotationDemand', models.ManyToManyField(related_name=b'rotationDemand', to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='template',
            name='templateYears',
            field=models.ManyToManyField(default=None, related_name=b'templateYears', to='rotationSchedule_app.Year', blank=True),
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
            name='elective10',
            field=models.ForeignKey(related_name=b'elective10', blank=True, to='rotationSchedule_app.Rotation', null=True),
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
            name='elective5',
            field=models.ForeignKey(related_name=b'elective5', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective6',
            field=models.ForeignKey(related_name=b'elective6', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective7',
            field=models.ForeignKey(related_name=b'elective7', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective8',
            field=models.ForeignKey(related_name=b'elective8', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective9',
            field=models.ForeignKey(related_name=b'elective9', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='resExcludedBlocks',
            field=models.ManyToManyField(default=None, related_name=b'resExcludedBlocks', to='rotationSchedule_app.TemplateEvent', blank=True),
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
            model_name='block',
            name='includedRotation',
            field=models.ManyToManyField(related_name=b'includedRotation', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='RotationSet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rotationSet_name', models.CharField(max_length=200)),
                ('rotationSetEduReq', models.ManyToManyField(related_name=b'rotationSetEduReq', to='rotationSchedule_app.Year')),
                ('rotations', models.ManyToManyField(to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='setEduReq',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('setEduReq_set', models.ForeignKey(to='rotationSchedule_app.RotationSet')),
                ('setEduReq_year', models.ForeignKey(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

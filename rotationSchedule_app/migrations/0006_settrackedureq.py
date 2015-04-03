# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0005_remove_rotationset_rotationsetedureq'),
    ]

    operations = [
        migrations.CreateModel(
            name='setTrackEduReq',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('setTrackEduReq_minLength', models.PositiveIntegerField(default=0)),
                ('setTrackEduReq_maxLength', models.PositiveIntegerField(default=100)),
                ('setTrackEduReq_set', models.ForeignKey(to='rotationSchedule_app.RotationSet')),
                ('setTrackEduReq_track', models.ForeignKey(to='rotationSchedule_app.Track')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

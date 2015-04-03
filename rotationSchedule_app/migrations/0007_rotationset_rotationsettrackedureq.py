# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0006_settrackedureq'),
    ]

    operations = [
        migrations.AddField(
            model_name='rotationset',
            name='rotationSetTrackEduReq',
            field=models.ManyToManyField(related_name=b'rotationSetTrackEduReq', through='rotationSchedule_app.setTrackEduReq', to='rotationSchedule_app.Track'),
            preserve_default=True,
        ),
    ]

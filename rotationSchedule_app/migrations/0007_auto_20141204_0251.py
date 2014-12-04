# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0006_resident_tracks'),
    ]

    operations = [
        migrations.AlterField(
            model_name='resident',
            name='tracks',
            field=models.ManyToManyField(default=None, related_name=b'tracks', null=True, to=b'rotationSchedule_app.Track'),
        ),
    ]

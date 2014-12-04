# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0005_resident_year'),
    ]

    operations = [
        migrations.AddField(
            model_name='resident',
            name='tracks',
            field=models.ManyToManyField(default=None, related_name=b'tracks', null=True, to='rotationSchedule_app.Track', blank=True),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0011_setyeardemand'),
    ]

    operations = [
        migrations.AddField(
            model_name='yearset',
            name='setRotationDemand',
            field=models.ManyToManyField(related_name=b'setRotationDemand', through='rotationSchedule_app.SetYearDemand', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0015_auto_20150121_2118'),
    ]

    operations = [
        migrations.AddField(
            model_name='rotation',
            name='maxResidents',
            field=models.PositiveIntegerField(default=1),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='rotation',
            name='minResidents',
            field=models.PositiveIntegerField(default=1),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0018_auto_20150207_1907'),
    ]

    operations = [
        migrations.AddField(
            model_name='yeardemand',
            name='maxResidents',
            field=models.PositiveIntegerField(default=1),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='yeardemand',
            name='minResidents',
            field=models.PositiveIntegerField(default=1),
            preserve_default=True,
        ),
    ]

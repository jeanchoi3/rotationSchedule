# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0003_auto_20150226_2234'),
    ]

    operations = [
        migrations.AddField(
            model_name='program',
            name='rigidXY',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]

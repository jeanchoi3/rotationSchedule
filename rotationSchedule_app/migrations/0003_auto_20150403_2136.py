# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0002_rotationset_setedureq'),
    ]

    operations = [
        migrations.AddField(
            model_name='setedureq',
            name='setEduReq_maxLength',
            field=models.PositiveIntegerField(default=100),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='setedureq',
            name='setEduReq_minLength',
            field=models.PositiveIntegerField(default=0),
            preserve_default=True,
        ),
    ]

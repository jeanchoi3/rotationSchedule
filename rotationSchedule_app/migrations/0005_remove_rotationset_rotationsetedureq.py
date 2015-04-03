# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0004_rotationset_rotationsetedureq2'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rotationset',
            name='rotationSetEduReq',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0007_rotationset_rotationsettrackedureq'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='track',
            name='excludedBlocks',
        ),
    ]

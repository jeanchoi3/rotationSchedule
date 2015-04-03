# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0008_remove_track_excludedblocks'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='resident',
            name='resExcludedBlocks',
        ),
    ]

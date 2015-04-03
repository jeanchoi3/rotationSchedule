# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0013_resident_resexcludedblocks'),
    ]

    operations = [
        migrations.AddField(
            model_name='track',
            name='excludedBlocks',
            field=models.ManyToManyField(default=None, related_name=b'excludedBlocks', to='rotationSchedule_app.TemplateEvent', blank=True),
            preserve_default=True,
        ),
    ]

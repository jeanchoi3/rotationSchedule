# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0012_yearset_setrotationdemand'),
    ]

    operations = [
        migrations.AddField(
            model_name='resident',
            name='resExcludedBlocks',
            field=models.ManyToManyField(default=None, related_name=b'resExcludedBlocks', to='rotationSchedule_app.TemplateEvent', blank=True),
            preserve_default=True,
        ),
    ]

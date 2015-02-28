# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0008_remove_templateevent_year'),
    ]

    operations = [
        migrations.AddField(
            model_name='resident',
            name='email',
            field=models.EmailField(max_length=100, null=True, blank=True),
            preserve_default=True,
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0020_auto_20150209_1717'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schedule',
            name='utility',
            field=models.FloatField(default=0),
        ),
    ]

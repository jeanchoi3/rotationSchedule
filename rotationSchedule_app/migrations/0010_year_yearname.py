# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0009_auto_20141204_1903'),
    ]

    operations = [
        migrations.AddField(
            model_name='year',
            name='yearName',
            field=models.CharField(default=b'default', max_length=200),
            preserve_default=True,
        ),
    ]

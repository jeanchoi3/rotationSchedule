# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0013_auto_20141205_0347'),
    ]

    operations = [
        migrations.AddField(
            model_name='program',
            name='endDate',
            field=models.DateField(default=datetime.date.today),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='program',
            name='startDate',
            field=models.DateField(default=datetime.date.today),
            preserve_default=True,
        ),
    ]

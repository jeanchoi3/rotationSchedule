# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0002_auto_20150314_2014'),
    ]

    operations = [
        migrations.AddField(
            model_name='year',
            name='yearNum',
            field=models.PositiveIntegerField(default=1),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='rotation',
            name='maxResidents',
            field=models.PositiveIntegerField(default=100),
        ),
        migrations.AlterField(
            model_name='rotation',
            name='minResidents',
            field=models.PositiveIntegerField(default=0),
        ),
    ]

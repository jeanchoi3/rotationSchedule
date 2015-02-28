# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0009_resident_email'),
    ]

    operations = [
        migrations.AlterField(
            model_name='template',
            name='templateYears',
            field=models.ManyToManyField(default=None, related_name=b'templateYears', to=b'rotationSchedule_app.Year', blank=True),
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0004_remove_resident_year'),
    ]

    operations = [
        migrations.AddField(
            model_name='resident',
            name='year',
            field=models.ForeignKey(to='rotationSchedule_app.Year', null=True),
            preserve_default=True,
        ),
    ]

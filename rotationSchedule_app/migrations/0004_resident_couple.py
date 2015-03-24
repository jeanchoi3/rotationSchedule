# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0003_auto_20150323_1901'),
    ]

    operations = [
        migrations.AddField(
            model_name='resident',
            name='couple',
            field=models.ForeignKey(related_name=b'couple_match', blank=True, to='rotationSchedule_app.Resident', null=True),
            preserve_default=True,
        ),
    ]

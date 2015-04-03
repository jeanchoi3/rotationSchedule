# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0003_auto_20150403_2136'),
    ]

    operations = [
        migrations.AddField(
            model_name='rotationset',
            name='rotationSetEduReq2',
            field=models.ManyToManyField(related_name=b'rotationSetEduReq2', through='rotationSchedule_app.setEduReq', to='rotationSchedule_app.Year'),
            preserve_default=True,
        ),
    ]

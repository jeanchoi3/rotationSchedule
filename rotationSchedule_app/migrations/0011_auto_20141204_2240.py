# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0010_year_yearname'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='year',
            name='yearName',
        ),
        migrations.AddField(
            model_name='year',
            name='name',
            field=models.CharField(default=b'PGY1', max_length=200),
            preserve_default=True,
        ),
    ]

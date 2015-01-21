# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0014_auto_20141205_1625'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rotation',
            name='demandTotal',
        ),
        migrations.RemoveField(
            model_name='rotation',
            name='demandYear',
        ),
        migrations.RemoveField(
            model_name='rotation',
            name='isElective',
        ),
        migrations.RemoveField(
            model_name='rotation',
            name='length',
        ),
    ]

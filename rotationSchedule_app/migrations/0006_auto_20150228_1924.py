# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0005_template'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='templateevent',
            name='block',
        ),
        migrations.RemoveField(
            model_name='templateevent',
            name='year',
        ),
        migrations.DeleteModel(
            name='TemplateEvent',
        ),
    ]

# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0008_rotation'),
    ]

    operations = [
        migrations.RenameField(
            model_name='resident',
            old_name='in_program',
            new_name='inProgram',
        ),
        migrations.RemoveField(
            model_name='year',
            name='name',
        ),
        migrations.AddField(
            model_name='rotation',
            name='isElective',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]

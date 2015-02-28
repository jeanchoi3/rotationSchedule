# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0004_program_rigidxy'),
    ]

    operations = [
        migrations.CreateModel(
            name='Template',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('templateName', models.CharField(max_length=200)),
                ('templateYears', models.ManyToManyField(default=None, related_name=b'templateYears', null=True, to='rotationSchedule_app.Year', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

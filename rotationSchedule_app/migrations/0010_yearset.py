# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0009_remove_resident_resexcludedblocks'),
    ]

    operations = [
        migrations.CreateModel(
            name='YearSet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('yearSet_name', models.CharField(max_length=200)),
                ('years', models.ManyToManyField(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

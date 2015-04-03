# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0010_yearset'),
    ]

    operations = [
        migrations.CreateModel(
            name='SetYearDemand',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('setYearDemand_minResidents', models.PositiveIntegerField(default=0)),
                ('setYearDemand_maxResidents', models.PositiveIntegerField(default=100)),
                ('setYearDemand_rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
                ('setYearDemand_yearSet', models.ForeignKey(to='rotationSchedule_app.YearSet')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

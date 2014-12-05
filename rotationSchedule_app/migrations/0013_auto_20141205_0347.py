# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0012_remove_resident_track'),
    ]

    operations = [
        migrations.CreateModel(
            name='YearDemand',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('demand', models.PositiveIntegerField(default=0)),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
                ('year', models.ForeignKey(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='rotation',
            name='demandYear',
            field=models.ManyToManyField(default=None, to='rotationSchedule_app.Year', null=True, through='rotationSchedule_app.YearDemand', blank=True),
            preserve_default=True,
        ),
    ]

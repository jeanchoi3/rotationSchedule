# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0019_auto_20150207_1922'),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('startDate', models.DateField(default=datetime.date.today)),
                ('endDate', models.DateField(default=datetime.date.today)),
                ('resident', models.ForeignKey(to='rotationSchedule_app.Resident')),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Schedule',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('utility', models.DecimalField(default=0, max_digits=10, decimal_places=9)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='event',
            name='schedule',
            field=models.ForeignKey(to='rotationSchedule_app.Schedule'),
            preserve_default=True,
        ),
    ]

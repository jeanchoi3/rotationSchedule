# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0006_auto_20150228_1924'),
    ]

    operations = [
        migrations.CreateModel(
            name='TemplateEvent',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('blockStartDate', models.DateField(default=datetime.date.today)),
                ('blockEndDate', models.DateField(default=datetime.date.today)),
                ('block', models.ForeignKey(to='rotationSchedule_app.Block')),
                ('template', models.ForeignKey(to='rotationSchedule_app.Template')),
                ('year', models.ForeignKey(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]

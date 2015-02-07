# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0017_block'),
    ]

    operations = [
        migrations.CreateModel(
            name='EducationReq',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('minLength', models.PositiveIntegerField(default=1)),
                ('maxLength', models.PositiveIntegerField(default=1)),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
                ('year', models.ForeignKey(to='rotationSchedule_app.Year')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RotationLength',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('minLength', models.PositiveIntegerField(default=1)),
                ('maxLength', models.PositiveIntegerField(default=1)),
                ('block', models.ForeignKey(to='rotationSchedule_app.Block')),
                ('rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.DeleteModel(
            name='Greeting',
        ),
        migrations.RemoveField(
            model_name='yeardemand',
            name='demand',
        ),
        migrations.AddField(
            model_name='block',
            name='includedRotation',
            field=models.ManyToManyField(related_name=b'includedRotation', through='rotationSchedule_app.RotationLength', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='year',
            name='requiredRotations',
            field=models.ManyToManyField(related_name=b'requiredRotations', through='rotationSchedule_app.EducationReq', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='year',
            name='rotationDemand',
            field=models.ManyToManyField(related_name=b'rotationDemand', through='rotationSchedule_app.YearDemand', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='resident',
            name='tracks',
            field=models.ManyToManyField(default=None, related_name=b'tracks', null=True, to=b'rotationSchedule_app.Track', blank=True),
        ),
    ]

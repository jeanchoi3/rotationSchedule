# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rotationSchedule_app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='TrackEducationReq',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('trackEducationReq_minLength', models.PositiveIntegerField(default=1)),
                ('trackEducationReq_maxLength', models.PositiveIntegerField(default=100)),
                ('trackEducationReq_rotation', models.ForeignKey(to='rotationSchedule_app.Rotation')),
                ('trackEducationReq_track', models.ForeignKey(to='rotationSchedule_app.Track')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='block',
            name='maxNumRotations',
            field=models.PositiveIntegerField(default=5),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective10',
            field=models.ForeignKey(related_name=b'elective10', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective5',
            field=models.ForeignKey(related_name=b'elective5', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective6',
            field=models.ForeignKey(related_name=b'elective6', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective7',
            field=models.ForeignKey(related_name=b'elective7', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective8',
            field=models.ForeignKey(related_name=b'elective8', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='resident',
            name='elective9',
            field=models.ForeignKey(related_name=b'elective9', blank=True, to='rotationSchedule_app.Rotation', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='track',
            name='trackRequiredRotations',
            field=models.ManyToManyField(related_name=b'trackRequiredRotations', through='rotationSchedule_app.TrackEducationReq', to='rotationSchedule_app.Rotation'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='educationreq',
            name='maxLength',
            field=models.PositiveIntegerField(default=100),
        ),
        migrations.AlterField(
            model_name='rotationlength',
            name='maxLength',
            field=models.PositiveIntegerField(default=100),
        ),
        migrations.AlterField(
            model_name='yeardemand',
            name='maxResidents',
            field=models.PositiveIntegerField(default=100),
        ),
    ]

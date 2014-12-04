import datetime

from django.db import models
from django.utils import timezone


YEARS = (('PGY1','PGY1'),('PGY2','PGY2'),('PGY3','PGY3'),)
TRACKS = (('track1','track1'),('track2','track2'),('track3','track3'),)

# Create your models here.
class Greeting(models.Model):
    when = models.DateTimeField('date created', auto_now_add=True)

#Year
class Year(models.Model):
    def __str__(self):
        return self.name
	name = models.CharField(max_length=200)
    yearName = models.CharField(max_length=200,default='default')

#Track
class Track(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)

#Program
class Program(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)

#Resident
class Resident(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    year = models.ForeignKey('Year', null=True) #each resident can only be in one year
    track = models.CharField(max_length=200,choices=TRACKS)
    tracks = models.ManyToManyField('Track', null=True, default=None, related_name='tracks')
    inProgram = models.BooleanField(default=True)

#Rotation
class Rotation(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    length = models.PositiveIntegerField(default=1)
    demandTotal = models.PositiveIntegerField(default=1)
    isElective = models.BooleanField(default=False)
# year and track related demand
# track, year, and program min and max
# accommodates vacation or weekends?
# is an elective?
#


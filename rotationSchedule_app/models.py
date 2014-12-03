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
	name = models.CharField(max_length=200)

#Track
class Track(models.Model):
    name = models.CharField(max_length=200)

#Program
class Program(models.Model):
    name = models.CharField(max_length=200)

#Resident
class Resident(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    year = models.ForeignKey('Year', null=True)
    track = models.CharField(max_length=200,choices=TRACKS)
    in_program = models.BooleanField(default=True)

#class Year(models.Model):
#    name = models.CharField(max_length=200)
#add min and max for each rotation here?

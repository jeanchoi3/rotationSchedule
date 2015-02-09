import datetime

from django.db import models
from django.utils import timezone

#Rotation
class Rotation(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    minResidents = models.PositiveIntegerField(default=1)
    maxResidents = models.PositiveIntegerField(default=1)

#Year
class Year(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200, default='PGY1')
    requiredRotations = models.ManyToManyField(Rotation, related_name='requiredRotations', through='EducationReq')
    rotationDemand = models.ManyToManyField(Rotation, related_name='rotationDemand',through='YearDemand')

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
    startDate = models.DateField(default=datetime.date.today)
    endDate = models.DateField(default=datetime.date.today)

#Resident
class Resident(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    year = models.ForeignKey('Year', null=True) #each resident can only be in one year
    tracks = models.ManyToManyField('Track', null=True, blank=True,default=None, related_name='tracks')
    inProgram = models.BooleanField(default=True)

#Block
class Block(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    length = models.PositiveIntegerField(default=1)
    includedRotation = models.ManyToManyField(Rotation, related_name='includedRotation',through='RotationLength')

# the block-dependent length of a rotation
class RotationLength(models.Model):
    rotation = models.ForeignKey(Rotation)
    block = models.ForeignKey(Block)
    minLength = models.PositiveIntegerField(default=1)
    maxLength = models.PositiveIntegerField(default=1) 

#Demand by year, through field for rotation field demandYear
class YearDemand(models.Model):
    rotation = models.ForeignKey('Rotation')
    year = models.ForeignKey('Year')
    minResidents = models.PositiveIntegerField(default=1)
    maxResidents = models.PositiveIntegerField(default=1)
    #demand = models.PositiveIntegerField(default=0)

#Education requirements for weeks of rotation for a year
class EducationReq(models.Model):
    year = models.ForeignKey(Year)
    rotation = models.ForeignKey(Rotation)
    minLength = models.PositiveIntegerField(default=1)
    maxLength = models.PositiveIntegerField(default=1)

class Schedule(models.Model):
    name = models.CharField(max_length=200)
    utility = models.FloatField(default=0)

class Event(models.Model):
    resident = models.ForeignKey(Resident)
    rotation = models.ForeignKey(Rotation)
    startDate = models.DateField(default=datetime.date.today)
    endDate = models.DateField(default=datetime.date.today)
    schedule = models.ForeignKey(Schedule)





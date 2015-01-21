import datetime

from django.db import models
from django.utils import timezone

# Create your models here.
class Greeting(models.Model):
    when = models.DateTimeField('date created', auto_now_add=True)

#Year
class Year(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200, default='PGY1')

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
    tracks = models.ManyToManyField('Track', null=True, default=None, related_name='tracks')
    inProgram = models.BooleanField(default=True)

#Rotation
class Rotation(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    minResidents = models.PositiveIntegerField(default=1)
    maxResidents = models.PositiveIntegerField(default=1)
    #length = models.PositiveIntegerField(default=1)
    #demandTotal = models.PositiveIntegerField(default=1)
    #demandYear = models.ManyToManyField('Year',blank=True,null=True,default=None,through='YearDemand')
    #isElective = models.BooleanField(default=False)
# year and track related demand
# track, year, and program min and max
# accommodates vacation or weekends?
# is an elective?
#

#Demand by year, through field for rotation field demandYear
class YearDemand(models.Model):
    rotation = models.ForeignKey('Rotation')
    year = models.ForeignKey('Year')
    demand = models.PositiveIntegerField(default=0)









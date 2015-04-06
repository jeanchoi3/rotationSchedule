import datetime
from django.db import models
from django.utils import timezone
from django.core.validators import MinValueValidator, MaxValueValidator
from adaptor.model import CsvModel
from adaptor import fields as adaptor_fields

#Rotation
class Rotation(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    minResidents = models.PositiveIntegerField(default=0)
    maxResidents = models.PositiveIntegerField(default=100)
    isElective = models.BooleanField(default=False)
    recurrenceWindow = models.IntegerField(default=0,help_text='The number of weeks within which you would like this rotation to recur; i.e. in a window of X weeks, I would like residents to complete 2 weeks of this rotation')

class RotationModel(CsvModel):
    name = adaptor_fields.CharField()
    minResidents = adaptor_fields.IgnoredField()
    maxResidents = adaptor_fields.IgnoredField()
    isElective = adaptor_fields.BooleanField()
    recurrenceWindow = adaptor_fields.IntegerField()

    class Meta:
        dbModel = Rotation
        delimiter=","
        has_header = True

#Year
class Year(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200, default='PGY1')
    yearNum = models.PositiveIntegerField(default=1)
    requiredRotations = models.ManyToManyField(Rotation, related_name='requiredRotations',through='EducationReq') #, through='EducationReq'
    rotationDemand = models.ManyToManyField(Rotation, related_name='rotationDemand',through='YearDemand')

#Program
class Program(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    startDate = models.DateField(default=datetime.date.today)
    endDate = models.DateField(default=datetime.date.today)
    minClinicWeeks = models.IntegerField(default=0)
    windowSize = models.IntegerField(default=0)
    rigidXY = models.BooleanField(default=False,help_text='Check box if your program has a rigid X+Y or X+Y+Z structure that cannot be violated.  If this is a preference that can be violated, do not check the box.')

#Block
class Block(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    length = models.PositiveIntegerField(default=1)
    maxNumRotations = models.PositiveIntegerField(default=5)
    includedRotation = models.ManyToManyField(Rotation, related_name='includedRotation',through='RotationLength')

# the block-dependent length of a rotation
class RotationLength(models.Model):
    #class Meta():
    #    auto_created=True
    rotation = models.ForeignKey(Rotation)
    block = models.ForeignKey(Block)
    minLength = models.PositiveIntegerField(default=0)
    maxLength = models.PositiveIntegerField(default=100) 

#Demand by year, through field for year field rotationDemand
class YearDemand(models.Model):
    class Meta():
        auto_created=True
    rotation = models.ForeignKey('Rotation')
    year = models.ForeignKey('Year')
    minResidents = models.PositiveIntegerField(default=0)
    maxResidents = models.PositiveIntegerField(default=100)

#Education requirements for weeks of rotation for a year
class EducationReq(models.Model):
    class Meta():
        auto_created=True
    year = models.ForeignKey(Year)
    rotation = models.ForeignKey(Rotation)
    minLength = models.PositiveIntegerField(default=0)
    maxLength = models.PositiveIntegerField(default=100)


class Schedule(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    utility = models.FloatField(default=0)


class Template(models.Model):
    def __str__(self):
        return self.templateName
    templateName = models.CharField(max_length=200)
    templateYears = models.ManyToManyField('Year', blank=True, default=None, related_name='templateYears')


class TemplateEvent(models.Model):
    def __str__(self):
        return str(self.blockStartDate)+" to "+str(self.blockEndDate)+", "+str(self.template.templateName)
    block = models.ForeignKey(Block)
    template = models.ForeignKey(Template)
    blockStartDate = models.DateField(default=datetime.date.today)
    blockEndDate = models.DateField(default=datetime.date.today)

#Track
class Track(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    trackRequiredRotations = models.ManyToManyField(Rotation, related_name='trackRequiredRotations', through='TrackEducationReq')
    excludedBlocks = models.ManyToManyField(TemplateEvent, related_name='excludedBlocks',blank=True,default=None)

#Education requirements for weeks of rotation for a track
class TrackEducationReq(models.Model):
    class Meta():
        auto_created=True
    trackEducationReq_track = models.ForeignKey(Track)
    trackEducationReq_rotation = models.ForeignKey(Rotation)
    trackEducationReq_minLength = models.PositiveIntegerField(default=0)
    trackEducationReq_maxLength = models.PositiveIntegerField(default=100)

#Resident
class Resident(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=200)
    email = models.EmailField(max_length=100, null=True, blank=True)
    year = models.ForeignKey('Year', null=True) #each resident can only be in one year
    tracks = models.ManyToManyField('Track', null=True, blank=True,default=None, related_name='tracks')
    inProgram = models.BooleanField(default=True)
    vacationStart1 = models.DateField(null=True, blank=True)
    vacationEnd1 = models.DateField(null=True, blank=True)
    vacationStart2 = models.DateField(null=True, blank=True)
    vacationEnd2 = models.DateField(null=True, blank=True) 
    vacationStart3 = models.DateField(null=True, blank=True)
    vacationEnd3 = models.DateField(null=True, blank=True)
    elective1 = models.ForeignKey(Rotation, related_name='elective1',limit_choices_to={'isElective':True},null=True,blank=True)
    elective2 = models.ForeignKey(Rotation, related_name='elective2',limit_choices_to={'isElective':True},null=True,blank=True)
    elective3 = models.ForeignKey(Rotation, related_name='elective3',limit_choices_to={'isElective':True},null=True,blank=True)
    elective4 = models.ForeignKey(Rotation, related_name='elective4',limit_choices_to={'isElective':True},null=True,blank=True)
    elective5 = models.ForeignKey(Rotation, related_name='elective5',limit_choices_to={'isElective':True},null=True,blank=True)
    elective6 = models.ForeignKey(Rotation, related_name='elective6',limit_choices_to={'isElective':True},null=True,blank=True)
    elective7 = models.ForeignKey(Rotation, related_name='elective7',limit_choices_to={'isElective':True},null=True,blank=True)
    elective8 = models.ForeignKey(Rotation, related_name='elective8',limit_choices_to={'isElective':True},null=True,blank=True)
    elective9 = models.ForeignKey(Rotation, related_name='elective9',limit_choices_to={'isElective':True},null=True,blank=True)
    elective10 = models.ForeignKey(Rotation, related_name='elective10',limit_choices_to={'isElective':True},null=True,blank=True)
    vacationPreference = models.IntegerField(validators=[MinValueValidator(0),MaxValueValidator(10)],default=5,help_text='Weight out of 10, indicating importance versus elective, e.g. 5 = vacation and elective are of equal importance; 10 = only vacation is important')
    couple = models.ForeignKey('self',related_name='couple_match',null=True,blank=True)
    resExcludedBlocks = models.ManyToManyField(TemplateEvent, related_name='resExcludedBlocks',blank=True,default=None)

    #http://stackoverflow.com/questions/291945/how-do-i-filter-foreignkey-choices-in-a-django-modelform

  
class Event(models.Model):
    resident = models.ForeignKey(Resident)
    rotation = models.ForeignKey(Rotation)
    startDate = models.DateField(default=datetime.date.today)
    endDate = models.DateField(default=datetime.date.today)
    schedule = models.ForeignKey(Schedule)
    def _get_resident_name(self):
        "Returns resident's name"
        return '%s' %(self.resident)
    resident_name = property(_get_resident_name)

class RotationSet(models.Model):
    rotationSet_name = models.CharField(max_length=200)
    rotations = models.ManyToManyField(Rotation)
    rotationSetEduReq2 = models.ManyToManyField(Year, related_name='rotationSetEduReq2', through='setEduReq') #, through='setEduReq'
    rotationSetTrackEduReq = models.ManyToManyField(Track, related_name='rotationSetTrackEduReq', through='setTrackEduReq')

class setEduReq(models.Model):
    setEduReq_year = models.ForeignKey(Year)
    setEduReq_set = models.ForeignKey(RotationSet)
    setEduReq_minLength = models.PositiveIntegerField(default=0)
    setEduReq_maxLength = models.PositiveIntegerField(default=100)

    # class Meta():
    #     auto_created=True

class setTrackEduReq(models.Model):
    setTrackEduReq_track = models.ForeignKey(Track)
    setTrackEduReq_set = models.ForeignKey(RotationSet)
    setTrackEduReq_minLength = models.PositiveIntegerField(default=0)
    setTrackEduReq_maxLength = models.PositiveIntegerField(default=100)
#     class Meta():
#         auto_created=True

class YearSet(models.Model):
    yearSet_name = models.CharField(max_length=200)
    years = models.ManyToManyField(Year)
    setRotationDemand = models.ManyToManyField(Rotation, related_name='setRotationDemand',through='SetYearDemand')


class SetYearDemand(models.Model):
    setYearDemand_rotation = models.ForeignKey('Rotation')
    setYearDemand_yearSet = models.ForeignKey('YearSet')
    setYearDemand_minResidents = models.PositiveIntegerField(default=0)
    setYearDemand_maxResidents = models.PositiveIntegerField(default=100)
#     class Meta():
#         auto_created=True




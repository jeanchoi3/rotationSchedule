from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Block, Resident, Year, Track, Program, Rotation, Event, Schedule, Template, TemplateEvent
import copy
import random
import operator
import sys
#import numpy as np
import logging
import os
from django.conf import settings
import datetime
from dateutil.rrule import rrule, WEEKLY

logging.basicConfig(stream=sys.stdout, format='%(message)s',level=logging.INFO)


class Command(BaseCommand):
	args = '<event_pk event_start event_end>'
	option_list = BaseCommand.option_list + (
    	make_option('--long', '-l', dest='long',
    		help='Help for the long options'),
    	)
	help = 'Help text goes here'
	
	def handle(self, *args, **options):
		os.chdir(os.path.join(os.path.dirname(os.path.abspath(settings.BASE_DIR)), 'rotationSchedule_app/management/commands'))
		f = open('test.dat', 'w+')

############ Rotations ##################################################
		all_rotations = Rotation.objects.all()

		rotation_names = []
		total_demand_lower = dict()
		total_demand_upper = dict()
		
		f.write("set R := 'Vacation' ") # vacation manually added as a rotation

		for rotation in all_rotations:
			f.write("'"+str(rotation.name)+"' ")
			total_demand_lower[str(rotation.name)] = rotation.minResidents
			total_demand_upper[str(rotation.name)] = rotation.maxResidents
            #rotation_names.append(str(rotation.name))

		f.write(";\n")

############ Years #######################################################
		all_years = Year.objects.all()
		YDoctors = dict()
		template_year_to_pk = dict() #used to find DBlocks, filled in Templates section

		f.write('set Y := ')

		for year in all_years:
			f.write("'"+str(year.name)+"' ")
			YDoctors[str(year.name)] = []
			template_year_to_pk[str(year.name)] = []
		f.write(";\n")

############ Residents ##################################################
		all_residents = Resident.objects.all()
		resident_names = []
		resident_pk_to_index = dict()

		index = 1
		for resident in all_residents:
			print resident.pk
			resident_names.append(str(resident.name))
			resident_pk_to_index[resident.pk] = index
			YDoctors[str(resident.year)].append(index)
			index += 1

		print "years to res indices: "
		print YDoctors

		f.write('set D := ')

		for res in resident_pk_to_index:
			f.write(str(resident_pk_to_index[res]) + ' ')
		f.write(";\n")
		print "Resident indices: "
		print resident_pk_to_index

############ Weeks #######################################################

		#assume there is only one program
		all_programs = Program.objects.all()
		start_date = all_programs[0].startDate
		end_date = all_programs[0].endDate
		weeks = []

		date_to_week = dict()

		f.write("set W: ")

		week = 1
		for dt in rrule(WEEKLY,dtstart=start_date, until=end_date):
			weeks.append(week)
			#print dt.strftime("%Y-%m-%d")
			date_to_week[dt.strftime("%Y-%m-%d")] = week
			f.write(str(week) + ' ')
			#date_to_week[dt.strftime("%Y-%m-%d")] = week
			week += 1

		print "Date to week number: "
		print date_to_week

		f.write(";\n")


############ Templates #######################################################

		all_templates = Template.objects.all()
		template_pk_to_name = dict()
		template_pk_to_year = dict()
		template_pk_to_blocks = dict()

		for template in all_templates:
			template_pk_to_name[template.pk] = template.templateName
			template_pk_to_year[template.pk] = []
			template_pk_to_blocks[template.pk] = []
			for year in template.templateYears.all():
				template_pk_to_year[template.pk].append(str(year.name))
				template_year_to_pk[str(year.name)].append(template.pk)
			#template_to_year[template] = Year.objects.filter(template__templateName=template.templateName)

		print "TEMPLATE_TO_YEAR"
		print template_pk_to_year

############ Blocks #######################################################
	
		all_templateEvents = TemplateEvent.objects.all()
		templateEvent_pk_to_block = dict() #relates templateEvent model object to block index in .dat
		BWeeks = dict()
		BWeeksMinus1 = dict()

		f.write("set B:= ")

		block = 1
		for event in all_templateEvents:
			blockStartDate = event.blockStartDate
			blockEndDate = event.blockEndDate
			templateEvent_pk_to_block[event.pk] = block
			template_pk_to_blocks[event.template.pk].append(block)
			BWeeks[block] = []
			BWeeksMinus1[block] = []
			for dt in rrule(WEEKLY,dtstart=blockStartDate, until=blockEndDate):
				BWeeks[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
				BWeeksMinus1[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
			del BWeeksMinus1[block][-1]
			#print event.pk
			f.write(str(block) + ' ')
			block += 1

		f.write(";\n")

		print "BWeeks: "
		print BWeeks

		#os.system('pyomo --instance-only --save-model=rotsched.lp rotation_scheduler1.py rotation_dat_year_working.dat')

############  Tracks #######################################################
		all_tracks = Track.objects.all()

		f.write('set T := ')

		for track in all_tracks:
			f.write("'"+str(track.name)+"' ")
		f.write(";\n\n")

###############################################################################
############ Parameters #######################################################

##----BWeeks--------#
		f.write("param BWeeks :=")
		for BWeek in BWeeks:
			f.write("\n"+str(BWeek) + " " + str(BWeeks[BWeek]))
		f.write(';\n\n')
##----BWeeksMinus1--------#
		f.write("param BWeeksMinus1 :=")
		for BWeek in BWeeksMinus1:
			f.write("\n"+str(BWeek) + " " + str(BWeeksMinus1[BWeek]))
		f.write(';\n\n')
##----TempBlocks--------#
		f.write("param TempBlocks :=")
		for template in template_pk_to_name:
			f.write("\n'"+str(template_pk_to_name[template])+"' "+str(template_pk_to_blocks[template]))
		f.write(';\n\n')
##----TempYears--------#
		f.write("param TempYears :=")
		for template in template_pk_to_name:
			f.write("\n'"+str(template_pk_to_name[template])+"' "+str(template_pk_to_year[template]))
		f.write(';\n\n')
##----DBlocks--------#
		f.write("param DBlocks :=")
		for year in YDoctors:
			for doctor in YDoctors[year]:
				f.write("\n"+str(doctor)+" "+str(template_year_to_pk[year]))
		f.write(';\n\n')
##----YBlocks--------#
		f.write("param YBlocks :=")
		for year in template_year_to_pk:
			f.write("\n'"+str(year)+" "+str(template_year_to_pk[year]))
		f.write(';\n\n')
##----YDoctors--------#
		f.write("param YDoctors :=")
		for year in YDoctors:
			f.write("\n'"+str(year)+"' " + str(YDoctors[year]))
		f.write(';\n\n')
##----Year--------#
		f.write("param Year :=")
		for year in YDoctors:
			for res_index in YDoctors[year]:
				f.write("\n"+str(res_index)+" '"+str(year)+"'")
		f.write(';\n\n')

##----DTracks--------#
##----model.V--------#
##----model.P--------#
##----YearlyDemandLower--------#
##----YearlyDemandUpper--------#
##----MinYear--------#
##----MaxYear--------#
##----MinTrack--------#
##----MaxTrack--------#
##----MinLength--------#
##----MaxLength--------#

##skipping: Difficulties, Objective#########

##----TotalDemandLower--------#
		f.write("param TotalDemandLower :=")
		for rotation in total_demand_lower:
			for week in weeks:
				f.write("\n'"+str(rotation)+"' "+str(week)+" "+str(total_demand_lower[rotation]))
		f.write(';\n\n')

##----TotalDemandUpper--------#	
		f.write("param TotalDemandUpper :=")
		for rotation in total_demand_upper:
			for week in weeks:
				f.write("\n'"+str(rotation)+"' "+str(week)+" "+str(total_demand_upper[rotation]))
		f.write(';\n\n')









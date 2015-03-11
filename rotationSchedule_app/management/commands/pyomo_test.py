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
		yearlyDemandLower = dict() #for YearlyDemandLower param
		yearlyDemandUpper = dict() #for YearlyDemandUpper param
		
		f.write("set R := 'Vacation' ") # vacation manually added as a rotation

		for rotation in all_rotations:
			f.write("'"+str(rotation.name)+"' ")
			total_demand_lower[str(rotation.name)] = rotation.minResidents
			total_demand_upper[str(rotation.name)] = rotation.maxResidents
			yearlyDemandLower[str(rotation.name)] = dict()
			yearlyDemandUpper[str(rotation.name)] = dict()
            #rotation_names.append(str(rotation.name))

		f.write(";\n")

############ Years #######################################################
		all_years = Year.objects.all()
		YDoctors = dict()
		template_year_to_pk = dict() #used to find DBlocks, filled in Templates section
		minYear = dict() #for param minYear
		maxYear = dict() # for param maxYear

		f.write('set Y := ')

		for year in all_years:
			minYear[str(year.name)] = dict()
			maxYear[str(year.name)] = dict()
			f.write("'"+str(year.name)+"' ")
			YDoctors[str(year.name)] = []
			template_year_to_pk[str(year.name)] = []
			for yearDemand in year.yeardemand_set.all():
				yearlyDemandLower[str(yearDemand.rotation.name)][str(year)] = yearDemand.minResidents
				yearlyDemandUpper[str(yearDemand.rotation.name)][str(year)] = yearDemand.maxResidents
			for educationReq in year.educationreq_set.all():
				minYear[str(year.name)][educationReq.rotation.name] = educationReq.minLength
				maxYear[str(year.name)][educationReq.rotation.name] = educationReq.maxLength
		f.write(";\n")

		#print "YEARLY DEMAND LOWER"
		#print yearlyDemandLower
		#print "YEARLY DEMAND UPPER"
		#print yearlyDemandUpper

############ Residents ##################################################
		all_residents = Resident.objects.all()
		resident_names = []
		resident_pk_to_index = dict()
		resident_pk_to_track = dict()

		index = 1
		for resident in all_residents:
			#print resident.pk
			resident_names.append(str(resident.name))
			resident_pk_to_index[resident.pk] = index
			YDoctors[str(resident.year)].append(index)
			resident_pk_to_track[resident.pk] = []
			for track in resident.tracks.all():
				resident_pk_to_track[resident.pk].append(str(track.name))
			index += 1

		#print "years to res indices: "
		#print YDoctors

		f.write('set D := ')

		for res in resident_pk_to_index:
			f.write(str(resident_pk_to_index[res]) + ' ')
		f.write(";\n")
		#print "Resident indices: "
		#print resident_pk_to_index

############ Weeks #######################################################

		#assume there is only one program
		all_programs = Program.objects.all()
		start_date = all_programs[0].startDate
		end_date = all_programs[0].endDate
		weeks = []

		date_to_week = dict()

		f.write("set W:= ")

		week = 1
		for dt in rrule(WEEKLY,dtstart=start_date, until=end_date):
			weeks.append(week)
			#print dt.strftime("%Y-%m-%d")
			date_to_week[dt.strftime("%Y-%m-%d")] = week
			f.write(str(week) + ' ')
			#date_to_week[dt.strftime("%Y-%m-%d")] = week
			week += 1

		#print "Date to week number: "
		#print date_to_week

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

		#print "TEMPLATE_TO_YEAR"
		#print template_pk_to_year

############ TemplateEvents #######################################################
	
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
			BWeeks[block] = []
			BWeeksMinus1[block] = []
			for dt in rrule(WEEKLY,dtstart=blockStartDate, until=blockEndDate):
				BWeeks[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
				BWeeksMinus1[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
			del BWeeksMinus1[block][-1]
			for week in BWeeks[block]:
				template_pk_to_blocks[event.template.pk].append(week)

			f.write(str(block) + ' ')
			block += 1
		f.write(";\n")

		#print "BWeeks: "
		#print BWeeks

############ Blocks #######################################################

		all_blocks = Block.objects.all()
		minLength = dict()
		maxLength = dict()

		for block in all_blocks:
			minLength[str(block.name)] = dict()
			maxLength[str(block.name)] = dict()
			for rotationLength in block.rotationlength_set.all():
				minLength[str(block.name)][str(rotationLength.rotation.name)] = rotationLength.minLength
				maxLength[str(block.name)][str(rotationLength.rotation.name)] = rotationLength.maxLength

############  Tracks #######################################################
		all_tracks = Track.objects.all()
		minTrack = dict()
		maxTrack = dict()

		f.write('set T := ')

		for track in all_tracks:
			minTrack[str(track.name)] = dict()
			maxTrack[str(track.name)] = dict()
			f.write("'"+str(track.name)+"' ")
			for trackEducationReq in track.trackeducationreq_set.all():
				minTrack[str(track.name)][trackEducationReq.trackEducationReq_rotation.name] = trackEducationReq.trackEducationReq_minLength
				maxTrack[str(track.name)][trackEducationReq.trackEducationReq_rotation.name] = trackEducationReq.trackEducationReq_maxLength
		f.write(";\n\n")

###############################################################################
############ Parameters #######################################################

##----LastWindowStart--------#
		f.write("param lastWindowStart := \n3;\n\n")
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
		#f.write("param TempBlocks :=")
		#for template in template_pk_to_name:
		#	f.write("\n'"+str(template_pk_to_name[template])+"' "+str(template_pk_to_blocks[template]))
		#f.write(';\n\n')
##----TempYears--------#
		#f.write("param TempYears :=")
		#for template in template_pk_to_name:
		#	f.write("\n'"+str(template_pk_to_name[template])+"' "+str(template_pk_to_year[template]))
		#f.write(';\n\n')
##----DBlocks--------#
		#print template_pk_to_blocks
		f.write("param DBlocks :=")
		for year in YDoctors:
			#print year
			for doctor in YDoctors[year]:
				#print doctor
				current_block_list = []
				for pk in template_year_to_pk[year]: #accounting for multiple templates; this shouldn't happen
					#print pk
					#print template_pk_to_blocks[pk]
					for week in template_pk_to_blocks[pk]:
						#print week
						current_block_list.append(week)
					#print template_pk_to_blocks[pk]
				f.write("\n"+str(doctor)+" "+str(current_block_list))
		f.write(';\n\n')
##----YBlocks--------#
		f.write("param YBlocks :=")
		for year in template_year_to_pk:
			for pk in template_year_to_pk[year]:
				f.write("\n'"+str(year)+"' "+str(template_pk_to_blocks[pk]))
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
#HOW DO I CHECK IF THIS IS EMPTY???????????????????????????????????????????????????????????
#		f.write("param DTracks :=")
#		for res_pk in resident_pk_to_track:
#			f.write("\n"+str(res_pk)+" "+str(resident_pk_to_track[res_pk]))
#		f.write(';\n\n')
##----model.V--------#
##----model.P--------#
##----YearlyDemandLower--------#
		f.write("param YearlyDemandLower :=")
		for rotation in yearlyDemandLower:
			for year in yearlyDemandLower[rotation]:
				for week in range(1,3):  #weeks #HARDCODED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					f.write("\n'"+str(rotation)+"' '"+str(year)+"' "+str(week)+" "+str(yearlyDemandLower[rotation][year]))
		f.write(';\n\n')
##----YearlyDemandUpper--------#
		f.write("param YearlyDemandUpper :=")
		for rotation in yearlyDemandUpper:
			for year in yearlyDemandUpper[rotation]:
				for week in range(1,3): #weeks #HARDCODED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					f.write("\n'"+str(rotation)+"' '"+str(year)+"' "+str(week)+" "+str(yearlyDemandUpper[rotation][year]))
		f.write(';\n\n')


#		f.write("param YearlyDemandLower :=\n'Rotation1' 'PGY1' 1 1\n'Rotation1' 'PGY1' 2 1\n'Rotation1' 'PGY1' 3 1\n'Rotation1' 'PGY2' 1 1\n'Rotation1' 'PGY2' 2 1\n'Rotation1' 'PGY2' 3 1\n'Rotation1' 'PGY3' 1 1\n
#'Rotation1' 'PGY3' 2 1
#'Rotation1' 'PGY3' 3 1 ;


#HARDCODING THE PREFERENCES FOR NOW!!!!!!!!!!!!!!!!!!!!
		f.write("param P :=\n2 'Rotation2' 1 2\n3 'Rotation2' 1 2\n1 'Rotation1' 2 2\n1 'Rotation1' 3 2 ;\n\n")
		
		f.write("param V :=\n1 1 0;")

		f.close()
		os.system('pyomo --instance-only --save-model=rotsched.lp rotation_scheduler3.py test.dat --symbolic-solver-labels')
		#rotation_dat_year_working_new


		import cplex
		cpx=cplex.Cplex("rotsched.lp")
		cpx.parameters.mip.pool.intensity.set(4)
		cpx.parameters.mip.limits.populate.set(3)
		cpx.populate_solution_pool()
		numSolns = cpx.solution.pool.get_num() ##get the number of solutions generated. 
		###Since we set this to 10, numSolns =10
		solnNames = cpx.solution.pool.get_names() ##names of the solutions
		print(solnNames)



##----MinYear--------#
'''		f.write("param MinYear :=")
		for year in minYear:
			for rotation in minYear[year]:
				f.write("\n'"+str(year)+"' '"+str(rotation)+"' "+str(minYear[year][rotation]))
		f.write(';\n\n')
##----MaxYear--------#
		f.write("param MaxYear :=")
		for year in maxYear:
			for rotation in maxYear[year]:
				f.write("\n'"+str(year)+"' '"+str(rotation)+"' "+str(maxYear[year][rotation]))
		f.write(';\n\n')
##----MinTrack--------#
#		f.write("param MinTrack :=")
#		for track in minTrack:
#			for rotation in minTrack[track]:
#				f.write("\n'"+str(track)+"' '"+str(rotation)+"' "+str(minTrack[track][rotation]))
#		f.write(';\n\n')
##----MaxTrack--------#
		#only print parameter if track max values exist
#		f.write("param MaxTrack :=")
#		for track in maxTrack:
#			for rotation in maxTrack[track]:
#				f.write("\n'"+str(track)+"' '"+str(rotation)+"' "+str(maxTrack[track][rotation]))
#		f.write(';\n\n')
##----MinLength--------#
		f.write("param MinLength :=")
		for block in minLength:
			for rotation in minLength[block]:
				f.write("\n'"+str(rotation)+"' '"+str(block)+"' "+str(minLength[block][rotation]))
		f.write(';\n\n')
##----MaxLength--------#
		f.write("param MaxLength :=")
		for block in maxLength:
			for rotation in maxLength[block]:
				f.write("\n'"+str(rotation)+"' '"+str(block)+"' "+str(maxLength[block][rotation]))
		f.write(';\n\n')
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
		f.write(';\n\n')'''


		#rotation_dat_year_working_new


#pyomo --instance-only --save-model=rotschel4.lp ../rotation_scheduler3.py ../pyomoScripts/test.dat --symbolic-solver-labels






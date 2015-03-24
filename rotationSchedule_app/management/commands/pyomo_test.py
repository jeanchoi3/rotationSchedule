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
		#rotation_names.append('Vacation')
		total_demand_lower = dict()
		total_demand_upper = dict()
		yearlyDemandLower = dict() #for YearlyDemandLower param
		yearlyDemandUpper = dict() #for YearlyDemandUpper param
		
		f.write("set R := ") # vacation NOT manually added as a rotation

		for rotation in all_rotations:
			f.write("'"+str(rotation.name)+"' ")
			total_demand_lower[str(rotation.name)] = rotation.minResidents
			total_demand_upper[str(rotation.name)] = rotation.maxResidents
			yearlyDemandLower[str(rotation.name)] = dict()
			yearlyDemandUpper[str(rotation.name)] = dict()
			rotation_names.append(str(rotation.name))
            #rotation_names.append(str(rotation.name))

		f.write(";\n")

############ Years #######################################################
		all_years = Year.objects.all()
		YDoctors = dict()
		template_year_to_pk = dict() #used to find DBlocks, filled in Templates section
		minYear = dict() #for param minYear
		maxYear = dict() # for param maxYear
		yearNum = dict() # key year name, value year number
						 # for year number, e.g. Intern = yearNum 1, PGY2 = yearNum 2. Used for seniority weighting in model.P

		f.write('set Y := ')

		for year in all_years:
			minYear[str(year.name)] = dict()
			maxYear[str(year.name)] = dict()
			f.write("'"+str(year.name)+"' ")
			YDoctors[str(year.name)] = []
			template_year_to_pk[str(year.name)] = []
			yearNum[str(year.name)] = year.yearNum
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


############ Weeks #######################################################

		#assume there is only one program
		all_programs = Program.objects.all()
		start_date = all_programs[0].startDate
		end_date = all_programs[0].endDate
		minClinicWeeks = all_programs[0].minClinicWeeks
		windowSize = all_programs[0].windowSize
		weeks = []

		date_to_week = dict()
		week_to_date = dict()
		week_to_end_date = dict()

		f.write("set W:= ")

		week = 1
		for dt in rrule(WEEKLY,dtstart=start_date, until=end_date):
			weeks.append(week)
			#print dt.strftime("%Y-%m-%d")
			date_to_week[dt.strftime("%Y-%m-%d")] = week
			week_to_date[week] = dt.strftime("%Y-%m-%d")
			week_to_end_date[week] = (dt+datetime.timedelta(days=7)).strftime("%Y-%m-%d")
			f.write(str(week) + ' ')
			#date_to_week[dt.strftime("%Y-%m-%d")] = week
			week += 1

		#print "Date to week number: "
		#print date_to_week

		f.write(";\n")

############ Residents ##################################################
		all_residents = Resident.objects.all()
		resident_names = []
		resident_pk_to_index = dict()
		resident_index_to_pk = dict()
		resident_pk_to_track = dict()
		resident_index_to_year = dict()

		vacationPreference = dict() # key = res index, value = vacationPref/10
		vacation1 = dict() # key = res index, value = list of weeks
		vacation2 = dict()
		vacation3 = dict()
		elective1 = dict() # key = res index, value = rotation name
		elective2 = dict()
		elective3 = dict()
		elective4 = dict()
		elective5 = dict()
		elective6 = dict()
		elective7 = dict()
		elective8 = dict()
		elective9 = dict()
		elective10 = dict()


		index = 1
		for resident in all_residents:
			#print resident.pk
			resident_names.append(str(resident.name))
			resident_pk_to_index[resident.pk] = index
			resident_index_to_pk[index] = resident.pk
			YDoctors[str(resident.year)].append(index)
			resident_index_to_year[index] = str(resident.year)

			vacationPreference[index] = resident.vacationPreference
			##assume that vacationStart is on a sunday, and vacationEnd is on a Saturday
			if resident.vacationStart1 is not None and resident.vacationEnd1 is not None:
				vacationStartDate1 = resident.vacationStart1
				vacationStartWeek1 = date_to_week[vacationStartDate1.strftime("%Y-%m-%d")]
				vacationEndDate1 = resident.vacationEnd1
				if (vacationEndDate1+datetime.timedelta(days=1)).strftime("%Y-%m-%d") in date_to_week:
					vacationEndWeek1 = date_to_week[(vacationEndDate1+datetime.timedelta(days=1)).strftime("%Y-%m-%d")]
				else: #assume this is last week in schedule
					vacationEndWeek1 = len(weeks)+1
				vacation1[index] = []
				for i in range(vacationStartWeek1,vacationEndWeek1):
					vacation1[index].append(i)
			if resident.vacationStart2 is not None and resident.vacationEnd2 is not None:
				vacationStartDate2 = resident.vacationStart2
				vacationStartWeek2 = date_to_week[vacationStartDate2.strftime("%Y-%m-%d")]
				vacationEndDate2 = resident.vacationEnd2
				if (vacationEndDate2+datetime.timedelta(days=1)).strftime("%Y-%m-%d") in date_to_week:
					vacationEndWeek2 = date_to_week[(vacationEndDate2+datetime.timedelta(days=1)).strftime("%Y-%m-%d")]
				else:
					vacationEndWeek2 = len(weeks)+1
				vacation2[index] = []
				for i in range(vacationStartWeek2,vacationEndWeek2):
					vacation2[index].append(i)
			if resident.vacationStart3 is not None and resident.vacationEnd3 is not None:
				vacationStartDate3 = resident.vacationStart3
				vacationStartWeek3 = date_to_week[vacationStartDate3.strftime("%Y-%m-%d")]
				vacationEndDate3 = resident.vacationEnd3
				if (vacationEndDate3+datetime.timedelta(days=1)).strftime("%Y-%m-%d") in date_to_week:
					vacationEndWeek3 = date_to_week[(vacationEndDate3+datetime.timedelta(days=1)).strftime("%Y-%m-%d")]
				else:
					vacationEndWeek3 = len(weeks)+1
				vacation3[index] = []
				for i in range(vacationStartWeek3,vacationEndWeek3):
					vacation3[index].append(i)
			if resident.elective1 is not None:
				elective1[index] = resident.elective1
			if resident.elective2 is not None:
				elective2[index] = resident.elective2
			if resident.elective3 is not None:
				elective3[index] = resident.elective3
			if resident.elective4 is not None:
				elective4[index] = resident.elective4
			if resident.elective5 is not None:
				elective5[index] = resident.elective5
			if resident.elective6 is not None:
				elective6[index] = resident.elective6
			if resident.elective7 is not None:
				elective7[index] = resident.elective7
			if resident.elective8 is not None:
				elective8[index] = resident.elective8
			if resident.elective9 is not None:
				elective9[index] = resident.elective9
			if resident.elective10 is not None:
				elective10[index] = resident.elective10
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


############ Blocks #######################################################

		all_blocks = Block.objects.all()
		minLength = dict()
		maxLength = dict()
		block_name_to_dblock = dict()

		for block in all_blocks:
			minLength[str(block.name)] = dict()
			maxLength[str(block.name)] = dict()
			block_name_to_dblock[str(block.name)] = []
			for rotationLength in block.rotationlength_set.all():
				minLength[str(block.name)][str(rotationLength.rotation.name)] = rotationLength.minLength
				maxLength[str(block.name)][str(rotationLength.rotation.name)] = rotationLength.maxLength


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
			block_name_to_dblock[str(event.block.name)].append(block)
			templateEvent_pk_to_block[event.pk] = block
			BWeeks[block] = []
			BWeeksMinus1[block] = []
			for dt in rrule(WEEKLY,dtstart=blockStartDate, until=blockEndDate):
				BWeeks[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
				BWeeksMinus1[block].append(date_to_week[dt.strftime("%Y-%m-%d")])
			del BWeeksMinus1[block][-1]
			template_pk_to_blocks[event.template.pk].append(block)


			f.write(str(block) + ' ')
			block += 1
		f.write(";\n")

		#print "BWeeks: "
		#print BWeeks

############  Tracks #######################################################
		all_tracks = Track.objects.all()
		track_name_to_index = dict()
		minTrack = dict()
		maxTrack = dict()

		f.write('set T := 1 ')
		#index 1 is 'noTrack'
		track_name_to_index['noTrack'] = 1

		track_index = 2
		for track in all_tracks:
			f.write(str(track_index) + ' ')
			track_name_to_index[str(track.name)] = track_index
			minTrack[str(track.name)] = dict()
			maxTrack[str(track.name)] = dict()

#DEBUGGING! ADD IN LATER AGAIN!!!!!!!!!!!!!!!!!
#			for trackEducationReq in track.trackeducationreq_set.all():
#				minTrack[track_index][trackEducationReq.trackEducationReq_rotation.name] = trackEducationReq.trackEducationReq_minLength
#				maxTrack[track_index][trackEducationReq.trackEducationReq_rotation.name] = trackEducationReq.trackEducationReq_maxLength
			track_index += 1
		f.write(";\n\n")

		print track_name_to_index

###############################################################################
############ Parameters #######################################################

##----windowSize--------#
#		f.write("param windowSize := \n"+str(windowSize)+"\n\n")
##----minClinicWeeks--------#
#		f.write("param minClinicWeeks := \n"+str(minClinicWeeks)+"\n\n")
##----lastWindowStart--------#
#		f.write("param lastWindowStart := \n"+str(weeks[-1]-windowSize+1)+"\n\n")
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
#ignore for now!
		#f.write("param TempBlocks :=")
		#for template in template_pk_to_name:
		#	f.write("\n'"+str(template_pk_to_name[template])+"' "+str(template_pk_to_blocks[template]))
		#f.write(';\n\n')
##----TempYears--------#
#ignore for now!
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
					for block in template_pk_to_blocks[pk]:
						#print week
						current_block_list.append(block)
					#print template_pk_to_blocks[pk]
				f.write("\n"+str(doctor)+" "+str(current_block_list))
		f.write(';\n\n')
##----YBlocks--------#
		f.write("param YBlocks :=")
		for year in template_year_to_pk:
			for pk in template_year_to_pk[year]:
				if len(template_pk_to_blocks[pk]) != 0:
					f.write("\n'"+str(year)+"' "+str(template_pk_to_blocks[pk]))
		f.write(';\n\n')
##----YDoctors--------#
		f.write("param YDoctors :=")
		for year in YDoctors:
			if len(YDoctors[year]) != 0: 
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
#			if len(resident_pk_to_track[res_pk]) != 0:
#				f.write("\n"+str(res_pk)+" "+str(resident_pk_to_track[res_pk]))
#		f.write(';\n\n')
##----model.V--------#

##----model.P--------#
# electives: 2 10 50 250 1250 6250 31250 156250 781250 3906250 (*5)
# 4,000,000 20,000,000 1,000,000,000
# 1,000,000 5,000,000 25,000,000
# 250,000 1,250,000 6,250,000

		#constants used for vacation preference assignments
		vacationBase = {}
		vacationMult = 5

		electiveBase = 2
		electiveMult = 5

		#assign base according to vacation weighting
		for i in range(1,11):
			if i >= 7:
				vacationBase[i] = 4000000
			elif i > 3 and i <= 6:
				vacationBase[i] = 1000000
			else:
				vacationBase[i] = 250000

		f.write("param P :=")

		for res_index in vacation1: #for each resident that specified a first-choice vacation
			#find resident's year: used for seniority weighting
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in vacation1[res_index]: #for the weeks they specified they want their first-choice vacation
				vacWeight = vacationPreference[res_index]
				f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" "+str(yearMult*(vacationBase[vacWeight] * vacationMult ** 2))) 
		for res_index in vacation2:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in vacation2[res_index]:
				vacWeight = vacationPreference[res_index]
				f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" "+str(yearMult*(vacationBase[vacWeight] * vacationMult))) 
		for res_index in vacation3:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in vacation3[res_index]:
				vacWeight = vacationPreference[res_index]
				f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" "+str(yearMult*(vacationBase[vacWeight])))

		for res_index in elective1:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 9)))
		for res_index in elective2:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 8)))
		for res_index in elective3:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 7)))
		for res_index in elective4:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 6)))
		for res_index in elective5:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 5)))
		for res_index in elective6:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 4)))
		for res_index in elective7:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 3)))
		for res_index in elective8:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 2)))
		for res_index in elective9:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase * electiveMult)))
		for res_index in elective10:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" "+str(yearMult*(electiveBase)))
		f.write(';\n\n')
			
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
				for week in range(1,4): #weeks #HARDCODED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					f.write("\n'"+str(rotation)+"' '"+str(year)+"' "+str(week)+" "+str(yearlyDemandUpper[rotation][year]))
		f.write(';\n\n')

#		f.write("param YearlyDemandLower :=\n'Rotation1' 'PGY1' 1 1\n'Rotation1' 'PGY1' 2 1\n'Rotation1' 'PGY1' 3 1\n'Rotation1' 'PGY2' 1 1\n'Rotation1' 'PGY2' 2 1\n'Rotation1' 'PGY2' 3 1\n'Rotation1' 'PGY3' 1 1\n
#'Rotation1' 'PGY3' 2 1
#'Rotation1' 'PGY3' 3 1 ;

##----MinTrack--------#
		minTrack_initialized = False
		for track in minTrack:
			if minTrack[track]:
				if len(minTrack[track]) != 0:
					if minTrack_initialized is False:
						f.write("param MinTrack :=")
						minTrack_initialized = True
					for rotation in minTrack[track]:
						f.write("\n'"+str(track)+"' '"+str(rotation)+"' "+str(minTrack[track][rotation]))
		
		if minTrack_initialized:
			f.write(';\n\n')
##----MaxTrack--------#
		maxTrack_initialized = False
		for track in maxTrack:
			if maxTrack[track]:
				if len(maxTrack[track]) != 0:
					if maxTrack_initialized is False:
						f.write("param MaxTrack :=")
						maxTrack_initialized = True
				for rotation in maxTrack[track]:
					f.write("\n'"+str(track)+"' '"+str(rotation)+"' "+str(maxTrack[track][rotation]))
		if maxTrack_initialized:
			f.write(';\n\n')
##----MinLength--------#
		f.write("param MinLength :=")
		for blockName in minLength:
			if blockName in block_name_to_dblock:
				for rotation in minLength[blockName]:
					for block in block_name_to_dblock[blockName]:
						f.write("\n'"+str(rotation)+"' "+str(block)+" "+str(minLength[blockName][rotation]))
		f.write(';\n\n')
##----MaxLength--------#
		f.write("param MaxLength :=")
		for blockName in maxLength:
			if blockName in block_name_to_dblock:
				for rotation in maxLength[blockName]:
					for block in block_name_to_dblock[blockName]:
						f.write("\n'"+str(rotation)+"' "+str(block)+" "+str(maxLength[blockName][rotation]))
		f.write(';\n\n')

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

##----MinYear--------#
		f.write("param MinYear :=")
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

		f.close()
		os.system('pyomo --instance-only --save-model=rotsched.lp rotation_scheduler5.py test.dat --symbolic-solver-labels')

###############################################################################
############ Cplex solution #######################################################
		Schedule.objects.all().delete()
		Event.objects.all().delete() 

		import cplex
		cpx = cplex.Cplex("rotsched.lp") ### any lp file generated by pyomo
		M = 3 #numSolns to generate
		ObjTolerance = 0.95 #fraction of best objective tolerated while finding multiple schedules,1 == find only optimal
		cpx.solve() # solve for optimal solution
		successful = cpx.solution.get_status()
		print(successful)
		#### successful != 101 := problem is infeasible .. Raise flags for the web app

		if successful == 101: #101 is code for MIP_optimal #Todo: remove this hardcode
			acceptedSolnIndices = [] #indices of optimal solutions, not including best optimal, # of such solutions = M
			acceptedSolnVars = [] #list of lists of Z variables of accepted solns (as strings), including best optimal
								  # used for comparison with newly found schedules to prevent redundancy
			alternate_solutions = {} #not used currently
			obj_value = {} #objective value of each solution
			solnIndicesAll = [] # indices of all solutions found so far, not including best optimal
			solnNamesAll = [] # names of all solutions found so far, not including best optimal

			bestObjective = cpx.solution.get_objective_value()
			optimal_solution = cpx.solution.get_values() ## One optimal solution ready to be displayed in the web-app

			#create the best schedule
			createdSchedule = Schedule(name="Best Solution",utility=bestObjective)
			createdSchedule.save()

			solnVars = [] #list of Z variables of this solution
						  # used for comparison with previously-found solns to prevent redundancy
			#create events in best schedule
			for res_pk in resident_pk_to_index:
				for rotation in rotation_names:
					for week in weeks:
						if str(cpx.solution.get_values("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")) == "1.0":
							solnVars.append("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")
							res = Resident.objects.filter(pk=res_pk)[0]
							rot = Rotation.objects.filter(name=rotation)[0]
							start = week_to_date[week]
							end = week_to_end_date[week]
							createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
							createdEvent.save()

			acceptedSolnVars.append(solnVars) #add best optimal solution to accepted soln variable list, to prevent redundancy in solution pool

			cpx.parameters.mip.pool.intensity.set(4) #leave no stone unturned: find all feasible solutions
			numOptimalSolns = M
			cpx.parameters.mip.limits.populate.set(M) #set number of solutions to M
			cpx.populate_solution_pool() #solve and populate the solution pool
			solnNames = cpx.solution.pool.get_names()
			solnIndices = cpx.solution.pool.get_indices(solnNames)

			while (len(acceptedSolnIndices)+1) < numOptimalSolns and solnIndices: #because len(acceptedSolnIndices) doesn't count best optimal soln
				for i in solnIndices:
					solnVars = [] #list of Z variables of this solution
								  # used for comparison with previously-found solns to prevent redundancy
					obj_value[i] = cpx.solution.pool.get_objective_value(i)

					# solution objective value is above threshold
					if obj_value[i] >= ObjTolerance*bestObjective:
						#add all Z variables to solnVars, then compare with previously-found solns; check uniqueness
						for res_pk in resident_pk_to_index:
							for rotation in rotation_names:
								for week in weeks: 
									#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
									if str(cpx.solution.pool.get_values(i,"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")) == "1.0": #used to have solnIndices[i] as first arg!!!
										solnVars.append("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")

						unique_schedule = True
						for sched in acceptedSolnVars:
							if set(sched) == set(solnVars):
								unique_schedule = False
								break
						if unique_schedule:
							acceptedSolnVars.append(solnVars)

							#create model Schedule instance
							createdSchedule = Schedule(name="Schedule"+str(i+1),utility=obj_value[i])
							createdSchedule.save()
							#print createdSchedule.name

							#create model Events for this schedule
							for assignment in solnVars:
								split_variable = assignment.strip(")").split("(")[1].split("_")
								res = Resident.objects.filter(pk=resident_index_to_pk[int(split_variable[0])])[0]
								rot = Rotation.objects.filter(name=split_variable[1])[0]
								start = week_to_date[int(split_variable[2])]
								end = week_to_end_date[int(split_variable[2])]
								createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
								createdEvent.save()

							acceptedSolnIndices.append(i)

				solnIndicesAll.extend(solnIndices)
				solnNamesAll.extend(solnNames)

				cpx.parameters.mip.limits.populate.set(M) #set number of solutions to M
				cpx.populate_solution_pool() #solve and populate the solution pool
				#numSolns = cpx.solution.pool.get_num() ##get the number of solutions generated.
				solnNames = cpx.solution.pool.get_names()
				[solnNames.remove(s) for s in solnNamesAll] #getting rid of solutions that have been found already
				solnIndices = cpx.solution.pool.get_indices(solnNames)
				#print "SolnIndices: "+str(solnIndices)+"*********************"
			print "Accepted solution indices, not including best solution: "+str(acceptedSolnIndices)
			print "All solution indices: "+str(solnIndicesAll)
			print(obj_value)
'''
if vacationPreference[res_index] >= 7:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 1000000000")
				elif vacationPreference[res_index] > 3 and vacationPreference[res_index] <= 6:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 25000000")
				else:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 6250000")
		for res_index in vacation2:
			for week in vacation2[res_index]:
				if vacationPreference[res_index] >= 7:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 20000000")
				elif vacationPreference[res_index] > 3 and vacationPreference[res_index] <= 6:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 5000000")
				else:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 1250000")
		for res_index in vacation3:
			for week in vacation3[res_index]:
				if vacationPreference[res_index] >= 7:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 4000000")
				elif vacationPreference[res_index] > 3 and vacationPreference[res_index] <= 6:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 1000000")
				else:
					f.write("\n"+str(res_index)+" 'Vacation' "+str(week)+" 250000")
		for res_index in elective1:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective1[res_index])+"' "+str(week)+" 3906250")
		for res_index in elective2:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective2[res_index])+"' "+str(week)+" 781250")
		for res_index in elective3:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective3[res_index])+"' "+str(week)+" 156250")
		for res_index in elective4:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective4[res_index])+"' "+str(week)+" 31250")
		for res_index in elective5:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective5[res_index])+"' "+str(week)+" 6250")
		for res_index in elective6:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective6[res_index])+"' "+str(week)+" 1250")
		for res_index in elective7:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective7[res_index])+"' "+str(week)+" 250")
		for res_index in elective8:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective8[res_index])+"' "+str(week)+" 50")
		for res_index in elective9:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective9[res_index])+"' "+str(week)+" 10")
		for res_index in elective10:
			for week in weeks:
				f.write("\n"+str(res_index)+" '"+str(elective10[res_index])+"' "+str(week)+" 2")
		f.write(';\n\n')'''

''' #old cplex code; replaced with cplexRotationScheduler.py
		import cplex
		cpx=cplex.Cplex("rotsched.lp")
		cpx.parameters.mip.pool.intensity.set(4)
		cpx.parameters.mip.limits.populate.set(3)
		cpx.populate_solution_pool()
		numSolns = cpx.solution.pool.get_num() ##get the number of solutions generated. 
		print numSolns
		###Since we set this to 10, numSolns =10
		solnNames = cpx.solution.pool.get_names() ##names of the solutions
		print(solnNames)
		solnIndices = cpx.solution.pool.get_indices(solnNames) ## indices of all solutions from their names
		print solnIndices
		#cpx.populate_solution_pool()
		#solnNames2 = cpx.solution.pool.get_names() ##names of the solutions
		#solnIndices2 = cpx.solution.pool.get_indices(solnNames2)

		Schedule.objects.all().delete()
		Event.objects.all().delete() 
		
		max_obj = 1
		all_accepted_schedules = []

		for j in solnIndices:
			accepted_schedule = []

			print cpx.solution.pool.get_objective_value(j)
			if cpx.solution.pool.get_objective_value(j) > max_obj:
					max_obj = cpx.solution.pool.get_objective_value(j)
			createdSchedule = Schedule(name="NewSchedule"+str(j+1),utility=cpx.solution.pool.get_objective_value(j))
			createdSchedule.save()
			print createdSchedule.name

			#create arrays with all assignments, used for checking uniqueness of solutions
			for res_pk in resident_pk_to_index:
				for rotation in rotation_names:
					for week in weeks: 
						#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
						if str(cpx.solution.pool.get_values(solnIndices[j],"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")) == "1.0":
							accepted_schedule.append("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")
							#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
							#assume only one object fits the filter!!
							
							#res = Resident.objects.filter(pk=res_pk)[0]
							#rot = Rotation.objects.filter(name=rotation)[0]
							#start = week_to_date[week]
							#end = week_to_end_date[week]
							#createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
							#createdEvent.save()

			#check for redundant answers
			unique_schedule = True
			for sched in all_accepted_schedules:
				if set(sched) == set(accepted_schedule):
					unique_schedule = False
					break
			if unique_schedule:
				all_accepted_schedules.append(accepted_schedule)

			#create model Events for unique schedules
			for sched in all_accepted_schedules:
				for assignment in sched:
					split_variable = assignment.strip(")").split("(")[1].split("_")
					res = Resident.objects.filter(pk=resident_index_to_pk[int(split_variable[0])])[0]
					rot = Rotation.objects.filter(name=split_variable[1])[0]
					start = week_to_date[int(split_variable[2])]
					end = week_to_end_date[int(split_variable[2])]
					createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
					createdEvent.save()'''

'''		for j in solnIndices:
			print str(cpx.solution.pool.get_objective_value(j)) + "-----------------------"
			temp_rotation_list = ['Vacation','Clinic','Rotation1','Rotation2']
			for d in range(1,5):
				for rotation in temp_rotation_list:
					for w in range(1,9):
						if str(cpx.solution.pool.get_values(solnIndices[j],"Z("+str(d)+"_"+str(rotation)+"_"+str(w)+")")) == "1.0":
							print "Z("+str(d)+"_"+str(rotation)+"_"+str(w)+")"'''
							
'''
			#create all events for this solution schedule
			for res_pk in resident_pk_to_index:
				for rotation in rotation_names:
					for week in weeks:
						print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
						if str(cpx.solution.pool.get_values(solnIndices[j],"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")) == "1.0":
							#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
							#assume only one object fits the filter!!
							res = Resident.objects.filter(pk=res_pk)[0]
							rot = Rotation.objects.filter(name=rotation)[0]
							start = week_to_date[week]
							end = week_to_end_date[week]
							createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
							createdEvent.save()'''


'''
		import cplex
		cpx=cplex.Cplex("rotsched.lp")
		cpx.parameters.mip.pool.intensity.set(4)
		cpx.parameters.mip.limits.populate.set(3)
		cpx.populate_solution_pool()
		solnNames = cpx.solution.pool.get_names() ##names of the solutions
		solnIndices = cpx.solution.pool.get_indices(solnNames) ## indices of all solutions from their names
		
		Schedule.objects.all().delete()
		Event.objects.all().delete()

		for j in solnIndices:
			#create a new schedule for each cplex solution
			createdSchedule = Schedule(name="NewSchedule"+str(j+1),utility=cpx.solution.pool.get_objective_value(j))
			createdSchedule.save()

			#create all events for this solution schedule
			for res_pk in resident_pk_to_index:
				for rotation in rotation_names:
					for week in weeks:
						if str(cpx.solution.pool.get_values(solnIndices[j],"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")")) == "1.0":
							#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
							#assume only one object fits the filter!!
							res = Resident.objects.filter(pk=res_pk)[0]
							rot = Rotation.objects.filter(name=rotation)[0]
							start = week_to_date[week]
							end = week_to_end_date[week]
							createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
							createdEvent.save()
'''						#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"

		#for doctor in range(1,5):
		#	for week in range(1,9):
				#print "Z("+str(doctor)+"_Rotation2_"+str(week)+")"
		#		print str(cpx.solution.pool.get_values(solnIndices2[0],"Z("+str(doctor)+"_Rotation1_"+str(week)+")"))# == "0.0":
		#		if str(cpx.solution.pool.get_values(solnIndices2[0],"Z("+str(doctor)+"_Rotation1_"+str(week)+")")) == "1.0":
		#			print "Z("+str(doctor)+"_Rotation1_"+str(week)+")"
					#"Z("+str(doctor)+"_Rotation2_"+str(week)+")"




##skipping: Difficulties, Objective#########







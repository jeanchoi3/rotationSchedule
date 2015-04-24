from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Block, Resident, Year, Track, Program, Rotation, Event, Schedule, Template, TemplateEvent, RotationSet, YearSet
import copy
import random
import operator
import sys
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

		rotation_index_to_name = dict()
		rotation_name_to_index = dict()
		rotation_names = []
		#rotation_names.append('Vacation')
		total_demand_lower = dict()
		total_demand_upper = dict()
		yearlyDemandLower = dict() #for YearlyDemandLower param
		yearlyDemandUpper = dict() #for YearlyDemandUpper param
		yearSetDemandLower = dict()
		yearSetDemandUpper = dict()

		f.write("set R := 1 2 ") # vacation NOT manually added as a rotation

		#set up clinic = 1
		clinicRotation = Rotation.objects.filter(name='Clinic')[0]
		rotation_index_to_name[1] = 'Clinic'
		rotation_name_to_index['Clinic'] = 1
		#f.write("'"+str(rotation.name)+"' ")
		total_demand_lower[1] = clinicRotation.minResidents
		total_demand_upper[1] = clinicRotation.maxResidents
		yearlyDemandLower[1] = dict()
		yearlyDemandUpper[1] = dict()
		yearSetDemandLower[1] = dict()
		yearSetDemandUpper[1] = dict()
		rotation_names.append('Clinic')

		#set up vacation = 2
		vacationRotation = Rotation.objects.filter(name='Vacation')[0]
		rotation_index_to_name[2] = 'Vacation'
		rotation_name_to_index['Vacation'] = 2
		#f.write("'"+str(rotation.name)+"' ")
		total_demand_lower[2] = vacationRotation.minResidents
		total_demand_upper[2] = vacationRotation.maxResidents
		yearlyDemandLower[2] = dict()
		yearlyDemandUpper[2] = dict()
		yearSetDemandLower[2] = dict()
		yearSetDemandUpper[2] = dict()
		rotation_names.append('Vacation')


		rotation_index = 3 #manually making clinic = 1 and vacation = 2
		for rotation in all_rotations:
			if str(rotation.name) != 'Clinic' and str(rotation.name) != 'Vacation':
				f.write(str(rotation_index)+" ")
				rotation_index_to_name[rotation_index] = str(rotation.name)
				rotation_name_to_index[str(rotation.name)] = rotation_index
				#f.write("'"+str(rotation.name)+"' ")
				total_demand_lower[rotation_index] = rotation.minResidents
				total_demand_upper[rotation_index] = rotation.maxResidents
				yearlyDemandLower[rotation_index] = dict()
				yearlyDemandUpper[rotation_index] = dict()
				yearSetDemandLower[rotation_index] = dict()
				yearSetDemandUpper[rotation_index] = dict()

				rotation_names.append(str(rotation.name))
				rotation_index += 1

		f.write(";\n")

		all_rotationSets = RotationSet.objects.all()
		redu_index_to_name = dict()
		redu_name_to_index = dict()
		redu_index_to_rotation_indices = dict() #key: rotationSet index (only for those beyond the original rotations), value: list of rotations in it

		f.write("set Redu := ")
		for index in rotation_index_to_name:
			f.write(str(index)+" ")

		redu_index = len(rotation_index_to_name)+1
		#redu = [] #CAN PROBABLY GET RID OF THIS LATER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		#for debugging rotation set!!!!
		for rotationSet in all_rotationSets:
			f.write(str(redu_index)+" ")
			redu_index_to_name[redu_index] = rotationSet.rotationSet_name
			redu_name_to_index[rotationSet.rotationSet_name] = redu_index
			redu_index_to_rotation_indices[redu_index] = []
			for rotation in rotationSet.rotations.all():
				redu_index_to_rotation_indices[redu_index].append(rotation_name_to_index[rotation.name])
			# for eduReq in rotationSet.setedureq_set.all():
			# 	minSetYear[year_name_to_index[eduReq.setEduReq_year.name]][redu_index] = eduReq.setEduReq_minLength
			# 	maxSetYear[year_name_to_index[eduReq.setEduReq_year.name]][redu_index] = eduReq.setEduReq_maxLength
			# for trackEduReq in rotationSet.settrackedureq_set.all():
			# 	minSetTrack[trackEduReq.setTrackEduReq_track.name][redu_index] = trackEduReq.setTrackEduReq_minLength
			# 	maxSetTrack[trackEduReq.setTrackEduReq_track.name][redu_index] = trackEduReq.setTrackEduReq_maxLength
			redu_index += 1

		f.write(";\n")

		#print redu_index_to_name
		#print redu_index_to_rotation_indices
		print rotation_index_to_name

############ Years #######################################################
		all_years = Year.objects.all()
		YDoctors = dict()
		template_year_to_pk = dict() #used to find DBlocks, filled in Templates section
		minYear = dict() # key year index, value = dict w/ key rotation index and value min edu req for rotation
		maxYear = dict() # key year index, value = dict w/ key rotation index and value max edu req for rotation
		minSetYear = dict() # key year index, value = dict w/ key rotation index and value min edu req for rotationSet
		maxSetYear = dict() # key year index, value = dict w/ key rotation index and value max edu req for rotationSet
		yearNum = dict() # key year name, value year number
						 # for year number, e.g. Intern = yearNum 1, PGY2 = yearNum 2. Used for seniority weighting in model.P

		year_index_to_name = dict()
		year_name_to_index = dict()

		f.write('set Y := ')

		year_index = 1
		for year in all_years:
			minYear[year_index] = dict()
			maxYear[year_index] = dict()
			minSetYear[year_index] = dict()
			maxSetYear[year_index] = dict()
			#f.write("'"+str(year.name)+"' ")
			f.write(str(year_index)+" ")
			year_index_to_name[year_index] = str(year.name)
			year_name_to_index[str(year.name)] = year_index
			YDoctors[str(year.name)] = []
			template_year_to_pk[str(year.name)] = []
			yearNum[str(year.name)] = year.yearNum
			for yearDemand in year.yeardemand_set.all():
				yearlyDemandLower[rotation_name_to_index[yearDemand.rotation.name]][year_index] = yearDemand.minResidents
				yearlyDemandUpper[rotation_name_to_index[yearDemand.rotation.name]][year_index] = yearDemand.maxResidents
			for educationReq in year.educationreq_set.all():
				minYear[year_index][rotation_name_to_index[educationReq.rotation.name]] = educationReq.minLength
				maxYear[year_index][rotation_name_to_index[educationReq.rotation.name]] = educationReq.maxLength
			year_index += 1
		f.write(";\n")

		for rotationSet in all_rotationSets:
			for eduReq in rotationSet.setedureq_set.all():
				minSetYear[year_name_to_index[eduReq.setEduReq_year.name]][redu_name_to_index[rotationSet.rotationSet_name]] = eduReq.setEduReq_minLength
				maxSetYear[year_name_to_index[eduReq.setEduReq_year.name]][redu_name_to_index[rotationSet.rotationSet_name]] = eduReq.setEduReq_maxLength

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

		f.write("set W := ")

		week = 1
		for dt in rrule(WEEKLY,dtstart=start_date, until=end_date):
			weeks.append(week)
			date_to_week[dt.strftime("%Y-%m-%d")] = week
			week_to_date[week] = dt.strftime("%Y-%m-%d")
			week_to_end_date[week] = (dt+datetime.timedelta(days=7)).strftime("%Y-%m-%d")
			f.write(str(week) + ' ')
			week += 1


		f.write(";\n")

############ Residents ##################################################
		all_residents = Resident.objects.all()
		resident_names = []
		resident_pk_to_index = dict()
		resident_index_to_pk = dict()
		resident_pk_to_track = dict()
		resident_index_to_year = dict()
		resident_name_to_index = dict()
		resident_couple = dict() #key = res name, value = spouse's res name

		vacationPreference = dict() # key = res index, value = vacationPref/10
		vacation1 = dict() # key = res index, value = list of weeks
		vacation2 = dict()
		vacation3 = dict()
		elective1 = dict() # key = res index, value = rotation index
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
			resident_name_to_index[str(resident.name)] = index
			resident_index_to_pk[index] = resident.pk
			YDoctors[str(resident.year)].append(index)
			resident_index_to_year[index] = str(resident.year)

			if resident.couple is not None:
				resident_couple[str(resident.name)] = str(resident.couple.name)

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
				elective1[index] = rotation_name_to_index[resident.elective1.name]
			if resident.elective2 is not None:
				elective2[index] = rotation_name_to_index[resident.elective2.name]
			if resident.elective3 is not None:
				elective3[index] = rotation_name_to_index[resident.elective3.name]
			if resident.elective4 is not None:
				elective4[index] = rotation_name_to_index[resident.elective4.name]
			if resident.elective5 is not None:
				elective5[index] = rotation_name_to_index[resident.elective5.name]
			if resident.elective6 is not None:
				elective6[index] = rotation_name_to_index[resident.elective6.name]
			if resident.elective7 is not None:
				elective7[index] = rotation_name_to_index[resident.elective7.name]
			if resident.elective8 is not None:
				elective8[index] = rotation_name_to_index[resident.elective8.name]
			if resident.elective9 is not None:
				elective9[index] = rotation_name_to_index[resident.elective9.name]
			if resident.elective10 is not None:
				elective10[index] = rotation_name_to_index[resident.elective10.name]
			resident_pk_to_track[resident.pk] = []
			for track in resident.tracks.all():
				resident_pk_to_track[resident.pk].append(str(track.name))
			index += 1

		print resident_name_to_index

		f.write('set D := ')

		for res in resident_pk_to_index:
			f.write(str(resident_pk_to_index[res]) + ' ')
		f.write(";\n")

##-----set Couples, for couple matching-----------#
		if resident_couple:
			f.write("set Couples :=")
			listed_residents = [] #to prevent redundancy from both residents in couple
			for resident in resident_couple:
				if resident_couple[resident] in listed_residents:
					continue
				else:
					f.write("\n"+str(resident_name_to_index[resident])+" "+str(resident_name_to_index[resident_couple[resident]]))
					listed_residents.append(resident)
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


############ Blocks #######################################################

		all_blocks = Block.objects.all()
		minLength = dict() #key block index, value = dict w/ key rotation index, value minlength
		maxLength = dict() #key block index, value = dict w/ key rotation index, value maxlength
		block_index_to_dblock = dict() #key block index, value = list of template events of that block 
		block_name_to_index = dict()

		block_index = 1
		for block in all_blocks:
			block_name_to_index[str(block.name)] = block_index
			minLength[block_index] = dict()
			maxLength[block_index] = dict()
			block_index_to_dblock[block_index] = []
			for rotationLength in block.rotationlength_set.all():
				#print rotationLength.rotation.name
				minLength[block_index][rotation_name_to_index[rotationLength.rotation.name]] = rotationLength.minLength
				maxLength[block_index][rotation_name_to_index[rotationLength.rotation.name]] = rotationLength.maxLength
			block_index += 1

		#print minLength
		#print maxLength

############ TemplateEvents #######################################################
	
		all_templateEvents = TemplateEvent.objects.all()
		templateEvent_pk_to_block = dict() #relates templateEvent model object to block index in .dat
		BWeeks = dict() #key block (templateEvent) index, value = list of week indices
		BWeeksMinus1 = dict()

		f.write("set B:= ")

		block = 1
		for event in all_templateEvents:
			blockStartDate = event.blockStartDate
			blockEndDate = event.blockEndDate
			block_index_to_dblock[block_name_to_index[event.block.name]].append(block)
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

############  Tracks #######################################################
		all_tracks = Track.objects.all()
		track_name_to_index = dict()
		minTrack = dict() #key track name, value = dictionary w/ key rotation name, value min edu req for rotation
		maxTrack = dict() #key track name, value = dictionary w/ key rotation name, value max edu req for rotation
		minSetTrack = dict() #key track name, value = dictionary w/ key rotation name, value min edu req for rotationSet
		maxSetTrack = dict() #key track name, value = dictionary w/ key rotation name, value max edu req for rotationSet

		#THIS IS HARDCODED!!! GOT RID OF TRACKS!!!
		f.write('set T := 1 ')
		#index 1 is 'noTrack'
		track_name_to_index['noTrack'] = 1

		track_index = 2
		for track in all_tracks:
			f.write(str(track_index) + ' ')
			track_name_to_index[str(track.name)] = track_index
			minTrack[str(track.name)] = dict() 
			maxTrack[str(track.name)] = dict()
			minSetTrack[str(track.name)] = dict()
			maxSetTrack[str(track.name)] = dict()

			for trackEducationReq in track.trackeducationreq_set.all():
				minTrack[str(track.name)][rotation_name_to_index[trackEducationReq.trackEducationReq_rotation.name]] = trackEducationReq.trackEducationReq_minLength
				maxTrack[str(track.name)][rotation_name_to_index[trackEducationReq.trackEducationReq_rotation.name]] = trackEducationReq.trackEducationReq_maxLength
			track_index += 1
		f.write(";\n")

		for rotationSet in all_rotationSets:
			for trackEduReq in rotationSet.settrackedureq_set.all():
				minSetTrack[trackEduReq.setTrackEduReq_track.name][redu_name_to_index[rotationSet.rotationSet_name]] = trackEduReq.setTrackEduReq_minLength
				maxSetTrack[trackEduReq.setTrackEduReq_track.name][redu_name_to_index[rotationSet.rotationSet_name]] = trackEduReq.setTrackEduReq_maxLength
		#print track_name_to_index

############ YearSet/yearcov #######################################################
		all_yearSets = YearSet.objects.all()
		yearSet_index_to_name = dict()
		yearSet_name_to_index = dict()
		yearSet_index_to_year_indices = dict()
		
		#Add a Yearset including all years, with name "All Years" - used for total demand
		if YearSet.objects.filter(yearSet_name="All Years").exists() is False:
			total_yearset = YearSet.objects.create(yearSet_name="All Years")
			for year in year_name_to_index: #assuming all names are different!
				y1 = Year.objects.filter(name=year)[0]
				total_yearset.years.add(y1)
				total_yearset.save()


		f.write("set Ycov := ")
		for index in year_index_to_name:
			f.write(str(index)+" ")

		ycov_index = len(year_index_to_name)+1
		for yearSet in all_yearSets:
			f.write(str(ycov_index)+" ")
			yearSet_index_to_name[ycov_index] = yearSet.yearSet_name
			yearSet_name_to_index[yearSet.yearSet_name] = ycov_index
			yearSet_index_to_year_indices[ycov_index] = []
			for year in yearSet.years.all():
				yearSet_index_to_year_indices[ycov_index].append(year_name_to_index[year.name])
			for yearSetDemand in yearSet.setyeardemand_set.all():
				yearSetDemandLower[rotation_name_to_index[yearSetDemand.setYearDemand_rotation.name]][ycov_index] = yearSetDemand.setYearDemand_minResidents
				yearSetDemandUpper[rotation_name_to_index[yearSetDemand.setYearDemand_rotation.name]][ycov_index] = yearSetDemand.setYearDemand_maxResidents
			ycov_index += 1

		f.write(";\n\n")

		#print yearSet_index_to_name

###############################################################################
############ Parameters #######################################################

#----windowSize--------#
		f.write("param windowSize := \n"+str(windowSize)+";\n\n")
##----minClinicWeeks--------#
		f.write("param minClinicWeeks := \n"+str(minClinicWeeks)+";\n\n")
##----lastWindowStart--------#
		f.write("param lastWindowStart := \n"+str(weeks[-1]-windowSize+1)+";\n\n")
##----Yset--------#
		f.write("param Yset :=")
		for year_index in year_index_to_name:
			f.write("\n"+str(year_index)+" ["+str(year_index)+"]")
		for yCov_index in yearSet_index_to_year_indices:
			f.write("\n"+str(yCov_index)+" "+str(yearSet_index_to_year_indices[yCov_index]))
		f.write(';\n\n')
##----Rset--------#
		f.write("param Rset :=")
		for rotation_index in rotation_index_to_name:
			f.write("\n"+str(rotation_index)+" ["+str(rotation_index)+"]")
		for redu_index in redu_index_to_rotation_indices:
			f.write("\n"+str(redu_index)+" "+str(redu_index_to_rotation_indices[redu_index]))
		f.write(';\n\n')
##----BWeeks--------#
		f.write("param WeeksPerBlock :=")
		for BWeek in BWeeks:
			f.write("\n"+str(BWeek) + " " + str(BWeeks[BWeek]))
		f.write(';\n\n')
##----BWeeksMinus1--------#
		f.write("param WeeksPerBlockMinus1 :=")
		for BWeek in BWeeksMinus1:
			f.write("\n"+str(BWeek) + " " + str(BWeeksMinus1[BWeek]))
		f.write(';\n\n')

##----BlocksPerDoctor--------#
		residentBlocks = dict() #key = resident index, value = list of blocks
		f.write("param BlocksPerDoctor :=")
		for year in YDoctors:
			for doctor in YDoctors[year]:
				current_block_list = []
				#add all template blocks from doctor's year to current_block_list
				for pk in template_year_to_pk[year]: #accounting for multiple templates; this shouldn't happen
					for block in template_pk_to_blocks[pk]:
						current_block_list.append(block)
				#create list of blocks excluded from individual doctor
				resExcludedBlocks_indices = []
				doctor_object = Resident.objects.filter(pk=resident_index_to_pk[doctor])[0] 
				for tEvent in doctor_object.resExcludedBlocks.all():
					resExcludedBlocks_indices.append(templateEvent_pk_to_block[tEvent.pk])
				#create list of blocks excluded from doctor's track
				trackExcludedBlocks_indices = []
				for track in doctor_object.tracks.all():
					for tEvent in track.excludedBlocks.all():
						trackExcludedBlocks_indices.append(templateEvent_pk_to_block[tEvent.pk])
				#create final block list: (year template block list) - (res excluded blocks | track excluded blocks)
				final_block_list = list(set(current_block_list).difference(set(resExcludedBlocks_indices).union(set(trackExcludedBlocks_indices))))
				residentBlocks[doctor] = final_block_list
				f.write("\n"+str(doctor)+" "+str(final_block_list))
		f.write(';\n\n')
##----YDoctors--------#
		f.write("param DoctorsPerYear :=")
		for year in YDoctors:
			if len(YDoctors[year]) != 0: 
				f.write("\n"+str(year_name_to_index[year])+" " + str(YDoctors[year]))
		f.write(';\n\n')

##----DoctorsPerYearPerWeek--------#
		residentsPerWeek = dict() #key = week, value = dictionary w/ key year, value list of docs, e.g. {1: [1,2,3], 2: [4,5,6]}
		#initialize empty residentsPerWeek
		for week in weeks:
			residentsPerWeek[week] = dict()
			for year in year_index_to_name:
				residentsPerWeek[week][year] = []

		for res in residentBlocks:
			for block in residentBlocks[res]:
				for week in BWeeks[block]:
					residentsPerWeek[week][year_name_to_index[resident_index_to_year[res]]].append(res)
		f.write("param DoctorsPerYearPerWeek:=")
		for year in YDoctors:
			for week in weeks:
				yIndex = year_name_to_index[year]
				if residentsPerWeek[week][yIndex]:
					f.write("\n"+str(yIndex)+" "+str(week)+" "+str(residentsPerWeek[week][yIndex]))
				#if residentsPerWeek[week][yIndex]:
				#	f.write("\n"+str(yIndex)+" "+str(week)+" "+str(residentsPerWeek[week][yIndex]))
		f.write(";\n\n")
		#if residentsPerWeek[week][yIndex]:

##----DemandLower--------#
		#combine: total demand, yearly demand, yearSet demand
		f.write("param DemandLower :=")
		#per-year demand (yearlyDemand)
		#I am assuming that for individual years, yCov index is same as year index (this is how I initialized yCov)
		for rotation_index in yearlyDemandLower:
			for year_index in yearlyDemandLower[rotation_index]:
				for week in weeks:
					f.write("\n"+str(rotation_index)+" "+str(year_index)+" "+str(week)+" "+str(yearlyDemandLower[rotation_index][year_index]))

		#per-yearSet demand, not including "all years" yearSet
		for rotation_index in yearSetDemandLower:
			for yearSet_index in yearSetDemandLower[rotation_index]:
				for week in weeks:
					f.write("\n"+str(rotation_index)+" "+str(yearSet_index)+" "+str(week)+" "+str(yearSetDemandLower[rotation_index][yearSet_index]))

		#check the per-yearSet demand, including total_demand for "All Years"
		for rotation_index in total_demand_lower:
			for week in weeks:
				f.write("\n"+str(rotation_index)+" "+str(yearSet_name_to_index["All Years"])+" "+str(week)+" "+str(total_demand_lower[rotation_index]))

		f.write(';\n\n')

##----DemandUpper--------#	
		#combine: total demand, yearly demand, yearSet demand
		f.write("param DemandUpper :=")
		#per-year demand (yearlyDemand)
		#I am assuming that for individual years, yCov index is same as year index (this is how I initialized yCov)
		for rotation_index in yearlyDemandUpper:
			for year_index in yearlyDemandUpper[rotation_index]:
				for week in weeks:
					f.write("\n"+str(rotation_index)+" "+str(year_index)+" "+str(week)+" "+str(yearlyDemandUpper[rotation_index][year_index]))

		#per-yearSet demand, not including "all years" yearSet
		for rotation_index in yearSetDemandUpper:
			for yearSet_index in yearSetDemandUpper[rotation_index]:
				for week in weeks:
					f.write("\n"+str(rotation_index)+" "+str(yearSet_index)+" "+str(week)+" "+str(yearSetDemandUpper[rotation_index][yearSet_index]))

		#check the per-yearSet demand, including total_demand for "All Years"
		for rotation_index in total_demand_upper:
			for week in weeks:
				f.write("\n"+str(rotation_index)+" "+str(yearSet_name_to_index["All Years"])+" "+str(week)+" "+str(total_demand_upper[rotation_index]))

		f.write(';\n\n')

##----MinEdu--------#
#educational requirements: year and track, for singular rotations and groups of rotations
		f.write("param MinEdu :=")
		# for year in minYear:
		# 	for rotation in minYear[year]:
		# 		f.write("\n"+str(year_name_to_index[year])+" "+str(rotation_name_to_index[rotation])+" "+str(minYear[year][rotation]))
		# f.write(';\n\n')

		for resident_index in resident_index_to_pk:
			#track requirements override year requirements
			if len(resident_pk_to_track[resident_index_to_pk[resident_index]]) != 0:
				#print "Track is NOT none for res index "+str(resident_index)
				for track in resident_pk_to_track[resident_index_to_pk[resident_index]]:
					#if this track has a min educational requirement
					if len(minTrack[track]) != 0:
						#for individual rotations
						for rotation_index in minTrack[track]:
							f.write("\n"+str(resident_index)+" "+str(rotation_index)+" "+str(minTrack[track][rotation_index]))
						#for rotation sets
						for rotationSet_index in minSetTrack[track]:
							f.write("\n"+str(resident_index)+" "+str(rotationSet_index)+" "+str(minSetTrack[track][rotationSet_index]))

			else: #resident is not in a track/specialty -- use regular year educational requirements
				#print "Track is none for res index "+str(resident_index)
				year_index = year_name_to_index[resident_index_to_year[resident_index]]
				#for individual rotations
				for rotation_index in minYear[year_index]:
					f.write("\n"+str(resident_index)+" "+str(rotation_index)+" "+str(minYear[year_index][rotation_index]))
				#for rotation sets
				for rotationSet_index in minSetYear[year_index]:
							f.write("\n"+str(resident_index)+" "+str(rotationSet_index)+" "+str(minSetYear[year_index][rotationSet_index]))


		f.write(';\n\n')

##----MaxEdu--------#
		f.write("param MaxEdu :=")
		for resident_index in resident_index_to_pk:
			#track requirements override year requirements
			if len(resident_pk_to_track[resident_index_to_pk[resident_index]]) != 0:
				for track in resident_pk_to_track[resident_index_to_pk[resident_index]]:
					#if this track has a max educational requirement
					if len(maxTrack[track]) != 0:
						#for individual rotations
						for rotation_index in maxTrack[track]:
							f.write("\n"+str(resident_index)+" "+str(rotation_index)+" "+str(maxTrack[track][rotation_index]))
						#for rotation sets
						for rotationSet_index in maxSetTrack[track]:
							f.write("\n"+str(resident_index)+" "+str(rotationSet_index)+" "+str(maxSetTrack[track][rotationSet_index]))

			else: #resident is not in a track/specialty -- use regular year educational requirements
				year_index = year_name_to_index[resident_index_to_year[resident_index]]
				#for individual rotations
				for rotation_index in maxYear[year_index]:
					f.write("\n"+str(resident_index)+" "+str(rotation_index)+" "+str(maxYear[year_index][rotation_index]))
				#for rotation sets
				for rotationSet_index in maxSetYear[year_index]:
							f.write("\n"+str(resident_index)+" "+str(rotationSet_index)+" "+str(maxSetYear[year_index][rotationSet_index]))
		# for year in maxYear:
		# 	for rotation in maxYear[year]:
		# 		f.write("\n"+str(year_name_to_index[year])+" "+str(rotation_name_to_index[rotation])+" "+str(maxYear[year][rotation]))
		# f.write(';\n\n')

		f.write(';\n\n')

##----MinLength--------#
		f.write("param MinLength :=")
		for block_index in minLength:
			if block_index in block_index_to_dblock:
				for rotation_index in minLength[block_index]:
					for templateEvent_index in block_index_to_dblock[block_index]:
						f.write("\n"+str(rotation_index)+" "+str(templateEvent_index)+" "+str(minLength[block_index][rotation_index]))
						#print "Rotation "+rotation_index_to_name[rotation_index]+" has min length "+str(minLength[block_index][rotation_index])+" in block index "+str(block_index)
		f.write(';\n\n')
##----MaxLength--------#
		f.write("param MaxLength :=")
		for block_index in maxLength:
			if block_index in block_index_to_dblock:
				for rotation_index in maxLength[block_index]:
					for templateEvent_index in block_index_to_dblock[block_index]:
						f.write("\n"+str(rotation_index)+" "+str(templateEvent_index)+" "+str(maxLength[block_index][rotation_index]))
		f.write(';\n\n')

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
				f.write("\n"+str(res_index)+" 1 "+str(week)+" "+str(yearMult*(vacationBase[vacWeight] * vacationMult ** 2))) 
		for res_index in vacation2:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in vacation2[res_index]:
				vacWeight = vacationPreference[res_index]
				f.write("\n"+str(res_index)+" 1 "+str(week)+" "+str(yearMult*(vacationBase[vacWeight] * vacationMult))) 
		for res_index in vacation3:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in vacation3[res_index]:
				vacWeight = vacationPreference[res_index]
				f.write("\n"+str(res_index)+" 1 "+str(week)+" "+str(yearMult*(vacationBase[vacWeight])))

		for res_index in elective1:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective1[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 9)))
		for res_index in elective2:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective2[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 8)))
		for res_index in elective3:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective3[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 7)))
		for res_index in elective4:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective4[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 6)))
		for res_index in elective5:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective5[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 5)))
		for res_index in elective6:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective6[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 4)))
		for res_index in elective7:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective7[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 3)))
		for res_index in elective8:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective8[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult ** 2)))
		for res_index in elective9:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective9[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase * electiveMult)))
		for res_index in elective10:
			year = resident_index_to_year[res_index]
			yearMult = yearNum[year] #multiply preference weight by the year of residency -- seniority weighting
			for week in weeks:
				f.write("\n"+str(res_index)+" "+str(elective10[res_index])+" "+str(week)+" "+str(yearMult*(electiveBase)))
		f.write(';\n\n')

		f.close()
		os.system('pyomo --instance-only --save-model=rotsched.lp rotation_scheduler6.py test.dat --symbolic-solver-labels')
		#os.system('pyomo --instance-only --save-model=rotsched.lp rotation_scheduler6.py rotation_dat_year_working6.dat --symbolic-solver-labels')
###############################################################################
############ Cplex solution #######################################################
		Schedule.objects.all().delete()
		Event.objects.all().delete() 

		import cplex
		cpx = cplex.Cplex("rotsched.lp") ### any lp file generated by pyomo
		M = 3 #numSolns to generate
		ObjTolerance = 0.50 #fraction of best objective tolerated while finding multiple schedules,1 == find only optimal
		cpx.parameters.preprocessing.symmetry.set(5)

		cpx.solve() # solve for optimal solution
		print cpx.solution.get_objective_value()
		successful = cpx.solution.get_status()
		print(successful)
		#### successful != 101 := problem is infeasible .. Raise flags for the web app

		# if successful == 101 or successful == 102: #101 is code for MIP_optimal #Todo: remove this hardcode
		# 	acceptedSolnIndices = [] #indices of optimal solutions, not including best optimal, # of such solutions = M
		# 	acceptedSolnVars = [] #list of lists of Z variables of accepted solns (as strings), including best optimal
		# 						  # used for comparison with newly found schedules to prevent redundancy
		# 	alternate_solutions = {} #not used currently
		# 	obj_value = {} #objective value of each solution
		# 	solnIndicesAll = [] # indices of all solutions found so far, not including best optimal
		# 	solnNamesAll = [] # names of all solutions found so far, not including best optimal


		# 	bestObjective = cpx.solution.get_objective_value()
		# 	#optimal_solution = cpx.solution.get_values() ## One optimal solution ready to be displayed in the web-app
		# 	#optimal_solution_1 = cpx.solution.pool.get_values(0, "Z(45_MICU_N_1)")
		# 	#print "Optimal solution 1: "+str(optimal_solution_1)+"---------------------------------"
		# 	##print "Variables: "+str(cpx.variables.get_names())

		# 	createdSchedule = Schedule(name="Best Solution",utility=bestObjective)
		# 	createdSchedule.save()

		# 	solnVars = [] #list of Z variables of this solution
		# 				  # used for comparison with previously-found solns to prevent redundancy
		# 	#create events in best schedule
		# 	for res_pk in resident_pk_to_index:
		# 		for rotation in rotation_names:
		# 			for week in weeks:
		# 				#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")"
		# 				if str(cpx.solution.pool.get_values(0,"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")")) == "1.0":
		# 					solnVars.append("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")") #note: keep rotation as is, so later event can refer to original rotation name, w/o "_" replacements
		# 					res = Resident.objects.filter(pk=res_pk)[0]
		# 					rot = Rotation.objects.filter(name=rotation)[0]
		# 					start = week_to_date[week]
		# 					end = week_to_end_date[week]
		# 					createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
		# 					createdEvent.save()

			# acceptedSolnVars.append(solnVars) #add best optimal solution to accepted soln variable list, to prevent redundancy in solution pool


			# cpx.parameters.mip.pool.intensity.set(4) #leave no stone unturned: find all feasible solutions
			# numOptimalSolns = M
			# cpx.parameters.mip.limits.populate.set(M) #set number of solutions to M
			# cpx.populate_solution_pool() #solve and populate the solution pool
			# solnNames = cpx.solution.pool.get_names()
			# solnIndices = cpx.solution.pool.get_indices(solnNames)

			# while (len(acceptedSolnIndices)+1) < numOptimalSolns and solnIndices:
			# 	for i in solnIndices:
			# 		solnVars = [] #list of Z variables of this solution
			# 					  # used for comparison with previously-found solns to prevent redundancy
			# 		obj_value[i] = cpx.solution.pool.get_objective_value(i)

			# 		# solution objective value is above threshold
			# 		if obj_value[i] >= ObjTolerance*bestObjective:
			# 			#add all Z variables to solnVars, then compare with previously-found solns; check uniqueness
			# 			for res_pk in resident_pk_to_index:
			# 				for rotation in rotation_names:
			# 					for week in weeks: 
			# 						#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation)+"_"+str(week)+")"
			# 						#print "Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")"
			# 						if str(cpx.solution.pool.get_values(i,"Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")")) == "1.0": #used to have solnIndices[i] as first arg!!!
			# 							solnVars.append("Z("+str(resident_pk_to_index[res_pk])+"_"+str(rotation_name_to_index[rotation])+"_"+str(week)+")")

			# 						#rotation.replace("-","_").replace(" ","_")
			# 			unique_schedule = True

			# 			#compare this schedule to every already-accepted soln
			# 			for sched in acceptedSolnVars:
			# 				if set(sched) == set(solnVars):
			# 					unique_schedule = False
			# 					break
			# 			if unique_schedule:
			# 				acceptedSolnVars.append(solnVars)

			# 				#create model Schedule instance
			# 				createdSchedule = Schedule(name="Schedule"+str(i),utility=obj_value[i])
			# 				createdSchedule.save()
			# 				#print createdSchedule.name

			# 				#create model Events for this schedule
			# 				for assignment in solnVars:
			# 					split_variable = assignment.strip(")").split("(")[1].split("_")
			# 					#print split_variable
			# 					res = Resident.objects.filter(pk=resident_index_to_pk[int(split_variable[0])])[0]
			# 					rot = Rotation.objects.filter(name=rotation_index_to_name[int(split_variable[1])])[0]
			# 					start = week_to_date[int(split_variable[2])]
			# 					end = week_to_end_date[int(split_variable[2])]
			# 					createdEvent = Event(resident=res,rotation=rot,startDate=start,endDate=end,schedule=createdSchedule)
			# 					createdEvent.save()

			# 				acceptedSolnIndices.append(i)

			# 	solnIndicesAll.extend(solnIndices)
			# 	solnNamesAll.extend(solnNames)

			# 	cpx.parameters.mip.limits.populate.set(M) #set number of solutions to M
			# 	cpx.populate_solution_pool() #solve and populate the solution pool
			# 	solnNames = cpx.solution.pool.get_names()
			# 	[solnNames.remove(s) for s in solnNamesAll] #getting rid of solutions that have been found already
			# 	solnIndices = cpx.solution.pool.get_indices(solnNames)

			# print "Accepted solution indices, not including best solution: "+str(acceptedSolnIndices)
			# print "All solution indices: "+str(solnIndicesAll)
			# print(obj_value)


##----YBlocks--------#
'''		f.write("param YBlocks :=")
		for year in template_year_to_pk:
			for pk in template_year_to_pk[year]:
				if len(template_pk_to_blocks[pk]) != 0:
					f.write("\n'"+str(year)+"' "+str(template_pk_to_blocks[pk]))
		f.write(';\n\n')
##----Year--------#
		f.write("param Year :=")
		for year in YDoctors:
			for res_index in YDoctors[year]:
				f.write("\n"+str(res_index)+" '"+str(year)+"'")
		f.write(';\n\n')
			
##----YearlyDemandLower--------#
		ydLower_initialized = False
		for rotation in yearlyDemandLower:
			for year in yearlyDemandLower[rotation]:
				for week in weeks:##
					if yearlyDemandLower[rotation][year] is not None:
						if ydLower_initialized is False:
							f.write("param YearlyDemandLower :=")
							ydLower_initialized = True
					f.write("\n'"+str(rotation_name_to_index[rotation])+"' '"+str(year_name_to_index[year])+"' "+str(week)+" "+str(yearlyDemandLower[rotation][year]))
		if ydLower_initialized:
			f.write(';\n\n')
##----YearlyDemandUpper--------#
		ydUpper_initialized = False
		for rotation in yearlyDemandUpper:
			for year in yearlyDemandUpper[rotation]:
				for week in weeks: 
					if yearlyDemandUpper[rotation][year] is not None:
						if ydUpper_initialized is False:
							f.write("param YearlyDemandUpper :=")
							ydUpper_initialized = True
					f.write("\n'"+str(rotation)+"' '"+str(year)+"' "+str(week)+" "+str(yearlyDemandUpper[rotation][year]))
		if ydUpper_initialized:
			f.write(';\n\n')
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


'''
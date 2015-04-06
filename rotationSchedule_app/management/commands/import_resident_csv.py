from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Resident, Year, Track, Rotation
import copy
import random
import operator
import sys
import logging
import os
from django.conf import settings
import datetime
from dateutil.rrule import rrule, WEEKLY
import csv

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

		dataReader = csv.reader(open("resident_model.csv"),delimiter=",")

		for row in dataReader:
			if row[0] != 'Name': #Ignore the header row, import everything else
				resident = Resident.objects.get_or_create(name=row[0])[0]
				resident.email = row[1]
				resident.year = Year.objects.get_or_create(name=row[2])[0]
				#ignore tracks
				resident.inProgram = row[4]
				resident.vacationStart1 = None
				resident.vacationStart2 = None
				resident.vacationStart3 = None
				resident.vacationEnd1 = None
				resident.vacationEnd2 = None
				resident.vacationEnd3 = None

				# if row[5] == '' or str(row[5]).split("-")[0] == "2016" or str(row[5])=="2015-12-20":
				# 	resident.vacationStart1 = None
				# else:
				# 	resident.vacationStart1 = row[5]
				# if row[6] == '' or str(row[6]).split("-")[0] == "2016":
				# 	resident.vacationEnd1 = None
				# else:
				# 	resident.vacationEnd1 = row[6]
				# if row[7] == '' or str(row[7]).split("-")[0] == "2016" or str(row[7])=="2015-12-20":
				# 	resident.vacationStart2 = None
				# else:
				# 	resident.vacationStart2 = row[7]
				# if row[8] == '' or str(row[8]).split("-")[0] == "2016":
				# 	resident.vacationEnd2 = None
				# else:
				# 	resident.vacationEnd2 = row[8]
				# if row[9] == '' or str(row[9]).split("-")[0] == "2016" or str(row[9])=="2015-12-20":
				# 	resident.vacationStart3 = None
				# else:
				# 	resident.vacationStart3 = row[9]
				# if row[10] == '' or str(row[10]).split("-")[0] == "2016":
				# 	resident.vacationEnd3 = None
				# else:
				# 	resident.vacationEnd3 = row[10]
				if row[11] == '':
					resident.elective1 = None
				else:
					resident.elective1 = Rotation.objects.get_or_create(name=row[11])[0]
				if row[12] == '':
					resident.elective2 = None
				else:
					resident.elective2 = Rotation.objects.get_or_create(name=row[12])[0]
				if row[13] == '':
					resident.elective3 = None
				else:
					resident.elective3 = Rotation.objects.get_or_create(name=row[13])[0]
				if row[14] == '':
					resident.elective4 = None
				else:
					resident.elective4 = Rotation.objects.get_or_create(name=row[14])[0]
				if row[15] == '':
					resident.elective5 = None
				else:
					resident.elective5 = Rotation.objects.get_or_create(name=row[15])[0]
				if row[16] == '':
					resident.elective6 = None
				else:
					resident.elective6 = Rotation.objects.get_or_create(name=row[16])[0]
				if row[17] == '':
					resident.elective7 = None
				else:
					resident.elective7 = Rotation.objects.get_or_create(name=row[17])[0]
				if row[18] == '':
					resident.elective8 = None
				else:
					resident.elective8 = Rotation.objects.get_or_create(name=row[18])[0]
				if row[19] == '':
					resident.elective9 = None
				else:
					resident.elective9 = Rotation.objects.get_or_create(name=row[19])[0]
				if row[20] == '':
					resident.elective10 = None
				else:
					resident.elective10 = Rotation.objects.get_or_create(name=row[20])[0]
				resident.save()
				#skip rest of electives, couple, and excludedBlocks












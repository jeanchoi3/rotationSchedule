from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Rotation, RotationModel
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
		#rotation_csv = RotationModel.import_data(data=open("rotation_model.csv"))

		dataReader = csv.reader(open("rotation_model.csv"),delimiter=",")

		for row in dataReader:
			if row[0] != 'Name': #Ignore the header row, import everything else
				rotation = Rotation.objects.get_or_create(name=row[0])[0]
				rotation.minResidents = 0
				rotation.maxResidents = 100
				rotation.save()
				#resident.year = Year.objects.get_or_create(name=row[2])[0]
				#ignore tracks
				#resident.inProgram = row[4]
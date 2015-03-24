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
		vacationBase = {}
		vacationMult = 5
		for i in range(1,11):
			print i
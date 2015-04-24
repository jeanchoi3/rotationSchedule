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
	# option_list = BaseCommand.option_list + (
 #    	make_option('--long', '-l', dest='long',
 #    		help='Help for the long options'),
 #    	)
	# help = 'Help text goes here'

	# option_list = [
 #    make_option("-f", "--filename",
 #                action="store", type="string", dest="filename"),
 #    ]
	# parser = OptionParser(option_list=option_list)

	option_list = BaseCommand.option_list + (
	make_option("-f", "--filename",
                action="store", type="string", dest="filename"),
	)
	help = 'Help text goes here'


	def handle(self, *args, **options):
		os.chdir(os.path.join(os.path.dirname(os.path.abspath(settings.BASE_DIR)), 'rotationSchedule_app/management/commands'))		

		os.system('pyomo --instance-only --save-model='+str(options.get('filename'))+'.lp feasibility_test_model.py '+str(options.get('filename'))+'.dat --symbolic-solver-labels')

		import cplex
		cpx = cplex.Cplex(str(options.get('filename'))+".lp") ### any lp file generated by pyomo
		M = 3 #numSolns to generate
		ObjTolerance = 0.50 #fraction of best objective tolerated while finding multiple schedules,1 == find only optimal
		cpx.parameters.preprocessing.symmetry.set(5)

		cpx.solve() # solve for optimal solution
		print cpx.solution.get_objective_value()
		successful = cpx.solution.get_status()
		print(successful)
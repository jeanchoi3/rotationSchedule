from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Block, Resident, Year, Track, Program, Rotation, Event, Schedule
import copy
import random
import operator
import sys
#import numpy as np
import logging

logging.basicConfig(stream=sys.stdout, format='%(message)s',level=logging.INFO)

#ideas:
# 1. just generate one set of random schedules, then check against each doctor
#    and add them to all possible_schedule lists where possible

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('--long', '-l', dest='long',
            help='Help for the long options'),
    )
    help = 'Help text goes here'

    def handle(self, **options):
        all_schedules = Schedule.objects.all()
        schedules = []

        for schedule in all_schedules:
            schedules.append(str(schedule.name))

        for schedule in schedules:
        	events = Event.objects.filter(schedule__name=schedule)
        	print schedule
        	print events








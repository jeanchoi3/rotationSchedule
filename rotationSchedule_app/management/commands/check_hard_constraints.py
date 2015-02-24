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

#NEW VERSUS OLD START DATES?????

class Command(BaseCommand):
    args = '<event_pk event_start event_end>'
    option_list = BaseCommand.option_list + (
        make_option('--long', '-l', dest='long',
            help='Help for the long options'),
    )
    help = 'Help text goes here'

    def handle(self, *args, **options):
        #for pk in args:
        try:
            dragged_event = Event.objects.get(pk=int(args[0]))
            dragged_event.startDate = args[1]
            dragged_event.endDate = args[2]
            dragged_event.save()
            return "Original end date: "+str(dragged_event.endDate)+", Dragged end date:"+str(args[2])
            #return "Original start date: "+str(event.startDate)+", Dragged start date:"+str(args[1])
            #return str(event.startDate)+str(request.)
        except Event.DoesNotExist:
            raise CommandError('Event "%s" does not exist' % pk)
            return "Didn't find!"

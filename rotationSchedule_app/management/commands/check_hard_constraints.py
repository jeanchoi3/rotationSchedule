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


class Command(BaseCommand):
    args = '<event_pk event_start event_end>'
    option_list = BaseCommand.option_list + (
        make_option('--long', '-l', dest='long',
            help='Help for the long options'),
    )
    help = 'Help text goes here'

    def handle(self, *args, **options):


        #is this how do you fetch intermediate models??
        #all_rotation_lengths = RotationLength.objects.all()
        #all_year_demand = YearDemand.objects.all()
        #all_education_req = EducationReq.objects.all()
        #for pk in args:
        '''
        try:
            dragged_event = Event.objects.get(pk=int(args[0]))
            dragged_event.startDate = args[1]
            dragged_event.endDate = args[2]
            dragged_event.save()
            return "The current schedule is illegal!"
            #return "Original end date: "+str(dragged_event.endDate)+", Dragged end date:"+str(args[2])
            #return "Original start date: "+str(event.startDate)+", Dragged start date:"+str(args[1])
            #return str(event.startDate)+str(request.)
        except Event.DoesNotExist:
            raise CommandError('Event "%s" does not exist' % pk)
            return "Didn't find!"
            '''

    #Notes: the drag and drop only applies for moving events that are already on the schedule; it doesn't allow
    #       you to add new events onto the calendar. this is why i don't need year_Rule (dragging sth doesn't
        #   change whether you meet educational requirements!
        # it also doesn't allow you to change the length; also why you don't need year_rule
        # ultimately, i should need both of the block rules in 
 
    # The problem is that once you change an event's time, you don't have memory of what it used to be,
    # so you can't only change things once the schedule is legal. one possibility would be to clone
    # the schedule so you have a "back-up" copy, and then just let the person change things around on the
    # original one
    # So we can just let people drag stuff wherever they want, and check the WHOLE schedule every time for
    # whether it's legal or not, and display this "illegal/legal" thing on the side after each drag, with
    # some nice info about why it's illegal.  I think I should do this, and not worry about the backup copy
    # for now.

    # you move a rotation from one place to another: what do you have to worry about?
    # 1) that the general and year-dependent coverage for the rotation is ok, in the 2 places it's moved to/from
    # 2) that the number of rotations in the block 
    # can you make the switching automatic??? check for a rotaiton for same resident that starts at the same time

        all_rotations = Rotation.objects.all()
        all_years = Year.objects.all()
        all_tracks = Track.objects.all()
        all_programs = Program.objects.all()
        all_residents = Resident.objects.all()
        all_blocks = Block.objects.all()
        all_schedules = Schedule.objects.all()
        all_events = Event.objects.all()

        #make sure the # total residents on a rotation at any time is correct!

        # create dictionaries for total demand min and total demand max
        
        rotation_names = []
        rotation_demand_min = dict()
        rotation_demand_max = dict()

        for rotation in all_rotations:
            rotation_names.append(str(rotation.name))
            rotation_demand_min[str(rotation.name)] = rotation.minResidents
            rotation_demand_max[str(rotation.name)] = rotation.maxResidents


        def general_coverage_rule(schedule, demand_min, demand_max):
            # loop through all weeks in schedule
            for i in range(len(weeks)):
                #print i
                rotation_coverage = [sum(x) for x in zip(*(schedule[:,i]))]
                #print "week "+str(i) +" sum: "+str(rotation_coverage)
                #checking general coverage requirement (not identifier-dependent)
                for j in range(len(rotations)):
                    if rotation_coverage[j] < demand_min[j] or rotation_coverage[j] > demand_max[j]:
                        logging.debug("failure in coverage of rotation "+str(j)+" in week "+str(i))
                        return False
            return True

        def year_coverage_rule(schedule):
            for year in years:
                #print "year: "+year
                resident_indices = []
                for resident in residents:
                    if year in resident_ids[resident]:
                        resident_indices.append(residents.index(resident))
                #print "Residents with identifier "+year+": "+str(resident_indices)
                year_schedule = schedule[resident_indices]
                #print year_schedule
                if general_coverage_rule(year_schedule, year_demand_min[year], year_demand_max[year]) == False:
                    return False
            return True'''
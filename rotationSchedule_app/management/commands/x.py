from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from rotationSchedule_app.models import Block, Resident, Year, Track, Program, Rotation
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
        all_residents = Resident.objects.all()
        residents = []
        resident_ids = dict()

        for resident in all_residents:
            residents.append(str(resident.name))

            resident_ids[str(resident.name)] = []
            if resident.year != None and resident.year != "":
                resident_ids[str(resident.name)].append(str(resident.year.name))
            for track in resident.tracks.all():
                if track != None and track != "":
                    resident_ids[str(resident.name)].append(str(track.name))

        print residents
        print resident_ids

        all_rotations = Rotation.objects.all()
        rotations = []
        rotation_demand_min = []
        rotation_demand_max = []

        for rotation in all_rotations:
            rotations.append(str(rotation.name))
            rotation_demand_min.append(rotation.minResidents)
            rotation_demand_max.append(rotation.maxResidents)
        print rotations
        print rotation_demand_min
        print rotation_demand_max

        rotation_list = [0]*len(rotations)

        all_blocks = Block.objects.all()
        blocks = []
        for block in all_blocks:
            blocks.append(str(block.name))
        print blocks

        all_years = Year.objects.all()
        years = []
        for year in all_years:
            years.append(str(year.name))
        print years

        #THE FOLLOWING IS HARDCODED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ##############################################################
        weeks = ['0','1','2','3','4','5'] #DO I NEED THIS? OR JUST RANGE(NUM_WEEKS)
        num_weeks = len(weeks)

        #next line is not hardcoded
        schedule = np.array([[[0]*len(rotations) for j in range(len(weeks))] for i in range(len(residents))])

        year_demand_min = dict((key, [0]*len(rotations)) for key in years)
        year_demand_max = dict((key, [sys.maxint]*len(rotations)) for key in years)
        rotation_demand_min[0] = 3

        year_min = dict((key, [0]*len(rotations)) for key in years)
        year_max = dict((key, [sys.maxint]*len(rotations)) for key in years)

        block_times = dict((key, []) for key in blocks)
        #MAKE SURE THIS STARTS AT WEEK 0!!!!!
        block_times['two-week'].append([0,1])
        block_times['two-week'].append([2,3])
        block_times['one-week'].append([4])
        block_times['one-week'].append([5])
        logging.debug(block_times)

        #is the min number necessary??
        block_rotation_num_min = dict((key, 0) for key in blocks)
        block_rotation_num_max = dict((key, sys.maxint) for key in blocks)
        #block_rotation_num_max['two-week'] = 1
        #print "block rotation num min:"+str(block_rotation_num_min)

        block_rotation_length_min = dict((key, [0]*len(rotations)) for key in blocks)
        block_rotation_length_max = dict((key, [sys.maxint]*len(rotations)) for key in blocks)
        block_rotation_length_min['two-week'][0] = 2
        block_rotation_length_min['two-week'][1] = 2
        ##############################################################

        def block_length_rule(doctor_schedule):
            for block in blocks:
                logging.debug("Block "+str(block))
                for instance in block_times[block]:
                    if instance[-1] == num_weeks - 1:
                        last_week = num_weeks
                    else:
                        last_week = instance[-1]+1
                    current_rotation = doctor_schedule[instance[0]].index(1) #first occurrence of 1
                    num_contiguous = 0

                    for week in range(instance[0],last_week):
                        #if resident has same rotation this week as in prev week
                        if doctor_schedule[week].index(1) == current_rotation:
                            num_contiguous += 1
                        else:
                            logging.debug("New rotation "+str(doctor_schedule[week].index(1))+" starts on week "+str(week)+\
                                " and last rotation was "+str(num_contiguous)+" contiguous weeks")
                            #check whether last rotation matches length requirements
                            if num_contiguous < block_rotation_length_min[block][current_rotation] or num_contiguous > block_rotation_length_max[block][current_rotation]:
                                logging.debug("Doctor schedule: "+str(doctor_schedule))
                                logging.debug("Number of contiguous weeks for rotation "+str(current_rotation)+" wrong, caught on week "+str(week))
                                return False
                            current_rotation = doctor_schedule[week].index(1)
                            num_contiguous = 0
                        if week == last_week-1:
                            if num_contiguous < block_rotation_length_min[block][current_rotation] or num_contiguous > block_rotation_length_max[block][current_rotation]:
                                logging.debug("LAST WEEK")
                                logging.debug(doctor_schedule)
                                logging.debug("Number of contiguous weeks for rotation "+str(current_rotation)+" wrong, caught on week "+str(week))
                                return False

            return True

        def block_num_rule(doctor_schedule):
            for block in blocks:
                for instance in block_times[block]:
                        #take this subsection of weeks, and count # rotations in it
                        #check if last week in block is last week of schedule
                    if instance[-1] == len(weeks)-1:
                        doctor_rotations = [sum(x) for x in zip(*doctor_schedule[instance[0]:])]
                    else:
                        doctor_rotations = [sum(x) for x in zip(*doctor_schedule[instance[0]:instance[-1]+1])]
                    #print "doctor rotation sum array for "+str(resident)+" instance "+str(instance)+":"+str(doctor_rotations)
                    num_rotations = len(rotations) - doctor_rotations.count(0)
                    #print "Num rotations for resident "+str(resident)+" in block "+block+" instance "+str(instance)+":"+str(num_rotations)
                    if num_rotations < block_rotation_num_min[block] or num_rotations > block_rotation_num_max[block]:
                        logging.debug("Number of rotations in block "+block+" instance "+str(instance)+" res "+str(resident)+" is incorrect")
                        return False
            return True

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
            return True


        #year_rule
        def year_rule(doctor_schedule, doctor_index):
            doctor_sum = [sum(x) for x in zip(*doctor_schedule)]
            #print "doctor's year(s): "+ str(resident_ids[residents[doctor_index]])
            for identifier in resident_ids[residents[doctor_index]]:
                for i in range(len(rotations)):
                    if doctor_sum[i] < year_min[identifier][i] or doctor_sum[i] > year_max[identifier][i]:
                        return False
            return True


        possible_rotation_schedules = [set() for i in range(len(residents))]

        #for resident in residents
        for doctor in range(len(residents)):
            #print "Doctor "+str(doctor)
            for i in range(500):
                doctor_schedule = [[0]*len(rotations) for j in range(len(weeks))]
                rands = ""
                for week in range(num_weeks):
                    rand = random.choice(range(len(rotations)))
                    doctor_schedule[week][rand] = 1
                    rands = rands + str(rand)

                #check whether this is feasible schedule for this doctor's year/track
                logging.debug("*********************************")
                if year_rule(doctor_schedule, doctor) and block_num_rule(doctor_schedule) and block_length_rule(doctor_schedule):
                    possible_rotation_schedules[doctor].add(rands)

                    #THIS IS FOR DEBUGGING COVERAGE RULE!!!!!!!##################################################################
                    schedule[doctor] = copy.deepcopy(doctor_schedule)
                else:
                    logging.debug("violates year rule: "+str(doctor_schedule))
                #print "Schedule" + str(doctor_schedule)
                #print "Rands:" + rands

        logging.debug("Possible rotation schedules: "+str(possible_rotation_schedules))


        possible_schedules = set()

        #try to create feasible total schedule from random selection of residents' feasible rotation schedules
        for i in range(500):
            schedule = np.array([[[0]*len(rotations) for j in range(len(weeks))] for i in range(len(residents))])
            schedule_string = ""
            for resident in range(len(residents)):
                logging.debug("Resident "+str(resident))
                rand = random.sample(possible_rotation_schedules[resident], 1)
                schedule_string += str(rand[0])
                logging.debug("Rand: "+str(rand[0]))
                doctor_schedule = [[0]*len(rotations) for j in range(len(weeks))]
                for k in range(len(weeks)):
                    doctor_schedule[k][int(str(rand[0])[k])] = 1 #int(rand[k])
                logging.debug(doctor_schedule)
                schedule[resident] = doctor_schedule
            if general_coverage_rule(schedule, rotation_demand_min, rotation_demand_max) and year_coverage_rule(schedule):
                #feasible overall schedule
                #print "Found feasible schedule!!"
                #print schedule
                possible_schedules.add(schedule_string)

        print possible_schedules
         #prog = Program(name="ScriptNewProgram")
         #prog.save()

 #NoArgsCommand, LabelCommand or AppCommand
 # handle_noargs, handle_label, handle_app
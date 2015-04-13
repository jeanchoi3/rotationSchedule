from coopr.pyomo import *
import sys

#Create the model object
model = AbstractModel()

#Sets
model.R = Set() #rotation
model.Redu = Set() # meta rotations with educational requirements
model.Ycov = Set() # meta years PGY1 = 1, PGY2 = 2, PGY3 =3, PGY2 or PGY3 = 4
model.E = Set() ## Elective rotations
model.D = Set() #resident ("doctor")
model.W = Set() #weeks in the year
model.Y = Set() #years in the program
model.B = Set() #blocks in the program, unique numbers across all cohorts. For example, cohort 1 will have blocks 1 2 3 4 5, cohort 2 will have 6, 7, 8, 9, 10
model.O = Set() #objective factors
model.T = Set() #Tracks in the program
model.C = Set() #number of cohorts in the system
model.Couples = Set(dimen=2) ## set of couples


#debugging: could replace with just set of all cohorts model.c??
model.CohortsPerDoctor= Param(model.D,default=[]) ## Cohorts that doctor d can be assigned to
model.ClinicWeeks = Param(model.C,default=[]) ## Clinic weeks in each cohort
model.ElectiveWeeks = Param(model.C, default = []) ## Elective weeks in each cohort
model.maxVacationWeeks = Param(within=NonNegativeIntegers, default=2)
model.WeeksPerBlock = Param(model.B, default = []) ## week #s in each block allocated to core rotations, 
##for example: WeeksPerBlock = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
model.WeeksPerBlockMinus1 = Param(model.B, default = []) ## last week removed from each block allocated for core rotations, 

model.BlocksPerCohort = Param(model.C,default = []) ## Blocks corresponding to each cohort

model.WeeksPerDoctor = Param(model.D, default=[])
model.RotationsPerDoctor = Param(model.D, default=[])

###Preference Parameters
model.P = Param(model.D, model.R, model.W, default=1) #Preference for doctor d of yr y and rotation r of week w

model.MinLength = Param(model.R, model.B, default=0) #minimum length of rotation r in a block b
model.MaxLength = Param(model.R, model.B, default=sys.maxsize) #maximum length of rotation r in a block b

model.Objective = Param(model.O, default=0) #weights for each objective factor

#Variables
model.Z = Var(model.D, model.R, model.W, within=Binary) #Assignment of doctor d to rotation r on week w
model.L = Var(model.D, model.R, model.B, model.C, within=Binary) #Contiguous Variable
model.K = Var(model.D, model.C, within = Binary) # Cohort Assignment of doctor d to cohort c
model.Zc = Var(model.D, model.R, model.W, model.C, within = Binary) # Z for each cohort c
model.Zabsc = Var(model.D,model.R,model.W, model.C, within=Binary) #Variable to linearize contiguous constraint

#######Objective##############
def Objective_rule(model):
    return sum(sum(sum(model.Z[d,r,w]*model.P[d,r,w] for w in model.WeeksPerDoctor[d]) for r in model.RotationsPerDoctor[d]) for d in model.D)
model.Total_Utility = Objective(rule=Objective_rule, sense=maximize)

# Cohort Constraints: Can only belong to one cohort
def cohort_rule(model, d):
 	return sum(model.K[d,c] for c in model.CohortsPerDoctor[d]) == 1
model.cohortConstraint = Constraint(model.D, rule=cohort_rule)
# Set to zero for cohorts that d cannot be assigned to
def cohortZero_rule(model, d, c):
	if c not in model.CohortsPerDoctor[d]:
 		return model.K[d,c] == 0
 	return Constraint.Skip
model.cohortZeroConstraint = Constraint(model.D, model.C, rule=cohortZero_rule)

#To do: generalize vacation to the actual number!!!!!!
#Vacation shouldn't exceed maximum number of weeks, Vacation rotation == 1
def vacation_rule(model, d):
 	return sum(model.Z[d,1,w] for w in model.W) <= model.maxVacationWeeks
model.vacationConstraint = Constraint(model.D, rule=vacation_rule)

#Clinic Constraints, Clinic rotation == 2
# def clinic_rule(model, d, w, c):
# 	if c in model.CohortsPerDoctor[d]:
# 		if w in model.ClinicWeeks[c]:
# 			return model.Z[d,2,w] - model.K[d,c] == 0
# 	return Constraint.Skip
# model.clinicConstraint = Constraint(model.D, model.W, model.C, rule=clinic_rule)

def clinic_rule(model, d, w, c):
	if w in model.ClinicWeeks[c]:
		return model.Zc[d,2,w,c] - model.K[d,c] == 0
	return Constraint.Skip
model.clinicConstraint = Constraint(model.D, model.W, model.C, rule=clinic_rule)

# Elective Constraints, Elective == 1??
# def elective_rule(model, d, w, c):
# 	if c in model.CohortsPerDoctor[d]:
# 		if w in model.ElectiveWeeks[c]:
# 			return sum(model.Z[d,r,w] for r in model.E) + model.Z[d,1,w] - model.K[d,c] == 0
# 	return Constraint.Skip
# model.electiveConstraint = Constraint(model.D, model.W, model.C, rule=elective_rule)

def elective_rule(model, d, w, c):
	if w in model.ElectiveWeeks[c]:
		return sum(model.Zc[d,r,w,c] for r in model.E) - model.K[d,c] == 0
	return Constraint.Skip
model.electiveConstraint = Constraint(model.D, model.W, model.C, rule=elective_rule)


# #Vacation shouldn't exceed maximum number of weeks, Vacation rotation == 1
# def vacation_rule(model, d):
#  	return sum(model.Z[d,1,w] for w in model.W) <= model.maxVacationWeeks
# model.vacationConstraint = Constraint(model.D, rule=vacation_rule)

# ##Can not have a vacation in clinic week
# def clinicVacation_rule(model, d, w, c):
# 	if c in model.CohortsPerDoctor[d]:
# 		if w in model.ClinicWeeks[c]:
# 			return model.Z[d,1,w] + model.K[d,c] <= 1
# 	return Constraint.Skip
# model.clinicVacationConstraint = Constraint(model.D, model.W, model.C, rule=clinicVacation_rule)

#Zc rule for cohort she is in 
def ZcFix_rule(model, d, r, w):
	return sum(model.Zc[d,r,w,c] for c in model.CohortsPerDoctor[d]) - model.Z[d,r,w] == 0
model.ZcConstraint = Constraint(model.D, model.R, model.W, rule=ZcFix_rule)

#each resident can only be on one rotation each week according to the cohort she is in
def week_rule(model, d, w,c):
    if w in model.WeeksPerDoctor[d]:
        return sum(model.Zc[d,r,w,c] for r in model.RotationsPerDoctor[d]) - model.K[d,c] == 0
    return Constraint.Skip
model.weekConstraint = Constraint(model.D, model.W, model.C, rule=week_rule)

#Minimum length of each rotation in each block
def min_length(model, d, r, b, c):
	if c in model.CohortsPerDoctor[d]:
		if b in model.BlocksPerCohort[c]:
			return sum(model.Zc[d,r,w,c] for w in model.WeeksPerBlock[b]) - model.MinLength[r, b]*model.L[d,r,b,c] >=0 
	return Constraint.Skip
model.minLengthConstraint = Constraint(model.D, model.R, model.B, model.C, rule=min_length)

#Maximum length of each rotation in each block
def max_length(model, d, r, b, c):
	if c in model.CohortsPerDoctor[d]:
		if b in model.BlocksPerCohort[c]:
			return sum(model.Zc[d,r,w,c] for w in model.WeeksPerBlock[b]) - model.MaxLength[r,b]*model.L[d,r,b,c] <=0
	return Constraint.Skip
model.maxLengthConstraint = Constraint(model.D, model.R, model.B, model.C,  rule=max_length)

#####Contiguous scheduling for each rotation within a block 
# def Zabs1_rule(model,d,r,b,w):
# 	if c in model.CohortsPerDoctor[d]:
# 		if b in model.BlocksPerCohort[c]:
# 			if w in model.WeeksPerBlockMinus1[b]:
# 				return model.Zabsc[d,r,w,c] - (model.Zc[d,r,w+1,c]-model.Zc[d,r,w,c]) >=0
# model.ZabsConstraint1 = Constraint(model.D, model.R, model.B,model.W, model.C, rule=Zabs1_rule)

# def Zabs2_rule(model,d,r,b,w):
# 	if c in model.CohortsPerDoctor[d]:
# 		if b in model.BlocksPerCohort[c]:
# 			if w in model.WeeksPerBlockMinus1[b]:
# 				return model.Zabsc[d,r,w,c] - (model.Zc[d,r,w,c]-model.Zc[d,r,w+1,c]) >=0
# model.ZabsConstraint2 = Constraint(model.D, model.R, model.B,model.W, rule=Zabs2_rule)

# def continuity_rule(model, d,r,b):
# 	if c in model.CohortsPerDoctor[d]:
# 		if b in model.BlocksPerCohort[c]:
# 			if w in model.WeeksPerBlockMinus1[b]:
# 				return sum(model.Zabsc[d,r,w,c] for w in model.WeeksPerBlockMinus1[b]) <=1
# 	return Constraint.Skip
# model.continuityConstraint = Constraint(model.D, model.R, model.B, model.C, rule=continuity_rule)

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

#Parameters
def RotationsPerDoctor_init(model, d):
    a = []
    for r in model.R:
        a.append(r)
    return a
model.RotationsPerDoctor = Param(model.D, initialize=RotationsPerDoctor_init) ##Rotations pertaining to each doctor (specialty doctors need not have all rotations)
# param RotationsPerDoctor :=
# 1 [1,2,3, 4, 5]
# 2 [1,2,3, 4, 5]
# 3 [1,2,3, 4, 5]
# 4 [1,2,3, 4, 5];
#
#Parameters related to cohort system
model.CohortsPerDoctor= Param(model.D,default=[]) ## Cohorts that doctor d can be assigned to
model.ClinicWeeks = Param(model.C,default=[]) ## Clinic weeks in each cohort
model.ElectiveWeeks = Param(model.C, default = []) ## Elective weeks in each cohort

model.maxVacationWeeks = Param(within=NonNegativeIntegers, default=4)

### Weeks in each Block, Blocks for each Doctor, Blocks for each Year, Doctors in each Year, Year of each Doctor
model.WeeksPerBlock = Param(model.B, default = []) ## week #s in each block allocated to core rotations, 
##for example: WeeksPerBlock = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
model.WeeksPerBlockMinus1 = Param(model.B, default = []) ## last week removed from each block allocated for core rotations, 
##for example: If WeeksPerBlock = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
## Then model.WeeksPerBlockMinus1 = {1:[1,2],2:[4,5],3:[7],4:[1],5:[3,4],6:[6,7]}

#model.TempBlocks = Param(model.BlockTemplates,default=[])# Block numbers in each template
#for example TempBlocks = {'Template1':[1,2,3],'Template2'=[4,5,6]}
#modelTempYears = Param(model.Y,default=[])# Years in each template
#for example TempYears = {'Template1': ['PGY1'], 'Template2': ['PGY2','PGY3']}


model.BlocksPerCohort = Param(model.C,default = []) ## Blocks corresponding to each cohort

def WeeksPerDoctor_init(model, d):
    a = []
    for w in model.W:
        a.append(w)
    return a
model.WeeksPerDoctor = Param(model.D, initialize = WeeksPerDoctor_init)



model.DoctorsPerYear = Param(model.Y,default=[]) ### Residents corresponding to each year
### Must be a list of numbers for each year. eg. YD[PGY1] = [1,4]

def DoctorsPerYearPerWeek_init(model, y, w):
    doctors =[]
    for d in model.DoctorsPerYear[y]:
        if w in model.WeeksPerDoctor[d]:
            doctors.append(d)
    return doctors
model.DoctorsPerYearPerWeek = Param(model.Y, model.W, initialize = DoctorsPerYearPerWeek_init)



model.Year = Param(model.D, within=model.Y) # year of each doctor in set D


### Vacation Parameters
model.V = Param(model.D, model.W, default=1) #Vacation request for doctor d on week w; initialize to 1, so that if vacation=0, can't have any rotations that week

###Preference Parameters
model.P = Param(model.D, model.R, model.W, default=1) #Preference for doctor d of yr y and rotation r of week w

### Demand Parameters
### Todo before passing data to pyomo: Check that YearlyDemands doesn't contradict TotalDemands.
model.Yset = Param(model.Ycov, default = []) ## list of years in each meta year
## Yset :=
## 1 ['PGY1']
## 2 ['PGY2']
## 3 ['PGY3']
## 4 ['PGY2' 'PGY3']
model.DemandLower = Param(model.R, model.Ycov, model.W, default=0) #demand for doctors of year Y for rotation r on week w (number of residents needed)
model.DemandUpper = Param(model.R, model.Ycov, model.W, default=sys.maxsize) #demand for doctors of year Y for rotation r on week w (number of residents needed)


###Education Requirements per year and per track
model.Rset = Param(model.Redu, default = []) ## lists of rotations with an educational requirements
model.MaxEdu = Param(model.D, model.Redu, default=sys.maxsize) #max number of weeks of rotation r that a resident d can complete
model.MinEdu = Param(model.D, model.Redu, default=0) # min number of weeks of rotation r that a resident d must complete


### Miscellaneous Parameters
model.alphaCouple = Param(within = NonNegativeIntegers, default = 1)
model.Difficulties = Param(model.R, default=0) #difficulties of rotations (1=easy, 2=medium, 3=hard)

model.MinLength = Param(model.R, model.B, default=0) #minimum length of rotation r in a block b
model.MaxLength = Param(model.R, model.B, default=sys.maxsize) #maximum length of rotation r in a block b

model.Objective = Param(model.O, default=0) #weights for each objective factor

#Variables
model.Z = Var(model.D, model.R, model.W, within=Binary) #Assignment of doctor d to rotation r on week w
model.L = Var(model.D, model.R, model.B, model.C, within=Binary) #Contiguous Variable
model.K = Var(model.D, model.C, within = Binary) # Cohort Assignment of doctor d to cohort c
model.Zc = Var(model.D, model.R, model.W, model.C, within = Binary) # Z for each cohort c
model.Zabsc = Var(model.D,model.R,model.W, model.C, within=Binary) #Variable to linearize contiguous constraint

model.u = Var(model.Couples, model.W, within = NonNegativeIntegers) # Couple matching variables
model.v = Var(model.Couples, model.W, within = NonNegativeIntegers) # Couple matching variables


####Fix the value of these variables
#####Zabs for last week in each block is zero
##### Todo: L for cohorts not corresponding to the resident are zero


#######Objective##############
#OLD OBJECTIVE
# def Objective_rule(model):
#     return sum(sum(sum(model.Z[d,r,w]*model.P[d,r,w] for w in model.WeeksPerDoctor[d]) for r in model.RotationsPerDoctor[d]) for d in model.D) - model.alphaCouple*sum(sum(model.u[i,j,w]+model.v[i,j,w] for w in model.W) for (i,j) in model.Couples)
# model.Total_Utility = Objective(rule=Objective_rule, sense=maximize)

def Objective_rule(model):
    return sum(sum(sum(model.Z[d,r,w]*0 for w in model.WeeksPerDoctor[d]) for r in model.RotationsPerDoctor[d]) for d in model.D) - 0*sum(sum(model.u[i,j,w]+model.v[i,j,w] for w in model.W) for (i,j) in model.Couples)
model.Total_Utility = Objective(rule=Objective_rule, sense=maximize)


#######Constraints#########
### Couple matching constraints for variables u and v
def u1_rule(model,i,j,w):
    return model.u[i,j,w] - sum(model.Difficulties[r]*(model.Z[i,r,w]-model.Z[j,r,w]) for r in model.R) >=0
model.uConstraint1 = Constraint(model.Couples,model.W, rule=u1_rule)

def u2_rule(model,i,j,w):
    return model.u[i,j,w] + sum(model.Difficulties[r]*(model.Z[i,r,w]-model.Z[j,r,w]) for r in model.R) >=0
model.uConstraint2 = Constraint(model.Couples, model.W, rule=u2_rule)

def v1_rule(model,i,j,w):
    return model.v[i,j,w] - (sum((model.Z[i,r,w]-model.Z[j,r,w]) for r in model.R) - (model.Z[i,1,w]-model.Z[j,1,w])) >=0
model.vConstraint1 = Constraint(model.Couples,model.W, rule=v1_rule)

def v2_rule(model,i,j,w):
    return model.v[i,j,w] + (sum((model.Z[i,r,w]-model.Z[j,r,w]) for r in model.R) - (model.Z[i,1,w]-model.Z[j,1,w])) >=0
model.vConstraint2 = Constraint(model.Couples,model.W, rule=v2_rule)


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

# Elective Constraints
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


#Vacation shouldn't exceed maximum number of weeks, Vacation rotation == 1
def vacation_rule(model, d):
 	return sum(model.Z[d,1,w] for w in model.W) <= model.maxVacationWeeks
model.vacationConstraint = Constraint(model.D, rule=vacation_rule)

##Can not have a vacation in clinic week
def clinicVacation_rule(model, d, w, c):
	if c in model.CohortsPerDoctor[d]:
		if w in model.ClinicWeeks[c]:
			return model.Z[d,1,w] + model.K[d,c] <= 1
	return Constraint.Skip
model.clinicVacationConstraint = Constraint(model.D, model.W, model.C, rule=clinicVacation_rule)


#Staffing Requirement : number of residents on rotation must be greater than or equal to the demandLower,
##must be lesser than or equal to the demandUpper
###Combination: Requirement for some years and requirement overall
def coverage1_rule(model, r, y, w):
    return sum(sum(model.Z[d,r,w] for d in model.DoctorsPerYearPerWeek[year,w]) for year in model.Yset[y]) >= model.DemandLower[r,y,w]
model.rotationConstraintLower = Constraint(model.R, model.Ycov, model.W, rule=coverage1_rule)

def coverage2_rule(model, r, y, w):
    return sum(sum(model.Z[d,r,w] for d in model.DoctorsPerYearPerWeek[year,w]) for year in model.Yset[y]) <= model.DemandUpper[r,y,w]
model.rotationConstraintUpper = Constraint(model.R, model.Ycov, model.W, rule=coverage2_rule)


#each resident can only be on one rotation each week according to the cohort she is in
def week_rule(model, d, w,c):
    if w in model.WeeksPerDoctor[d]:
        return sum(model.Zc[d,r,w,c] for r in model.RotationsPerDoctor[d]) - model.K[d,c] == 0
    return Constraint.Skip
model.weekConstraint = Constraint(model.D, model.W, model.C, rule=week_rule)

#Educational Requirement : each resident of year y must meet the rotation requirements for their residency year
###Per Year Education Requirements
def min_edu(model, d, r):
    return sum(sum(model.Z[d,rindex,w] for w in model.W) for rindex in model.Rset[r]) >= model.MinEdu[d, r]
model.minEduConstraint = Constraint(model.D, model.Redu, rule=min_edu)

def max_edu(model, d, r):
    return sum(sum(model.Z[d,rindex,w] for w in model.W) for rindex in model.Rset[r]) <= model.MaxEdu[d, r]
model.maxEduConstraint = Constraint(model.D, model.Redu, rule=max_edu)


#Zc rule for cohort she is in 
def ZcFix_rule(model, d, r, w):
	return sum(model.Zc[d,r,w,c] for c in model.CohortsPerDoctor[d]) - model.Z[d,r,w] == 0
model.ZcConstraint = Constraint(model.D, model.R, model.W, rule=ZcFix_rule)

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
def Zabs1_rule(model,d,r,b,w,c):
	if c in model.CohortsPerDoctor[d]:
		if b in model.BlocksPerCohort[c]:
			if w in model.WeeksPerBlockMinus1[b]:
				return model.Zabsc[d,r,w,c] - (model.Zc[d,r,w+1,c]-model.Zc[d,r,w,c]) >=0
	return Constraint.Skip
model.ZabsConstraint1 = Constraint(model.D, model.R, model.B,model.W, model.C, rule=Zabs1_rule)

def Zabs2_rule(model,d,r,b,w,c):
	if c in model.CohortsPerDoctor[d]:
		if b in model.BlocksPerCohort[c]:
			if w in model.WeeksPerBlockMinus1[b]:
				return model.Zabsc[d,r,w,c] - (model.Zc[d,r,w,c]-model.Zc[d,r,w+1,c]) >=0
	return Constraint.Skip
model.ZabsConstraint2 = Constraint(model.D, model.R, model.B,model.W, model.C,rule=Zabs2_rule)

def continuity_rule(model,d,r,b,c):
	if c in model.CohortsPerDoctor[d]:
		if b in model.BlocksPerCohort[c]:
			return sum(model.Zabsc[d,r,w,c] for w in model.WeeksPerBlockMinus1[b]) <=1
			# if w in model.WeeksPerBlockMinus1[b]:
			# 	return sum(model.Zabsc[d,r,w,c] for w in model.WeeksPerBlockMinus1[b]) <=1
	return Constraint.Skip
model.continuityConstraint = Constraint(model.D, model.R, model.B, model.C, rule=continuity_rule)


#NEED A RULE FOR CONTINUITY IN THE ELECTIVE WEEKS, SO IF YOU HAVE VACATION IT'S FOR THE FULL 2 WEEKS!!!


# def objective_function(model,r,d,w):
# 	weights = []
# 	i = 0
# 	for o in model.Objective:
# 		weights[i] = model.Objective[i]
# 		i++
# 	#weights[0] = average res util, weights[1] = min res util, weights[2] = time b/w hard rotations
# 	return (weights[0] * model.P[r,d,w]*model.X[r,d,w]) + (weights[1] * min(model.P[r,d,w]*model.X[r,d,w])) + (weights[2] * distance(model.P[r,d,w]*model.X[r,d,w]))

# def distance(model):
# 	distance = 0
# 	for r in model.R:
# 		if model.Difficulties[r] == 3:
# 			for d in model.Z[d,r,w]:
# 				hardWeeks = []
# 				if model.Z[d,r,w] == 1:
# 					hardWeeks.append(w)
# 			for h in hardWeeks:
# 				if h != hardWeeks.length:
# 					distance += hardWeeks[h+1] - hardWeeks[h]
# 	return distance

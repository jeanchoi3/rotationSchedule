from coopr.pyomo import *
import sys

#Create the model object
model = AbstractModel()

#Sets
model.R = Set() #rotation
model.D = Set() #resident ("doctor")
model.W = Set() #weeks in the year
model.Y = Set() #years in the program
model.B = Set() #blocks in the program
model.O = Set() #objective factors
model.T = Set() #Tracks in the program
model.BlockTemplates = Set() #Block templates in the network
#model.Windows = Set(model.W)

#Parameters
model.maxVacationWeeks = Param(within=NonNegativeIntegers, default=4)
#model.Windows = Param(model.W, default=[])
# param Windows :=
# 1 [1,2,3,4,5,6]
# 2 [2, 3, 4, 5,6,7]
# 3 [3, 4, 5, 6, 7, 8];

model.windowSize=Param(within=NonNegativeIntegers,default=0)
model.lastWindowStart = Param(within=NonNegativeIntegers) #The first week in the last window. 
# For example our windows would be
# Window 1 [1,2,3,4,5,6]
# Window 2 [2, 3, 4, 5,6,7]
# Window 3 [3, 4, 5, 6, 7, 8]; so lastWindowStart =3
model.minClinicWeeks = Param(within=NonNegativeIntegers, default=0)

### Weeks in each Block, Blocks for each Doctor, Blocks for each Year, Doctors in each Year, Year of each Doctor
model.BWeeks = Param(model.B, default = []) ## week #s in each block, 
##for example: BWeeks = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
model.BWeeksMinus1 = Param(model.B, default = []) ## last week removed from each block, 
##for example: If BWeeks = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
## Then model.BWeeksMinus1 = {1:[1,2],2:[4,5],3:[7],4:[1],5:[3,4],6:[6,7]}

#model.TempBlocks = Param(model.BlockTemplates,default=[])# Block numbers in each template
#for example TempBlocks = {'Template1':[1,2,3],'Template2'=[4,5,6]}
#modelTempYears = Param(model.Y,default=[])# Years in each template
#for example TempYears = {'Template1': ['PGY1'], 'Template2': ['PGY2','PGY3']}


model.DBlocks = Param(model.D,default = []) ## Blocks corresponding to each doctor (according to her year)
model.YBlocks= Param(model.Y,default=[]) ### Block numbers corresponding to each year
###for example: YBlocks = {'PGY1':[1,2,3],'PGY2'=[4,5,6],'PGY3'=[4,5,6]}

model.YDoctors = Param(model.Y,default=[]) ### Residents corresponding to each year
### Must be a list of numbers for each year. eg. YD[PGY1] = [1,4]

model.Year = Param(model.D, within=model.Y) # year of each doctor in set D


def DTracks_init(model, d): 
 	return [1]
model.DTracks = Param(model.D, initialize=DTracks_init) ## Track of each doctor 
### Vacation Parameters
model.V = Param(model.D, model.W, default=1) #Vacation request for doctor d on week w; initialize to 1, so that if vacation=0, can't have any rotations that week

###Preference Parameters
model.P = Param(model.D, model.R, model.W, default=1) #Preference for doctor d of yr y and rotation r of week w

### Demand Parameters
### Todo before passing data to pyomo: Check that YearlyDemands doesn't contradict TotalDemands.
model.YearlyDemandLower = Param(model.R, model.Y, model.W, default=-1) #demand for doctors of year Y for rotation r on week w (number of residents needed)
model.YearlyDemandUpper = Param(model.R, model.Y, model.W, default=-1) #demand for doctors of year Y for rotation r on week w (number of residents needed)

model.TotalDemandLower =Param(model.R,model.W,default=0) #demand of doctors for staffing rotation R irrespective of years.
model.TotalDemandUpper =Param(model.R,model.W,default=sys.maxsize) #demand of doctors for staffing rotation R irrespective of years.

###Education Requirements per year and per track 
model.MaxYear = Param(model.Y, model.R, default=sys.maxsize) #max number of weeks of rotation r that a resident of year y can complete
model.MinYear = Param(model.Y, model.R, default=0) # min number of weeks of rotation r that a resident of year y must complete
model.MaxTrack = Param(model.T, model.R, default=sys.maxsize) #max number of weeks of rotation r that a resident of track t can complete
model.MinTrack = Param(model.T, model.R, default=0) # min number of weeks of rotation r that a resident of track t must complete

### Miscellaneous Parameters
model.Difficulties = Param(model.R, default=0) #difficulties of rotations (1=easy, 2=medium, 3=hard)

model.MinLength = Param(model.R, model.B, default=0) #minimum length of rotation r in a block b
model.MaxLength = Param(model.R, model.B, default=sys.maxsize) #maximum length of rotation r in a block b

model.Objective = Param(model.O, default=0) #weights for each objective factor

#Variables
model.Z = Var(model.D, model.R, model.W, within=Binary) #Assignment of doctor d to rotation r on week w
model.X = Var(model.D, model.R, model.B, within=Binary) #Assignment of doctor d to rotation r on week w
model.Zabs = Var(model.D,model.R,model.W,within=Binary) #Variable to linearize contiguous constraint

model.Zhat = Var(model.D,within=NonNegativeIntegers,bounds=(model.minClinicWeeks,model.windowSize)) #Variable needed in order to maximize number of clinic weeks within each window

####Fix the value of these variables
#####Zabs for last week in each block is zero
#####X for blocks not corresponding to the residents year are zero

#######Objective##############
def Objective_rule(model):
	return sum(sum(sum(model.Z[d,r,w]*model.P[d,r,w] for w in model.W) for r in model.R) + model.Zhat[d] for d in model.D)
model.Total_Utility = Objective(rule=Objective_rule, sense=maximize)

#######Constraints#########
#Clinic Constraints
def clinic_rule(model, d, week):
	if model.windowSize == 0:
		#return Constraint.Skip
		return model.Zhat[d] == 0
	else:
		if week <= model.lastWindowStart:
 			window = range(week,week+model.windowSize)
 			return sum(model.Z[d,'Clinic',w] for w in window) - model.Zhat[d]>= 0
 		return Constraint.Skip
model.clinicConstraint = Constraint(model.D, model.W, rule=clinic_rule)

#Vacation shouldn't exceed maximum number of weeks
def vacation_rule(model, d):
 	return sum(model.Z[d,'Vacation',w] for w in model.W) <= model.maxVacationWeeks
model.vacationConstraint = Constraint(model.D, rule=vacation_rule)

#Staffing Requirement : number of residents on rotation must be greater than or equal to the demandLower,
##must be lesser than or equal to the demandUpper
###Combination: Requirement for some years and requirement overall
def coverage1_rule(model, r, y, w):
	if model.YearlyDemandLower[r,y,w]!=-1:
		return sum(model.Z[d,r,w] for d in model.YDoctors[y]) >= model.YearlyDemandLower[r,y,w]
	return Constraint.Skip
model.rotationConstraintYearlyLower = Constraint(model.R, model.Y, model.W, rule=coverage1_rule)

def coverage2_rule(model, r, y, w):
	if model.YearlyDemandUpper[r,y,w]!=-1:
		return sum(model.Z[d,r,w] for d in model.YDoctors[y]) <= model.YearlyDemandUpper[r,y,w]
	return Constraint.Skip
model.rotationConstraintYearlyUpper = Constraint(model.R, model.Y, model.W, rule=coverage2_rule)

def coverage3_rule(model, r, w):
	return sum(model.Z[d,r,w] for d in model.D) >= model.TotalDemandLower[r,w]
model.rotationConstraintLower = Constraint(model.R, model.W, rule=coverage3_rule)

def coverage4_rule(model, r, w):
	return sum(model.Z[d,r,w] for d in model.D) <= model.TotalDemandUpper[r,w]
model.rotationConstraintUpper = Constraint(model.R, model.W, rule=coverage4_rule)

#each resident can only be on one rotation each week
def week_rule(model, d, w):
	return sum(model.Z[d,r,w] for r in model.R) == 1
model.weekConstraint = Constraint(model.D, model.W, rule=week_rule)

#Educational Requirement : each resident of year y must meet the rotation requirements for their residency year
###Per Year Education Requirements
def min_year(model, d, r):
	return sum(model.Z[d,r,w] for w in model.W) >= model.MinYear[model.Year[d], r]
model.minYearConstraint = Constraint(model.D, model.R, rule=min_year)

def max_year(model, d, r):
	return sum(model.Z[d,r,w] for w in model.W) <= model.MaxYear[model.Year[d], r]
model.maxYearConstraint = Constraint(model.D, model.R, rule=max_year)

###Special Educational Requirements for Doctors in Special Tracks
def min_track(model, d, r, t):
	if 1 not in model.DTracks[d]:
		if t in model.DTracks[d]:
			return sum(model.Z[d,r,w] for w in model.W) >= model.MinTrack[t, r]
	return Constraint.Skip
model.minTrackConstraint = Constraint(model.D, model.R, model.T, rule=min_track)

def max_track(model, d, r, t):
	if 1 not in model.DTracks[d]:
		if t in model.DTracks[d]:
			return sum(model.Z[d,r,w] for w in model.W) <= model.MaxTrack[t, r]
	return Constraint.Skip
model.maxTrackConstraint = Constraint(model.D, model.R, model.T, rule=max_track)

#Minimum length of each rotation in each block
def min_length(model, d, r, b):
	if b in model.DBlocks[d]:
		return sum(model.Z[d,r,w] for w in model.BWeeks[b]) - model.MinLength[r, b]*model.X[d,r,b] >=0 
	return Constraint.Skip
model.minLengthConstraint = Constraint(model.D, model.R, model.B, rule=min_length)

#Maximum length of each rotation in each block
def max_length(model, d, r,b):
	if b in model.DBlocks[d]:
		return sum(model.Z[d,r,w] for w in model.BWeeks[b]) - model.MaxLength[r,b]*model.X[d,r,b] <=0
	return Constraint.Skip
model.maxLengthConstraint = Constraint(model.D, model.R, model.B, rule=max_length)

#####Contiguous scheduling for each rotation within a block 
def Zabs1_rule(model,d,r,b,w):
	if b in model.DBlocks[d]:
		if w in model.BWeeksMinus1[b]:
			return model.Zabs[d,r,w] - (model.Z[d,r,w+1]-model.Z[d,r,w]) >=0
	return Constraint.Skip
model.ZabsConstraint1 = Constraint(model.D, model.R, model.B,model.W, rule=Zabs1_rule)

def Zabs2_rule(model,d,r,b,w):
	if b in model.DBlocks[d]:
		if w in model.BWeeksMinus1[b]:
			return model.Zabs[d,r,w] - (model.Z[d,r,w]-model.Z[d,r,w+1]) >=0
	return Constraint.Skip
model.ZabsConstraint2 = Constraint(model.D, model.R, model.B,model.W, rule=Zabs2_rule)

def continuity_rule(model, d,r,b):
	if b in model.DBlocks[d]:
		return sum(model.Zabs[d,r,w] for w in model.BWeeksMinus1[b]) <=1
	return Constraint.Skip
model.continuityConstraint = Constraint(model.D, model.R, model.B, rule=continuity_rule)

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

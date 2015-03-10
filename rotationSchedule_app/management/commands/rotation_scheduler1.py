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

#Parameters
model.wBlocks = Param(model.B, default = []) ## week #s in each block, 
##for example: wBlocks = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
model.wBlocksMinus1 = Param(model.B, default = []) ## last week removed from each block, 
##for example: If wBlocks = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
## Then model.wBlocksMinus1 = {1:[1,2],2:[4,5],3:[7],4:[1],5:[3,4],6:[6,7]}

model.DBlocks = Param(model.D,default = []) ## Blocks corresponding to each doctor (according to her year)

model.BYear= Param(model.Y,default=[]) ### Block numbers corresponding to each year
###for example: BYear = {'PGY1':[1,2,3],'PGY2'=[4,5,6],'PGY3'=[4,5,6]}

model.YD = Param(model.Y,default=[]) ### Residents corresponding to each year
### Must be a list of numbers for each year. eg. YD[PGY1] = [1,4]

model.Year = Param(model.D, within=model.Y) # year of each doctor in set D

model.V = Param(model.D, model.W, default=1) #Vacation request for doctor d on week w; initialize to 1, so that if vacation=0, can't have any rotations that week

model.P = Param(model.D, model.R, model.W, default=1) #Preference for doctor d of yr y and rotation r of week w

model.DemandLower = Param(model.R, model.Y, model.W, default=0) #demand for doctors of year Y for rotation r on week w (number of residents needed)
model.DemandUpper = Param(model.R, model.Y, model.W, default=sys.maxsize) #demand for doctors of year Y for rotation r on week w (number of residents needed)

#model.L = Param(model.R, default=1) #length of each rotation

model.MaxYear = Param(model.Y, model.R, default=sys.maxsize) #max number of weeks of rotation r that a resident of year y can complete

model.MinYear = Param(model.Y, model.R, default=0) # min number of weeks of rotation r that a resident of year y must complete

#model.StartDates = Param(model.B, model.W, default=0) # when blocks start in the template schedule

model.Difficulties = Param(model.R, default=0) #difficulties of rotations (1=easy, 2=medium, 3=hard)

model.MinLength = Param(model.R, model.B, default=0) #minimum length of rotation r in a block b

model.MaxLength = Param(model.R, model.B, default=sys.maxsize) #maximum length of rotation r in a block b

model.Objective = Param(model.O, default=0) #weights for each objective factor

#Variables
model.Z = Var(model.D, model.R, model.W, within=Binary) #Assignment of doctor d to rotation r on week w
model.X = Var(model.D, model.R, model.B, within=Binary) #Assignment of doctor d to rotation r on week w
model.Zabs = Var(model.D,model.R,model.W,within=Integers) 

####Fix the value of these variables
###Zabs for last week in each block is zero
###X for blocks not corresponding to the residents year are zero

#######Objective##############
def Objective_rule(model):
	return sum(sum(sum(model.Z[d,r,w]*model.P[d,r,w] for w in model.W) for r in model.R) for d in model.D)
model.Total_Utility = Objective(rule=Objective_rule, sense=maximize)

#######Constraints#########
# def vacation_rule(model, d, w):
# 	return sum(model.Z[d,r,w] for r in model.R) <= model.V[d,w]
# model.vacationConstraint = Constraint(model.D, model.W, rule=vacation_rule)

#Staffing Requirement : number of residents on rotation must be greater than or equal to the demandLower
def coverage1_rule(model, r, y, w):
	return sum(model.Z[d,r,w] for d in model.YD[y]) >= model.DemandLower[r,y,w]
model.rotationConstraintLower = Constraint(model.R, model.Y, model.W, rule=coverage1_rule)

#Staffing Requirement : number of residents on rotation must be lesser than or equal to the demandUpper
def coverage2_rule(model, r, y, w):
	return sum(model.Z[d,r,w] for d in model.YD[y]) <= model.DemandUpper[r,y,w]
model.rotationConstraintUpper = Constraint(model.R, model.Y, model.W, rule=coverage2_rule)

#each resident can only be on one rotation each week
def week_rule(model, d, w):
	return sum(model.Z[d,r,w] for r in model.R) <= 1
model.weekConstraint = Constraint(model.D, model.W, rule=week_rule)

#done (block_length_rule)
#each rotation must be the correct number of weeks long
# def length_rule(model,d,r):=
# 	if sum(model.Z[d,r,w] for w in model.W) != 0:
# 		return sum(model.Z[d,r,w] for w in model.W) >= model.L[r]
# model.lengthConstraint = Constraint(model.D, model.R, rule=length_rule)

#each resident of year y must meet the rotation requirements for their residency year
def min_year(model, d, r):
	return sum(model.Z[d,r,w] for w in model.W) >= model.MinYear[model.Year[d], r]
model.minYearConstraint = Constraint(model.D, model.R, rule=min_year)

#resident must not surpass maximum number of weeks on certain rotation within the planning period
def max_year(model, d, r):
	return sum(model.Z[d,r,w] for w in model.W) <= model.MaxYear[model.Year[d], r]
model.maxYearConstraint = Constraint(model.D, model.R, rule=max_year)

#Minimum length of each rotation in each block
# model.minLengthConstraint = ConstraintList()
# def min_length(model, d, r, b):
# 	return sum(model.Z[d,r,w] for w in model.wBlocks[b]) - model.MinLength[r, b]*model.X[d,r,b] >=0 
# 
# for d in model.D:
# 	for b in model.YBlocks[model.Year[d]]:
# 		model.minLengthConstraint.add(d, model.R, b, rule=min_length)

def min_length(model, d, r, b):
	if b in model.DBlocks[d]:
		return sum(model.Z[d,r,w] for w in model.wBlocks[b]) - model.MinLength[r, b]*model.X[d,r,b] >=0 
	return Constraint.Skip
model.minLengthConstraint = Constraint(model.D, model.R, model.B, rule=min_length)

# def min_length(model, d, r, b):
# 	return sum(model.Z[d,r,w] for w in model.wBlocks[b]) - model.MinLength[r, b]*model.X[d,r,b] >=0 
# model.minLengthConstraint = Constraint(model.D, model.R, model.B, rule=min_length)

#Maximum length of each rotation in each block
def max_length(model, d, r,b):
	if b in model.DBlocks[d]:
		return sum(model.Z[d,r,w] for w in model.wBlocks[b]) - model.MaxLength[r,b]*model.X[d,r,b] <=0
	return Constraint.Skip
model.maxLengthConstraint = Constraint(model.D, model.R, model.B, rule=max_length)

#####Contiguous scheduling for each rotation within a block 
def ZabsModel1_rule(model,d,r,b,w):
	if b in model.DBlocks[d]:
		if w in model.wBlocksMinus1[b]:
			return model.Zabs[d,r,w] - (model.Z[d,r,w+1]-model.Z[d,r,w]) >=0
	return Constraint.Skip
model.ZabsConstraint1 = Constraint(model.D, model.R, model.B,model.W, rule=ZabsModel1_rule)

def ZabsModel2_rule(model,d,r,b,w):
	if b in model.DBlocks[d]:
		if w in model.wBlocksMinus1[b]:
			return model.Zabs[d,r,w] - (model.Z[d,r,w]-model.Z[d,r,w+1]) >=0
	return Constraint.Skip
model.ZabsConstraint2 = Constraint(model.D, model.R, model.B,model.W, rule=ZabsModel2_rule)

def continuity_rule(model, d,r,b):
	if b in model.DBlocks[d]:
		return sum(model.Zabs[d,r,w] for w in model.wBlocksMinus1[b]) <=1
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

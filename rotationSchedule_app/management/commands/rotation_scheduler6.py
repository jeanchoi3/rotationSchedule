from coopr.pyomo import *
import sys
 
#Create the model object
model = AbstractModel()
 
#Sets
model.R = Set() #rotation
model.Redu = Set() # meta rotations with educational requirements
model.Ycov = Set() # meta years PGY1 = 1, PGY2 = 2, PGY3 =3, PGY2 or PGY3 = 4
model.D = Set() #resident ("doctor")
model.W = Set() #weeks in the year
model.Y = Set() #years in the program
model.B = Set() #blocks in the program
model.O = Set() #objective factors
model.T = Set() #Tracks in the program
model.Couples = Set(dimen=2) ## set of couples
## example: set Couples:=
## 1 2
## 3 4;
###This means 1 and 2 are a couple, 3 and 4 are a couple
 
#Parameters
model.maxVacationWeeks = Param(within=NonNegativeIntegers, default=4)
model.windowSize=Param(within=NonNegativeIntegers,default=0)
model.lastWindowStart = Param(within=NonNegativeIntegers) #The first week in the last window. 
# For example our windows would be
# Window 1 [1,2,3,4,5,6]
# Window 2 [2, 3, 4, 5,6,7]
# Window 3 [3, 4, 5, 6, 7, 8]; so lastWindowStart =3
model.minClinicWeeks = Param(within=NonNegativeIntegers, default=2)
 
### Weeks in each Block, Blocks for each Doctor, Blocks for each Year, Doctors in each Year, Year of each Doctor
model.WeeksPerBlock = Param(model.B, default = []) ## week #s in each block, 
##for example: WeeksPerBlock = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
model.WeeksPerBlockMinus1 = Param(model.B, default = []) ## last week removed from each block, 
##for example: If WeeksPerBlock = {1:[1,2,3],2:[4,5,6],3:[7,8],4:[1,2],5:[3,4,5],6:[6,7,8]} 
## Then model.WeeksPerBlockMinus1 = {1:[1,2],2:[4,5],3:[7],4:[1],5:[3,4],6:[6,7]}
 
 
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
model.BlocksPerDoctor = Param(model.D,default = []) ## Blocks corresponding to each doctor (according to her year)
def WeeksPerDoctor_init(model, d): 
    a = []
    for b in model.BlocksPerDoctor[d]:
        for w in model.WeeksPerBlock[b]:
            a.append(w)
    return a
model.WeeksPerDoctor = Param(model.D, initialize = WeeksPerDoctor_init)
 
 
model.DoctorsPerYear = Param(model.Y,default=[]) ### Residents corresponding to each year
### Must be a list of numbers for each year. eg. YD[PGY1] = [1,4]
 
# def DoctorsPerYearPerWeek_init(model, y, w):
#     doctors =[]
#     for d in model.DoctorsPerYear[y]:
#         if w in model.WeeksPerDoctor[d]:
#             doctors.append(d)
#     return doctors  
# model.DoctorsPerYearPerWeek = Param(model.Y, model.W, initialize = DoctorsPerYearPerWeek_init)
model.DoctorsPerYearPerWeek = Param(model.Y, model.W, default=[])
 
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
###Education Requirements per doctor 
model.Rset = Param(model.Redu, default = []) ## lists of rotations with an educational requirements
model.MaxEdu = Param(model.D, model.Redu, default=sys.maxsize) #max number of weeks of rotation r that a resident d can complete
model.MinEdu = Param(model.D, model.Redu, default=0) # min number of weeks of rotation r that a resident d must complete
 
 
### Miscellaneous Parameters
model.alphaCouple = Param(within = NonNegativeIntegers, default = 1)
model.alphaClinic = Param(within = NonNegativeIntegers, default = 1)
model.Difficulties = Param(model.R, default=0) #difficulties of rotations (1=easy, 2=medium, 3=hard)
 
model.MinLength = Param(model.R, model.B, default=0) #minimum length of rotation r in a block b
model.MaxLength = Param(model.R, model.B, default=sys.maxsize) #maximum length of rotation r in a block b
 
model.Objective = Param(model.O, default=0) #weights for each objective factor
 
#Variables
model.Z = Var(model.D, model.R, model.W, within=Binary) #Assignment of doctor d to rotation r on week w
model.X = Var(model.D, model.R, model.B, within=Binary) #Assignment of doctor d to rotation r on week w
model.Zabs = Var(model.D,model.R,model.W,within=Binary) #Variable to linearize contiguous constraint
 
model.Zhat = Var(model.D,within=NonNegativeIntegers,bounds=(model.minClinicWeeks,model.windowSize)) #Variable needed in order to maximize number of clinic weeks within each window
 
model.u = Var(model.Couples, model.W, within = NonNegativeIntegers) # Couple matching variables
model.v = Var(model.Couples, model.W, within = NonNegativeIntegers) # Couple matching variables
 
 
 
####Fix the value of these variables
#####Zabs for last week in each block is zero
######X for blocks not corresponding to the residents year are zero
## Set variables not belonging to a doctor's weeks/rotation to zero
 
#######Objective##############
def Objective_rule(model):
    return sum(sum(sum(model.Z[d,r,w]*model.P[d,r,w] for w in model.WeeksPerDoctor[d]) for r in model.RotationsPerDoctor[d]) + model.alphaClinic*model.Zhat[d] for d in model.D) - model.alphaCouple*sum(sum(model.u[i,j,w]+model.v[i,j,w] for w in model.W) for (i,j) in model.Couples)
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
 
 
##Clinic Constraints ## r = 2  
## |Todo|: Change to account for each doctor's weeks in the system
def clinic_rule(model, d, week):
    if model.windowSize == 0:
        #return Constraint.Skip
        return model.Zhat[d] == 0
    else:
        if week <= model.lastWindowStart:
            window = range(week,week+model.windowSize)
            return sum(model.Z[d,1,w] for w in window) - model.Zhat[d]>= 0
        return Constraint.Skip
model.clinicConstraint = Constraint(model.D, model.W, rule=clinic_rule)
 
#Vacation shouldn't exceed maximum number of weeks # r = 1
def vacation_rule(model, d):
    return sum(model.Z[d,2,w] for w in model.WeeksPerDoctor[d]) <= model.maxVacationWeeks
model.vacationConstraint = Constraint(model.D, rule=vacation_rule)
 
#Staffing Requirement : number of residents on rotation must be greater than or equal to the demandLower,
##must be lesser than or equal to the demandUpper
###Combination: Requirement for some years and requirement overall
 
 #this breaks if there is a missing/empty-list entry in DoctorsPerYearsPerWeek!!!!!
def coverage1_rule(model, r, y, w):
    return sum(sum(model.Z[d,r,w] for d in model.DoctorsPerYearPerWeek[year,w]) for year in model.Yset[y]) >= model.DemandLower[r,y,w]
model.rotationConstraintLower = Constraint(model.R, model.Ycov, model.W, rule=coverage1_rule)

  #this breaks if there is a missing/empty-list entry in DoctorsPerYearsPerWeek!!!!!
def coverage2_rule(model, r, y, w):
    return sum(sum(model.Z[d,r,w] for d in model.DoctorsPerYearPerWeek[year,w]) for year in model.Yset[y]) <= model.DemandUpper[r,y,w]
model.rotationConstraintUpper = Constraint(model.R, model.Ycov, model.W, rule=coverage2_rule)
 
 
#each resident can only be on one rotation each week
def week_rule(model, d, w):
    if w in model.WeeksPerDoctor[d]:
        return sum(model.Z[d,r,w] for r in model.RotationsPerDoctor[d]) == 1
    return Constraint.Skip
model.weekConstraint = Constraint(model.D, model.W, rule=week_rule)
 
# def week_rule(model, d, b, w):
#   if b in model.BlocksPerDoctor[d]:
#       if w in model.WeeksPerBlock[b]:
#           return sum(model.Z[d,r,w] for r in model.RotationsPerDoctor[d]) == 1
#   return Constraint.Skip
# model.weekConstraint = Constraint(model.D, model.B, model.W, rule=week_rule)
 
#Educational Requirement : each resident of year y must meet the rotation requirements for their residency year
###Per Year Education Requirements
def min_edu(model, d, r):
    return sum(sum(model.Z[d,rindex,w] for w in model.W) for rindex in model.Rset[r]) >= model.MinEdu[d, r]
model.minEduConstraint = Constraint(model.D, model.Redu, rule=min_edu)
 
def max_edu(model, d, r):
    return sum(sum(model.Z[d,rindex,w] for w in model.W) for rindex in model.Rset[r]) <= model.MaxEdu[d, r]
model.maxEduConstraint = Constraint(model.D, model.Redu, rule=max_edu)
 
 
#Minimum length of each rotation in each block
def min_length(model, d, r, b):
    if b in model.BlocksPerDoctor[d]:
        return sum(model.Z[d,r,w] for w in model.WeeksPerBlock[b]) - model.MinLength[r, b]*model.X[d,r,b] >=0
    return Constraint.Skip
model.minLengthConstraint = Constraint(model.D, model.R, model.B, rule=min_length)
 
#Maximum length of each rotation in each block
def max_length(model, d, r,b):
    if b in model.BlocksPerDoctor[d]:
        return sum(model.Z[d,r,w] for w in model.WeeksPerBlock[b]) - model.MaxLength[r,b]*model.X[d,r,b] <=0
    return Constraint.Skip
model.maxLengthConstraint = Constraint(model.D, model.R, model.B, rule=max_length)
 
#####Contiguous scheduling for each rotation within a block 
def Zabs1_rule(model,d,r,b,w):
    if b in model.BlocksPerDoctor[d]:
        if w in model.WeeksPerBlockMinus1[b]:
            return model.Zabs[d,r,w] - (model.Z[d,r,w+1]-model.Z[d,r,w]) >=0
    return Constraint.Skip
model.ZabsConstraint1 = Constraint(model.D, model.R, model.B,model.W, rule=Zabs1_rule)
 
def Zabs2_rule(model,d,r,b,w):
    if b in model.BlocksPerDoctor[d]:
        if w in model.WeeksPerBlockMinus1[b]:
            return model.Zabs[d,r,w] - (model.Z[d,r,w]-model.Z[d,r,w+1]) >=0
    return Constraint.Skip
model.ZabsConstraint2 = Constraint(model.D, model.R, model.B,model.W, rule=Zabs2_rule)
 
def continuity_rule(model, d,r,b):
    if b in model.BlocksPerDoctor[d]:
        return sum(model.Zabs[d,r,w] for w in model.WeeksPerBlockMinus1[b]) <=1
    return Constraint.Skip
model.continuityConstraint = Constraint(model.D, model.R, model.B, rule=continuity_rule)
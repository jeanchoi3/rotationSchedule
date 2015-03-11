\* Source Pyomo model name=unknown *\

max 
Total_Utility:
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Z(1_Clinic_7)
+1 Z(1_Clinic_8)
+1 Z(1_Rotation1_1)
+2 Z(1_Rotation1_2)
+2 Z(1_Rotation1_3)
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
+1 Z(1_Rotation1_7)
+1 Z(1_Rotation1_8)
+1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
+1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
+1 Z(1_Rotation2_7)
+1 Z(1_Rotation2_8)
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
+1 Z(1_Vacation_7)
+1 Z(1_Vacation_8)
+1 Z(2_Clinic_1)
+1 Z(2_Clinic_2)
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
+1 Z(2_Clinic_7)
+1 Z(2_Clinic_8)
+1 Z(2_Rotation1_1)
+1 Z(2_Rotation1_2)
+1 Z(2_Rotation1_3)
+1 Z(2_Rotation1_4)
+1 Z(2_Rotation1_5)
+1 Z(2_Rotation1_6)
+1 Z(2_Rotation1_7)
+1 Z(2_Rotation1_8)
+2 Z(2_Rotation2_1)
+1 Z(2_Rotation2_2)
+1 Z(2_Rotation2_3)
+1 Z(2_Rotation2_4)
+1 Z(2_Rotation2_5)
+1 Z(2_Rotation2_6)
+1 Z(2_Rotation2_7)
+1 Z(2_Rotation2_8)
+1 Z(2_Vacation_1)
+1 Z(2_Vacation_2)
+1 Z(2_Vacation_3)
+1 Z(2_Vacation_4)
+1 Z(2_Vacation_5)
+1 Z(2_Vacation_6)
+1 Z(2_Vacation_7)
+1 Z(2_Vacation_8)
+1 Z(3_Clinic_1)
+1 Z(3_Clinic_2)
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
+1 Z(3_Clinic_7)
+1 Z(3_Clinic_8)
+1 Z(3_Rotation1_1)
+1 Z(3_Rotation1_2)
+1 Z(3_Rotation1_3)
+1 Z(3_Rotation1_4)
+1 Z(3_Rotation1_5)
+1 Z(3_Rotation1_6)
+1 Z(3_Rotation1_7)
+1 Z(3_Rotation1_8)
+2 Z(3_Rotation2_1)
+1 Z(3_Rotation2_2)
+1 Z(3_Rotation2_3)
+1 Z(3_Rotation2_4)
+1 Z(3_Rotation2_5)
+1 Z(3_Rotation2_6)
+1 Z(3_Rotation2_7)
+1 Z(3_Rotation2_8)
+1 Z(3_Vacation_1)
+1 Z(3_Vacation_2)
+1 Z(3_Vacation_3)
+1 Z(3_Vacation_4)
+1 Z(3_Vacation_5)
+1 Z(3_Vacation_6)
+1 Z(3_Vacation_7)
+1 Z(3_Vacation_8)
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Z(4_Clinic_7)
+1 Z(4_Clinic_8)
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
+1 Z(4_Rotation1_7)
+1 Z(4_Rotation1_8)
+1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
+1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
+1 Z(4_Rotation2_7)
+1 Z(4_Rotation2_8)
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
+1 Z(4_Vacation_7)
+1 Z(4_Vacation_8)
+1 Zhat(1)
+1 Zhat(2)
+1 Zhat(3)
+1 Zhat(4)

s.t.

c_l_clinicConstraint(1_1)_:
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
-1 Zhat(1)
>= 0

c_l_clinicConstraint(1_2)_:
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Z(1_Clinic_7)
-1 Zhat(1)
>= 0

c_l_clinicConstraint(1_3)_:
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Z(1_Clinic_7)
+1 Z(1_Clinic_8)
-1 Zhat(1)
>= 0

c_l_clinicConstraint(2_1)_:
+1 Z(2_Clinic_1)
+1 Z(2_Clinic_2)
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
-1 Zhat(2)
>= 0

c_l_clinicConstraint(2_2)_:
+1 Z(2_Clinic_2)
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
+1 Z(2_Clinic_7)
-1 Zhat(2)
>= 0

c_l_clinicConstraint(2_3)_:
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
+1 Z(2_Clinic_7)
+1 Z(2_Clinic_8)
-1 Zhat(2)
>= 0

c_l_clinicConstraint(3_1)_:
+1 Z(3_Clinic_1)
+1 Z(3_Clinic_2)
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
-1 Zhat(3)
>= 0

c_l_clinicConstraint(3_2)_:
+1 Z(3_Clinic_2)
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
+1 Z(3_Clinic_7)
-1 Zhat(3)
>= 0

c_l_clinicConstraint(3_3)_:
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
+1 Z(3_Clinic_7)
+1 Z(3_Clinic_8)
-1 Zhat(3)
>= 0

c_l_clinicConstraint(4_1)_:
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
-1 Zhat(4)
>= 0

c_l_clinicConstraint(4_2)_:
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Z(4_Clinic_7)
-1 Zhat(4)
>= 0

c_l_clinicConstraint(4_3)_:
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Z(4_Clinic_7)
+1 Z(4_Clinic_8)
-1 Zhat(4)
>= 0

c_u_vacationConstraint(1)_:
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
+1 Z(1_Vacation_7)
+1 Z(1_Vacation_8)
<= 4

c_u_vacationConstraint(2)_:
+1 Z(2_Vacation_1)
+1 Z(2_Vacation_2)
+1 Z(2_Vacation_3)
+1 Z(2_Vacation_4)
+1 Z(2_Vacation_5)
+1 Z(2_Vacation_6)
+1 Z(2_Vacation_7)
+1 Z(2_Vacation_8)
<= 4

c_u_vacationConstraint(3)_:
+1 Z(3_Vacation_1)
+1 Z(3_Vacation_2)
+1 Z(3_Vacation_3)
+1 Z(3_Vacation_4)
+1 Z(3_Vacation_5)
+1 Z(3_Vacation_6)
+1 Z(3_Vacation_7)
+1 Z(3_Vacation_8)
<= 4

c_u_vacationConstraint(4)_:
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
+1 Z(4_Vacation_7)
+1 Z(4_Vacation_8)
<= 4

c_l_rotationConstraintYearlyLower(Rotation1_PGY1_1)_:
+1 Z(1_Rotation1_1)
+1 Z(4_Rotation1_1)
>= 1

c_l_rotationConstraintYearlyLower(Rotation1_PGY1_2)_:
+1 Z(1_Rotation1_2)
+1 Z(4_Rotation1_2)
>= 1

c_l_rotationConstraintYearlyLower(Rotation1_PGY2_1)_:
+1 Z(2_Rotation1_1)
>= 1

c_l_rotationConstraintYearlyLower(Rotation1_PGY2_2)_:
+1 Z(2_Rotation1_2)
>= 1

c_l_rotationConstraintYearlyLower(Rotation1_PGY3_1)_:
+1 Z(3_Rotation1_1)
>= 1

c_l_rotationConstraintYearlyLower(Rotation1_PGY3_2)_:
+1 Z(3_Rotation1_2)
>= 1

c_u_rotationConstraintYearlyUpper(Rotation1_PGY1_1)_:
+1 Z(1_Rotation1_1)
+1 Z(4_Rotation1_1)
<= 3

c_u_rotationConstraintYearlyUpper(Rotation1_PGY1_2)_:
+1 Z(1_Rotation1_2)
+1 Z(4_Rotation1_2)
<= 3

c_u_rotationConstraintYearlyUpper(Rotation1_PGY2_1)_:
+1 Z(2_Rotation1_1)
<= 3

c_u_rotationConstraintYearlyUpper(Rotation1_PGY2_2)_:
+1 Z(2_Rotation1_2)
<= 3

c_u_rotationConstraintYearlyUpper(Rotation1_PGY3_1)_:
+1 Z(3_Rotation1_1)
<= 100

c_u_rotationConstraintYearlyUpper(Rotation1_PGY3_2)_:
+1 Z(3_Rotation1_2)
<= 100

c_l_rotationConstraintLower(Clinic_1)_:
+1 Z(1_Clinic_1)
+1 Z(2_Clinic_1)
+1 Z(3_Clinic_1)
+1 Z(4_Clinic_1)
>= 0

c_l_rotationConstraintLower(Clinic_2)_:
+1 Z(1_Clinic_2)
+1 Z(2_Clinic_2)
+1 Z(3_Clinic_2)
+1 Z(4_Clinic_2)
>= 0

c_l_rotationConstraintLower(Clinic_3)_:
+1 Z(1_Clinic_3)
+1 Z(2_Clinic_3)
+1 Z(3_Clinic_3)
+1 Z(4_Clinic_3)
>= 0

c_l_rotationConstraintLower(Clinic_4)_:
+1 Z(1_Clinic_4)
+1 Z(2_Clinic_4)
+1 Z(3_Clinic_4)
+1 Z(4_Clinic_4)
>= 0

c_l_rotationConstraintLower(Clinic_5)_:
+1 Z(1_Clinic_5)
+1 Z(2_Clinic_5)
+1 Z(3_Clinic_5)
+1 Z(4_Clinic_5)
>= 0

c_l_rotationConstraintLower(Clinic_6)_:
+1 Z(1_Clinic_6)
+1 Z(2_Clinic_6)
+1 Z(3_Clinic_6)
+1 Z(4_Clinic_6)
>= 0

c_l_rotationConstraintLower(Clinic_7)_:
+1 Z(1_Clinic_7)
+1 Z(2_Clinic_7)
+1 Z(3_Clinic_7)
+1 Z(4_Clinic_7)
>= 0

c_l_rotationConstraintLower(Clinic_8)_:
+1 Z(1_Clinic_8)
+1 Z(2_Clinic_8)
+1 Z(3_Clinic_8)
+1 Z(4_Clinic_8)
>= 0

c_l_rotationConstraintLower(Rotation1_1)_:
+1 Z(1_Rotation1_1)
+1 Z(2_Rotation1_1)
+1 Z(3_Rotation1_1)
+1 Z(4_Rotation1_1)
>= 0

c_l_rotationConstraintLower(Rotation1_2)_:
+1 Z(1_Rotation1_2)
+1 Z(2_Rotation1_2)
+1 Z(3_Rotation1_2)
+1 Z(4_Rotation1_2)
>= 0

c_l_rotationConstraintLower(Rotation1_3)_:
+1 Z(1_Rotation1_3)
+1 Z(2_Rotation1_3)
+1 Z(3_Rotation1_3)
+1 Z(4_Rotation1_3)
>= 0

c_l_rotationConstraintLower(Rotation1_4)_:
+1 Z(1_Rotation1_4)
+1 Z(2_Rotation1_4)
+1 Z(3_Rotation1_4)
+1 Z(4_Rotation1_4)
>= 0

c_l_rotationConstraintLower(Rotation1_5)_:
+1 Z(1_Rotation1_5)
+1 Z(2_Rotation1_5)
+1 Z(3_Rotation1_5)
+1 Z(4_Rotation1_5)
>= 0

c_l_rotationConstraintLower(Rotation1_6)_:
+1 Z(1_Rotation1_6)
+1 Z(2_Rotation1_6)
+1 Z(3_Rotation1_6)
+1 Z(4_Rotation1_6)
>= 0

c_l_rotationConstraintLower(Rotation1_7)_:
+1 Z(1_Rotation1_7)
+1 Z(2_Rotation1_7)
+1 Z(3_Rotation1_7)
+1 Z(4_Rotation1_7)
>= 0

c_l_rotationConstraintLower(Rotation1_8)_:
+1 Z(1_Rotation1_8)
+1 Z(2_Rotation1_8)
+1 Z(3_Rotation1_8)
+1 Z(4_Rotation1_8)
>= 0

c_l_rotationConstraintLower(Rotation2_1)_:
+1 Z(1_Rotation2_1)
+1 Z(2_Rotation2_1)
+1 Z(3_Rotation2_1)
+1 Z(4_Rotation2_1)
>= 0

c_l_rotationConstraintLower(Rotation2_2)_:
+1 Z(1_Rotation2_2)
+1 Z(2_Rotation2_2)
+1 Z(3_Rotation2_2)
+1 Z(4_Rotation2_2)
>= 0

c_l_rotationConstraintLower(Rotation2_3)_:
+1 Z(1_Rotation2_3)
+1 Z(2_Rotation2_3)
+1 Z(3_Rotation2_3)
+1 Z(4_Rotation2_3)
>= 0

c_l_rotationConstraintLower(Rotation2_4)_:
+1 Z(1_Rotation2_4)
+1 Z(2_Rotation2_4)
+1 Z(3_Rotation2_4)
+1 Z(4_Rotation2_4)
>= 0

c_l_rotationConstraintLower(Rotation2_5)_:
+1 Z(1_Rotation2_5)
+1 Z(2_Rotation2_5)
+1 Z(3_Rotation2_5)
+1 Z(4_Rotation2_5)
>= 0

c_l_rotationConstraintLower(Rotation2_6)_:
+1 Z(1_Rotation2_6)
+1 Z(2_Rotation2_6)
+1 Z(3_Rotation2_6)
+1 Z(4_Rotation2_6)
>= 0

c_l_rotationConstraintLower(Rotation2_7)_:
+1 Z(1_Rotation2_7)
+1 Z(2_Rotation2_7)
+1 Z(3_Rotation2_7)
+1 Z(4_Rotation2_7)
>= 0

c_l_rotationConstraintLower(Rotation2_8)_:
+1 Z(1_Rotation2_8)
+1 Z(2_Rotation2_8)
+1 Z(3_Rotation2_8)
+1 Z(4_Rotation2_8)
>= 0

c_l_rotationConstraintLower(Vacation_1)_:
+1 Z(1_Vacation_1)
+1 Z(2_Vacation_1)
+1 Z(3_Vacation_1)
+1 Z(4_Vacation_1)
>= 0

c_l_rotationConstraintLower(Vacation_2)_:
+1 Z(1_Vacation_2)
+1 Z(2_Vacation_2)
+1 Z(3_Vacation_2)
+1 Z(4_Vacation_2)
>= 0

c_l_rotationConstraintLower(Vacation_3)_:
+1 Z(1_Vacation_3)
+1 Z(2_Vacation_3)
+1 Z(3_Vacation_3)
+1 Z(4_Vacation_3)
>= 0

c_l_rotationConstraintLower(Vacation_4)_:
+1 Z(1_Vacation_4)
+1 Z(2_Vacation_4)
+1 Z(3_Vacation_4)
+1 Z(4_Vacation_4)
>= 0

c_l_rotationConstraintLower(Vacation_5)_:
+1 Z(1_Vacation_5)
+1 Z(2_Vacation_5)
+1 Z(3_Vacation_5)
+1 Z(4_Vacation_5)
>= 0

c_l_rotationConstraintLower(Vacation_6)_:
+1 Z(1_Vacation_6)
+1 Z(2_Vacation_6)
+1 Z(3_Vacation_6)
+1 Z(4_Vacation_6)
>= 0

c_l_rotationConstraintLower(Vacation_7)_:
+1 Z(1_Vacation_7)
+1 Z(2_Vacation_7)
+1 Z(3_Vacation_7)
+1 Z(4_Vacation_7)
>= 0

c_l_rotationConstraintLower(Vacation_8)_:
+1 Z(1_Vacation_8)
+1 Z(2_Vacation_8)
+1 Z(3_Vacation_8)
+1 Z(4_Vacation_8)
>= 0

c_u_rotationConstraintUpper(Clinic_1)_:
+1 Z(1_Clinic_1)
+1 Z(2_Clinic_1)
+1 Z(3_Clinic_1)
+1 Z(4_Clinic_1)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_2)_:
+1 Z(1_Clinic_2)
+1 Z(2_Clinic_2)
+1 Z(3_Clinic_2)
+1 Z(4_Clinic_2)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_3)_:
+1 Z(1_Clinic_3)
+1 Z(2_Clinic_3)
+1 Z(3_Clinic_3)
+1 Z(4_Clinic_3)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_4)_:
+1 Z(1_Clinic_4)
+1 Z(2_Clinic_4)
+1 Z(3_Clinic_4)
+1 Z(4_Clinic_4)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_5)_:
+1 Z(1_Clinic_5)
+1 Z(2_Clinic_5)
+1 Z(3_Clinic_5)
+1 Z(4_Clinic_5)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_6)_:
+1 Z(1_Clinic_6)
+1 Z(2_Clinic_6)
+1 Z(3_Clinic_6)
+1 Z(4_Clinic_6)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_7)_:
+1 Z(1_Clinic_7)
+1 Z(2_Clinic_7)
+1 Z(3_Clinic_7)
+1 Z(4_Clinic_7)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Clinic_8)_:
+1 Z(1_Clinic_8)
+1 Z(2_Clinic_8)
+1 Z(3_Clinic_8)
+1 Z(4_Clinic_8)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_1)_:
+1 Z(1_Rotation1_1)
+1 Z(2_Rotation1_1)
+1 Z(3_Rotation1_1)
+1 Z(4_Rotation1_1)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_2)_:
+1 Z(1_Rotation1_2)
+1 Z(2_Rotation1_2)
+1 Z(3_Rotation1_2)
+1 Z(4_Rotation1_2)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_3)_:
+1 Z(1_Rotation1_3)
+1 Z(2_Rotation1_3)
+1 Z(3_Rotation1_3)
+1 Z(4_Rotation1_3)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_4)_:
+1 Z(1_Rotation1_4)
+1 Z(2_Rotation1_4)
+1 Z(3_Rotation1_4)
+1 Z(4_Rotation1_4)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_5)_:
+1 Z(1_Rotation1_5)
+1 Z(2_Rotation1_5)
+1 Z(3_Rotation1_5)
+1 Z(4_Rotation1_5)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_6)_:
+1 Z(1_Rotation1_6)
+1 Z(2_Rotation1_6)
+1 Z(3_Rotation1_6)
+1 Z(4_Rotation1_6)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_7)_:
+1 Z(1_Rotation1_7)
+1 Z(2_Rotation1_7)
+1 Z(3_Rotation1_7)
+1 Z(4_Rotation1_7)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation1_8)_:
+1 Z(1_Rotation1_8)
+1 Z(2_Rotation1_8)
+1 Z(3_Rotation1_8)
+1 Z(4_Rotation1_8)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_1)_:
+1 Z(1_Rotation2_1)
+1 Z(2_Rotation2_1)
+1 Z(3_Rotation2_1)
+1 Z(4_Rotation2_1)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_2)_:
+1 Z(1_Rotation2_2)
+1 Z(2_Rotation2_2)
+1 Z(3_Rotation2_2)
+1 Z(4_Rotation2_2)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_3)_:
+1 Z(1_Rotation2_3)
+1 Z(2_Rotation2_3)
+1 Z(3_Rotation2_3)
+1 Z(4_Rotation2_3)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_4)_:
+1 Z(1_Rotation2_4)
+1 Z(2_Rotation2_4)
+1 Z(3_Rotation2_4)
+1 Z(4_Rotation2_4)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_5)_:
+1 Z(1_Rotation2_5)
+1 Z(2_Rotation2_5)
+1 Z(3_Rotation2_5)
+1 Z(4_Rotation2_5)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_6)_:
+1 Z(1_Rotation2_6)
+1 Z(2_Rotation2_6)
+1 Z(3_Rotation2_6)
+1 Z(4_Rotation2_6)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_7)_:
+1 Z(1_Rotation2_7)
+1 Z(2_Rotation2_7)
+1 Z(3_Rotation2_7)
+1 Z(4_Rotation2_7)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Rotation2_8)_:
+1 Z(1_Rotation2_8)
+1 Z(2_Rotation2_8)
+1 Z(3_Rotation2_8)
+1 Z(4_Rotation2_8)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_1)_:
+1 Z(1_Vacation_1)
+1 Z(2_Vacation_1)
+1 Z(3_Vacation_1)
+1 Z(4_Vacation_1)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_2)_:
+1 Z(1_Vacation_2)
+1 Z(2_Vacation_2)
+1 Z(3_Vacation_2)
+1 Z(4_Vacation_2)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_3)_:
+1 Z(1_Vacation_3)
+1 Z(2_Vacation_3)
+1 Z(3_Vacation_3)
+1 Z(4_Vacation_3)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_4)_:
+1 Z(1_Vacation_4)
+1 Z(2_Vacation_4)
+1 Z(3_Vacation_4)
+1 Z(4_Vacation_4)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_5)_:
+1 Z(1_Vacation_5)
+1 Z(2_Vacation_5)
+1 Z(3_Vacation_5)
+1 Z(4_Vacation_5)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_6)_:
+1 Z(1_Vacation_6)
+1 Z(2_Vacation_6)
+1 Z(3_Vacation_6)
+1 Z(4_Vacation_6)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_7)_:
+1 Z(1_Vacation_7)
+1 Z(2_Vacation_7)
+1 Z(3_Vacation_7)
+1 Z(4_Vacation_7)
<= 9.2233720368547758e+18

c_u_rotationConstraintUpper(Vacation_8)_:
+1 Z(1_Vacation_8)
+1 Z(2_Vacation_8)
+1 Z(3_Vacation_8)
+1 Z(4_Vacation_8)
<= 9.2233720368547758e+18

c_u_weekConstraint(1_1)_:
+1 Z(1_Clinic_1)
+1 Z(1_Rotation1_1)
+1 Z(1_Rotation2_1)
+1 Z(1_Vacation_1)
<= 1

c_u_weekConstraint(1_2)_:
+1 Z(1_Clinic_2)
+1 Z(1_Rotation1_2)
+1 Z(1_Rotation2_2)
+1 Z(1_Vacation_2)
<= 1

c_u_weekConstraint(1_3)_:
+1 Z(1_Clinic_3)
+1 Z(1_Rotation1_3)
+1 Z(1_Rotation2_3)
+1 Z(1_Vacation_3)
<= 1

c_u_weekConstraint(1_4)_:
+1 Z(1_Clinic_4)
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation2_4)
+1 Z(1_Vacation_4)
<= 1

c_u_weekConstraint(1_5)_:
+1 Z(1_Clinic_5)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation2_5)
+1 Z(1_Vacation_5)
<= 1

c_u_weekConstraint(1_6)_:
+1 Z(1_Clinic_6)
+1 Z(1_Rotation1_6)
+1 Z(1_Rotation2_6)
+1 Z(1_Vacation_6)
<= 1

c_u_weekConstraint(1_7)_:
+1 Z(1_Clinic_7)
+1 Z(1_Rotation1_7)
+1 Z(1_Rotation2_7)
+1 Z(1_Vacation_7)
<= 1

c_u_weekConstraint(1_8)_:
+1 Z(1_Clinic_8)
+1 Z(1_Rotation1_8)
+1 Z(1_Rotation2_8)
+1 Z(1_Vacation_8)
<= 1

c_u_weekConstraint(2_1)_:
+1 Z(2_Clinic_1)
+1 Z(2_Rotation1_1)
+1 Z(2_Rotation2_1)
+1 Z(2_Vacation_1)
<= 1

c_u_weekConstraint(2_2)_:
+1 Z(2_Clinic_2)
+1 Z(2_Rotation1_2)
+1 Z(2_Rotation2_2)
+1 Z(2_Vacation_2)
<= 1

c_u_weekConstraint(2_3)_:
+1 Z(2_Clinic_3)
+1 Z(2_Rotation1_3)
+1 Z(2_Rotation2_3)
+1 Z(2_Vacation_3)
<= 1

c_u_weekConstraint(2_4)_:
+1 Z(2_Clinic_4)
+1 Z(2_Rotation1_4)
+1 Z(2_Rotation2_4)
+1 Z(2_Vacation_4)
<= 1

c_u_weekConstraint(2_5)_:
+1 Z(2_Clinic_5)
+1 Z(2_Rotation1_5)
+1 Z(2_Rotation2_5)
+1 Z(2_Vacation_5)
<= 1

c_u_weekConstraint(2_6)_:
+1 Z(2_Clinic_6)
+1 Z(2_Rotation1_6)
+1 Z(2_Rotation2_6)
+1 Z(2_Vacation_6)
<= 1

c_u_weekConstraint(2_7)_:
+1 Z(2_Clinic_7)
+1 Z(2_Rotation1_7)
+1 Z(2_Rotation2_7)
+1 Z(2_Vacation_7)
<= 1

c_u_weekConstraint(2_8)_:
+1 Z(2_Clinic_8)
+1 Z(2_Rotation1_8)
+1 Z(2_Rotation2_8)
+1 Z(2_Vacation_8)
<= 1

c_u_weekConstraint(3_1)_:
+1 Z(3_Clinic_1)
+1 Z(3_Rotation1_1)
+1 Z(3_Rotation2_1)
+1 Z(3_Vacation_1)
<= 1

c_u_weekConstraint(3_2)_:
+1 Z(3_Clinic_2)
+1 Z(3_Rotation1_2)
+1 Z(3_Rotation2_2)
+1 Z(3_Vacation_2)
<= 1

c_u_weekConstraint(3_3)_:
+1 Z(3_Clinic_3)
+1 Z(3_Rotation1_3)
+1 Z(3_Rotation2_3)
+1 Z(3_Vacation_3)
<= 1

c_u_weekConstraint(3_4)_:
+1 Z(3_Clinic_4)
+1 Z(3_Rotation1_4)
+1 Z(3_Rotation2_4)
+1 Z(3_Vacation_4)
<= 1

c_u_weekConstraint(3_5)_:
+1 Z(3_Clinic_5)
+1 Z(3_Rotation1_5)
+1 Z(3_Rotation2_5)
+1 Z(3_Vacation_5)
<= 1

c_u_weekConstraint(3_6)_:
+1 Z(3_Clinic_6)
+1 Z(3_Rotation1_6)
+1 Z(3_Rotation2_6)
+1 Z(3_Vacation_6)
<= 1

c_u_weekConstraint(3_7)_:
+1 Z(3_Clinic_7)
+1 Z(3_Rotation1_7)
+1 Z(3_Rotation2_7)
+1 Z(3_Vacation_7)
<= 1

c_u_weekConstraint(3_8)_:
+1 Z(3_Clinic_8)
+1 Z(3_Rotation1_8)
+1 Z(3_Rotation2_8)
+1 Z(3_Vacation_8)
<= 1

c_u_weekConstraint(4_1)_:
+1 Z(4_Clinic_1)
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation2_1)
+1 Z(4_Vacation_1)
<= 1

c_u_weekConstraint(4_2)_:
+1 Z(4_Clinic_2)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation2_2)
+1 Z(4_Vacation_2)
<= 1

c_u_weekConstraint(4_3)_:
+1 Z(4_Clinic_3)
+1 Z(4_Rotation1_3)
+1 Z(4_Rotation2_3)
+1 Z(4_Vacation_3)
<= 1

c_u_weekConstraint(4_4)_:
+1 Z(4_Clinic_4)
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation2_4)
+1 Z(4_Vacation_4)
<= 1

c_u_weekConstraint(4_5)_:
+1 Z(4_Clinic_5)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation2_5)
+1 Z(4_Vacation_5)
<= 1

c_u_weekConstraint(4_6)_:
+1 Z(4_Clinic_6)
+1 Z(4_Rotation1_6)
+1 Z(4_Rotation2_6)
+1 Z(4_Vacation_6)
<= 1

c_u_weekConstraint(4_7)_:
+1 Z(4_Clinic_7)
+1 Z(4_Rotation1_7)
+1 Z(4_Rotation2_7)
+1 Z(4_Vacation_7)
<= 1

c_u_weekConstraint(4_8)_:
+1 Z(4_Clinic_8)
+1 Z(4_Rotation1_8)
+1 Z(4_Rotation2_8)
+1 Z(4_Vacation_8)
<= 1

c_l_minYearConstraint(1_Clinic)_:
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Z(1_Clinic_7)
+1 Z(1_Clinic_8)
>= 0

c_l_minYearConstraint(1_Rotation1)_:
+1 Z(1_Rotation1_1)
+1 Z(1_Rotation1_2)
+1 Z(1_Rotation1_3)
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
+1 Z(1_Rotation1_7)
+1 Z(1_Rotation1_8)
>= 0

c_l_minYearConstraint(1_Rotation2)_:
+1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
+1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
+1 Z(1_Rotation2_7)
+1 Z(1_Rotation2_8)
>= 0

c_l_minYearConstraint(1_Vacation)_:
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
+1 Z(1_Vacation_7)
+1 Z(1_Vacation_8)
>= 0

c_l_minYearConstraint(2_Clinic)_:
+1 Z(2_Clinic_1)
+1 Z(2_Clinic_2)
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
+1 Z(2_Clinic_7)
+1 Z(2_Clinic_8)
>= 0

c_l_minYearConstraint(2_Rotation1)_:
+1 Z(2_Rotation1_1)
+1 Z(2_Rotation1_2)
+1 Z(2_Rotation1_3)
+1 Z(2_Rotation1_4)
+1 Z(2_Rotation1_5)
+1 Z(2_Rotation1_6)
+1 Z(2_Rotation1_7)
+1 Z(2_Rotation1_8)
>= 0

c_l_minYearConstraint(2_Rotation2)_:
+1 Z(2_Rotation2_1)
+1 Z(2_Rotation2_2)
+1 Z(2_Rotation2_3)
+1 Z(2_Rotation2_4)
+1 Z(2_Rotation2_5)
+1 Z(2_Rotation2_6)
+1 Z(2_Rotation2_7)
+1 Z(2_Rotation2_8)
>= 0

c_l_minYearConstraint(2_Vacation)_:
+1 Z(2_Vacation_1)
+1 Z(2_Vacation_2)
+1 Z(2_Vacation_3)
+1 Z(2_Vacation_4)
+1 Z(2_Vacation_5)
+1 Z(2_Vacation_6)
+1 Z(2_Vacation_7)
+1 Z(2_Vacation_8)
>= 0

c_l_minYearConstraint(3_Clinic)_:
+1 Z(3_Clinic_1)
+1 Z(3_Clinic_2)
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
+1 Z(3_Clinic_7)
+1 Z(3_Clinic_8)
>= 0

c_l_minYearConstraint(3_Rotation1)_:
+1 Z(3_Rotation1_1)
+1 Z(3_Rotation1_2)
+1 Z(3_Rotation1_3)
+1 Z(3_Rotation1_4)
+1 Z(3_Rotation1_5)
+1 Z(3_Rotation1_6)
+1 Z(3_Rotation1_7)
+1 Z(3_Rotation1_8)
>= 0

c_l_minYearConstraint(3_Rotation2)_:
+1 Z(3_Rotation2_1)
+1 Z(3_Rotation2_2)
+1 Z(3_Rotation2_3)
+1 Z(3_Rotation2_4)
+1 Z(3_Rotation2_5)
+1 Z(3_Rotation2_6)
+1 Z(3_Rotation2_7)
+1 Z(3_Rotation2_8)
>= 0

c_l_minYearConstraint(3_Vacation)_:
+1 Z(3_Vacation_1)
+1 Z(3_Vacation_2)
+1 Z(3_Vacation_3)
+1 Z(3_Vacation_4)
+1 Z(3_Vacation_5)
+1 Z(3_Vacation_6)
+1 Z(3_Vacation_7)
+1 Z(3_Vacation_8)
>= 0

c_l_minYearConstraint(4_Clinic)_:
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Z(4_Clinic_7)
+1 Z(4_Clinic_8)
>= 0

c_l_minYearConstraint(4_Rotation1)_:
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
+1 Z(4_Rotation1_7)
+1 Z(4_Rotation1_8)
>= 0

c_l_minYearConstraint(4_Rotation2)_:
+1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
+1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
+1 Z(4_Rotation2_7)
+1 Z(4_Rotation2_8)
>= 0

c_l_minYearConstraint(4_Vacation)_:
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
+1 Z(4_Vacation_7)
+1 Z(4_Vacation_8)
>= 0

c_u_maxYearConstraint(1_Clinic)_:
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Z(1_Clinic_7)
+1 Z(1_Clinic_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(1_Rotation1)_:
+1 Z(1_Rotation1_1)
+1 Z(1_Rotation1_2)
+1 Z(1_Rotation1_3)
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
+1 Z(1_Rotation1_7)
+1 Z(1_Rotation1_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(1_Rotation2)_:
+1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
+1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
+1 Z(1_Rotation2_7)
+1 Z(1_Rotation2_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(1_Vacation)_:
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
+1 Z(1_Vacation_7)
+1 Z(1_Vacation_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(2_Clinic)_:
+1 Z(2_Clinic_1)
+1 Z(2_Clinic_2)
+1 Z(2_Clinic_3)
+1 Z(2_Clinic_4)
+1 Z(2_Clinic_5)
+1 Z(2_Clinic_6)
+1 Z(2_Clinic_7)
+1 Z(2_Clinic_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(2_Rotation1)_:
+1 Z(2_Rotation1_1)
+1 Z(2_Rotation1_2)
+1 Z(2_Rotation1_3)
+1 Z(2_Rotation1_4)
+1 Z(2_Rotation1_5)
+1 Z(2_Rotation1_6)
+1 Z(2_Rotation1_7)
+1 Z(2_Rotation1_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(2_Rotation2)_:
+1 Z(2_Rotation2_1)
+1 Z(2_Rotation2_2)
+1 Z(2_Rotation2_3)
+1 Z(2_Rotation2_4)
+1 Z(2_Rotation2_5)
+1 Z(2_Rotation2_6)
+1 Z(2_Rotation2_7)
+1 Z(2_Rotation2_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(2_Vacation)_:
+1 Z(2_Vacation_1)
+1 Z(2_Vacation_2)
+1 Z(2_Vacation_3)
+1 Z(2_Vacation_4)
+1 Z(2_Vacation_5)
+1 Z(2_Vacation_6)
+1 Z(2_Vacation_7)
+1 Z(2_Vacation_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(3_Clinic)_:
+1 Z(3_Clinic_1)
+1 Z(3_Clinic_2)
+1 Z(3_Clinic_3)
+1 Z(3_Clinic_4)
+1 Z(3_Clinic_5)
+1 Z(3_Clinic_6)
+1 Z(3_Clinic_7)
+1 Z(3_Clinic_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(3_Rotation1)_:
+1 Z(3_Rotation1_1)
+1 Z(3_Rotation1_2)
+1 Z(3_Rotation1_3)
+1 Z(3_Rotation1_4)
+1 Z(3_Rotation1_5)
+1 Z(3_Rotation1_6)
+1 Z(3_Rotation1_7)
+1 Z(3_Rotation1_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(3_Rotation2)_:
+1 Z(3_Rotation2_1)
+1 Z(3_Rotation2_2)
+1 Z(3_Rotation2_3)
+1 Z(3_Rotation2_4)
+1 Z(3_Rotation2_5)
+1 Z(3_Rotation2_6)
+1 Z(3_Rotation2_7)
+1 Z(3_Rotation2_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(3_Vacation)_:
+1 Z(3_Vacation_1)
+1 Z(3_Vacation_2)
+1 Z(3_Vacation_3)
+1 Z(3_Vacation_4)
+1 Z(3_Vacation_5)
+1 Z(3_Vacation_6)
+1 Z(3_Vacation_7)
+1 Z(3_Vacation_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(4_Clinic)_:
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Z(4_Clinic_7)
+1 Z(4_Clinic_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(4_Rotation1)_:
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
+1 Z(4_Rotation1_7)
+1 Z(4_Rotation1_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(4_Rotation2)_:
+1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
+1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
+1 Z(4_Rotation2_7)
+1 Z(4_Rotation2_8)
<= 9.2233720368547758e+18

c_u_maxYearConstraint(4_Vacation)_:
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
+1 Z(4_Vacation_7)
+1 Z(4_Vacation_8)
<= 9.2233720368547758e+18

c_l_minLengthConstraint(1_Clinic_1)_:
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
>= 0

c_l_minLengthConstraint(1_Clinic_2)_:
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
>= 0

c_l_minLengthConstraint(1_Rotation1_1)_:
+1 Z(1_Rotation1_1)
+1 Z(1_Rotation1_2)
+1 Z(1_Rotation1_3)
>= 0

c_l_minLengthConstraint(1_Rotation1_2)_:
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
>= 0

c_l_minLengthConstraint(1_Rotation2_1)_:
+1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
>= 0

c_l_minLengthConstraint(1_Rotation2_2)_:
+1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
>= 0

c_l_minLengthConstraint(1_Vacation_1)_:
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
>= 0

c_l_minLengthConstraint(1_Vacation_2)_:
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
>= 0

c_l_minLengthConstraint(4_Clinic_1)_:
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
>= 0

c_l_minLengthConstraint(4_Clinic_2)_:
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
>= 0

c_l_minLengthConstraint(4_Rotation1_1)_:
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
>= 0

c_l_minLengthConstraint(4_Rotation1_2)_:
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
>= 0

c_l_minLengthConstraint(4_Rotation2_1)_:
+1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
>= 0

c_l_minLengthConstraint(4_Rotation2_2)_:
+1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
>= 0

c_l_minLengthConstraint(4_Vacation_1)_:
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
>= 0

c_l_minLengthConstraint(4_Vacation_2)_:
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
>= 0

c_u_maxLengthConstraint(1_Clinic_1)_:
-9.2233720368547758e+18 X(1_Clinic_1)
+1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
<= 0

c_u_maxLengthConstraint(1_Clinic_2)_:
-9.2233720368547758e+18 X(1_Clinic_2)
+1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
<= 0

c_u_maxLengthConstraint(1_Rotation1_1)_:
-9.2233720368547758e+18 X(1_Rotation1_1)
+1 Z(1_Rotation1_1)
+1 Z(1_Rotation1_2)
+1 Z(1_Rotation1_3)
<= 0

c_u_maxLengthConstraint(1_Rotation1_2)_:
-9.2233720368547758e+18 X(1_Rotation1_2)
+1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
<= 0

c_u_maxLengthConstraint(1_Rotation2_1)_:
-9.2233720368547758e+18 X(1_Rotation2_1)
+1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
<= 0

c_u_maxLengthConstraint(1_Rotation2_2)_:
-9.2233720368547758e+18 X(1_Rotation2_2)
+1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
<= 0

c_u_maxLengthConstraint(1_Vacation_1)_:
-9.2233720368547758e+18 X(1_Vacation_1)
+1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
<= 0

c_u_maxLengthConstraint(1_Vacation_2)_:
-9.2233720368547758e+18 X(1_Vacation_2)
+1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
<= 0

c_u_maxLengthConstraint(4_Clinic_1)_:
-9.2233720368547758e+18 X(4_Clinic_1)
+1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
<= 0

c_u_maxLengthConstraint(4_Clinic_2)_:
-9.2233720368547758e+18 X(4_Clinic_2)
+1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
<= 0

c_u_maxLengthConstraint(4_Rotation1_1)_:
-9.2233720368547758e+18 X(4_Rotation1_1)
+1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
<= 0

c_u_maxLengthConstraint(4_Rotation1_2)_:
-9.2233720368547758e+18 X(4_Rotation1_2)
+1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
<= 0

c_u_maxLengthConstraint(4_Rotation2_1)_:
-9.2233720368547758e+18 X(4_Rotation2_1)
+1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
<= 0

c_u_maxLengthConstraint(4_Rotation2_2)_:
-9.2233720368547758e+18 X(4_Rotation2_2)
+1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
<= 0

c_u_maxLengthConstraint(4_Vacation_1)_:
-9.2233720368547758e+18 X(4_Vacation_1)
+1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
<= 0

c_u_maxLengthConstraint(4_Vacation_2)_:
-9.2233720368547758e+18 X(4_Vacation_2)
+1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
<= 0

c_l_ZabsConstraint1(1_Clinic_1_1)_:
+1 Z(1_Clinic_1)
-1 Z(1_Clinic_2)
+1 Zabs(1_Clinic_1)
>= 0

c_l_ZabsConstraint1(1_Clinic_1_2)_:
+1 Z(1_Clinic_2)
-1 Z(1_Clinic_3)
+1 Zabs(1_Clinic_2)
>= 0

c_l_ZabsConstraint1(1_Clinic_2_4)_:
+1 Z(1_Clinic_4)
-1 Z(1_Clinic_5)
+1 Zabs(1_Clinic_4)
>= 0

c_l_ZabsConstraint1(1_Clinic_2_5)_:
+1 Z(1_Clinic_5)
-1 Z(1_Clinic_6)
+1 Zabs(1_Clinic_5)
>= 0

c_l_ZabsConstraint1(1_Rotation1_1_1)_:
+1 Z(1_Rotation1_1)
-1 Z(1_Rotation1_2)
+1 Zabs(1_Rotation1_1)
>= 0

c_l_ZabsConstraint1(1_Rotation1_1_2)_:
+1 Z(1_Rotation1_2)
-1 Z(1_Rotation1_3)
+1 Zabs(1_Rotation1_2)
>= 0

c_l_ZabsConstraint1(1_Rotation1_2_4)_:
+1 Z(1_Rotation1_4)
-1 Z(1_Rotation1_5)
+1 Zabs(1_Rotation1_4)
>= 0

c_l_ZabsConstraint1(1_Rotation1_2_5)_:
+1 Z(1_Rotation1_5)
-1 Z(1_Rotation1_6)
+1 Zabs(1_Rotation1_5)
>= 0

c_l_ZabsConstraint1(1_Rotation2_1_1)_:
+1 Z(1_Rotation2_1)
-1 Z(1_Rotation2_2)
+1 Zabs(1_Rotation2_1)
>= 0

c_l_ZabsConstraint1(1_Rotation2_1_2)_:
+1 Z(1_Rotation2_2)
-1 Z(1_Rotation2_3)
+1 Zabs(1_Rotation2_2)
>= 0

c_l_ZabsConstraint1(1_Rotation2_2_4)_:
+1 Z(1_Rotation2_4)
-1 Z(1_Rotation2_5)
+1 Zabs(1_Rotation2_4)
>= 0

c_l_ZabsConstraint1(1_Rotation2_2_5)_:
+1 Z(1_Rotation2_5)
-1 Z(1_Rotation2_6)
+1 Zabs(1_Rotation2_5)
>= 0

c_l_ZabsConstraint1(1_Vacation_1_1)_:
+1 Z(1_Vacation_1)
-1 Z(1_Vacation_2)
+1 Zabs(1_Vacation_1)
>= 0

c_l_ZabsConstraint1(1_Vacation_1_2)_:
+1 Z(1_Vacation_2)
-1 Z(1_Vacation_3)
+1 Zabs(1_Vacation_2)
>= 0

c_l_ZabsConstraint1(1_Vacation_2_4)_:
+1 Z(1_Vacation_4)
-1 Z(1_Vacation_5)
+1 Zabs(1_Vacation_4)
>= 0

c_l_ZabsConstraint1(1_Vacation_2_5)_:
+1 Z(1_Vacation_5)
-1 Z(1_Vacation_6)
+1 Zabs(1_Vacation_5)
>= 0

c_l_ZabsConstraint1(4_Clinic_1_1)_:
+1 Z(4_Clinic_1)
-1 Z(4_Clinic_2)
+1 Zabs(4_Clinic_1)
>= 0

c_l_ZabsConstraint1(4_Clinic_1_2)_:
+1 Z(4_Clinic_2)
-1 Z(4_Clinic_3)
+1 Zabs(4_Clinic_2)
>= 0

c_l_ZabsConstraint1(4_Clinic_2_4)_:
+1 Z(4_Clinic_4)
-1 Z(4_Clinic_5)
+1 Zabs(4_Clinic_4)
>= 0

c_l_ZabsConstraint1(4_Clinic_2_5)_:
+1 Z(4_Clinic_5)
-1 Z(4_Clinic_6)
+1 Zabs(4_Clinic_5)
>= 0

c_l_ZabsConstraint1(4_Rotation1_1_1)_:
+1 Z(4_Rotation1_1)
-1 Z(4_Rotation1_2)
+1 Zabs(4_Rotation1_1)
>= 0

c_l_ZabsConstraint1(4_Rotation1_1_2)_:
+1 Z(4_Rotation1_2)
-1 Z(4_Rotation1_3)
+1 Zabs(4_Rotation1_2)
>= 0

c_l_ZabsConstraint1(4_Rotation1_2_4)_:
+1 Z(4_Rotation1_4)
-1 Z(4_Rotation1_5)
+1 Zabs(4_Rotation1_4)
>= 0

c_l_ZabsConstraint1(4_Rotation1_2_5)_:
+1 Z(4_Rotation1_5)
-1 Z(4_Rotation1_6)
+1 Zabs(4_Rotation1_5)
>= 0

c_l_ZabsConstraint1(4_Rotation2_1_1)_:
+1 Z(4_Rotation2_1)
-1 Z(4_Rotation2_2)
+1 Zabs(4_Rotation2_1)
>= 0

c_l_ZabsConstraint1(4_Rotation2_1_2)_:
+1 Z(4_Rotation2_2)
-1 Z(4_Rotation2_3)
+1 Zabs(4_Rotation2_2)
>= 0

c_l_ZabsConstraint1(4_Rotation2_2_4)_:
+1 Z(4_Rotation2_4)
-1 Z(4_Rotation2_5)
+1 Zabs(4_Rotation2_4)
>= 0

c_l_ZabsConstraint1(4_Rotation2_2_5)_:
+1 Z(4_Rotation2_5)
-1 Z(4_Rotation2_6)
+1 Zabs(4_Rotation2_5)
>= 0

c_l_ZabsConstraint1(4_Vacation_1_1)_:
+1 Z(4_Vacation_1)
-1 Z(4_Vacation_2)
+1 Zabs(4_Vacation_1)
>= 0

c_l_ZabsConstraint1(4_Vacation_1_2)_:
+1 Z(4_Vacation_2)
-1 Z(4_Vacation_3)
+1 Zabs(4_Vacation_2)
>= 0

c_l_ZabsConstraint1(4_Vacation_2_4)_:
+1 Z(4_Vacation_4)
-1 Z(4_Vacation_5)
+1 Zabs(4_Vacation_4)
>= 0

c_l_ZabsConstraint1(4_Vacation_2_5)_:
+1 Z(4_Vacation_5)
-1 Z(4_Vacation_6)
+1 Zabs(4_Vacation_5)
>= 0

c_l_ZabsConstraint2(1_Clinic_1_1)_:
-1 Z(1_Clinic_1)
+1 Z(1_Clinic_2)
+1 Zabs(1_Clinic_1)
>= 0

c_l_ZabsConstraint2(1_Clinic_1_2)_:
-1 Z(1_Clinic_2)
+1 Z(1_Clinic_3)
+1 Zabs(1_Clinic_2)
>= 0

c_l_ZabsConstraint2(1_Clinic_2_4)_:
-1 Z(1_Clinic_4)
+1 Z(1_Clinic_5)
+1 Zabs(1_Clinic_4)
>= 0

c_l_ZabsConstraint2(1_Clinic_2_5)_:
-1 Z(1_Clinic_5)
+1 Z(1_Clinic_6)
+1 Zabs(1_Clinic_5)
>= 0

c_l_ZabsConstraint2(1_Rotation1_1_1)_:
-1 Z(1_Rotation1_1)
+1 Z(1_Rotation1_2)
+1 Zabs(1_Rotation1_1)
>= 0

c_l_ZabsConstraint2(1_Rotation1_1_2)_:
-1 Z(1_Rotation1_2)
+1 Z(1_Rotation1_3)
+1 Zabs(1_Rotation1_2)
>= 0

c_l_ZabsConstraint2(1_Rotation1_2_4)_:
-1 Z(1_Rotation1_4)
+1 Z(1_Rotation1_5)
+1 Zabs(1_Rotation1_4)
>= 0

c_l_ZabsConstraint2(1_Rotation1_2_5)_:
-1 Z(1_Rotation1_5)
+1 Z(1_Rotation1_6)
+1 Zabs(1_Rotation1_5)
>= 0

c_l_ZabsConstraint2(1_Rotation2_1_1)_:
-1 Z(1_Rotation2_1)
+1 Z(1_Rotation2_2)
+1 Zabs(1_Rotation2_1)
>= 0

c_l_ZabsConstraint2(1_Rotation2_1_2)_:
-1 Z(1_Rotation2_2)
+1 Z(1_Rotation2_3)
+1 Zabs(1_Rotation2_2)
>= 0

c_l_ZabsConstraint2(1_Rotation2_2_4)_:
-1 Z(1_Rotation2_4)
+1 Z(1_Rotation2_5)
+1 Zabs(1_Rotation2_4)
>= 0

c_l_ZabsConstraint2(1_Rotation2_2_5)_:
-1 Z(1_Rotation2_5)
+1 Z(1_Rotation2_6)
+1 Zabs(1_Rotation2_5)
>= 0

c_l_ZabsConstraint2(1_Vacation_1_1)_:
-1 Z(1_Vacation_1)
+1 Z(1_Vacation_2)
+1 Zabs(1_Vacation_1)
>= 0

c_l_ZabsConstraint2(1_Vacation_1_2)_:
-1 Z(1_Vacation_2)
+1 Z(1_Vacation_3)
+1 Zabs(1_Vacation_2)
>= 0

c_l_ZabsConstraint2(1_Vacation_2_4)_:
-1 Z(1_Vacation_4)
+1 Z(1_Vacation_5)
+1 Zabs(1_Vacation_4)
>= 0

c_l_ZabsConstraint2(1_Vacation_2_5)_:
-1 Z(1_Vacation_5)
+1 Z(1_Vacation_6)
+1 Zabs(1_Vacation_5)
>= 0

c_l_ZabsConstraint2(4_Clinic_1_1)_:
-1 Z(4_Clinic_1)
+1 Z(4_Clinic_2)
+1 Zabs(4_Clinic_1)
>= 0

c_l_ZabsConstraint2(4_Clinic_1_2)_:
-1 Z(4_Clinic_2)
+1 Z(4_Clinic_3)
+1 Zabs(4_Clinic_2)
>= 0

c_l_ZabsConstraint2(4_Clinic_2_4)_:
-1 Z(4_Clinic_4)
+1 Z(4_Clinic_5)
+1 Zabs(4_Clinic_4)
>= 0

c_l_ZabsConstraint2(4_Clinic_2_5)_:
-1 Z(4_Clinic_5)
+1 Z(4_Clinic_6)
+1 Zabs(4_Clinic_5)
>= 0

c_l_ZabsConstraint2(4_Rotation1_1_1)_:
-1 Z(4_Rotation1_1)
+1 Z(4_Rotation1_2)
+1 Zabs(4_Rotation1_1)
>= 0

c_l_ZabsConstraint2(4_Rotation1_1_2)_:
-1 Z(4_Rotation1_2)
+1 Z(4_Rotation1_3)
+1 Zabs(4_Rotation1_2)
>= 0

c_l_ZabsConstraint2(4_Rotation1_2_4)_:
-1 Z(4_Rotation1_4)
+1 Z(4_Rotation1_5)
+1 Zabs(4_Rotation1_4)
>= 0

c_l_ZabsConstraint2(4_Rotation1_2_5)_:
-1 Z(4_Rotation1_5)
+1 Z(4_Rotation1_6)
+1 Zabs(4_Rotation1_5)
>= 0

c_l_ZabsConstraint2(4_Rotation2_1_1)_:
-1 Z(4_Rotation2_1)
+1 Z(4_Rotation2_2)
+1 Zabs(4_Rotation2_1)
>= 0

c_l_ZabsConstraint2(4_Rotation2_1_2)_:
-1 Z(4_Rotation2_2)
+1 Z(4_Rotation2_3)
+1 Zabs(4_Rotation2_2)
>= 0

c_l_ZabsConstraint2(4_Rotation2_2_4)_:
-1 Z(4_Rotation2_4)
+1 Z(4_Rotation2_5)
+1 Zabs(4_Rotation2_4)
>= 0

c_l_ZabsConstraint2(4_Rotation2_2_5)_:
-1 Z(4_Rotation2_5)
+1 Z(4_Rotation2_6)
+1 Zabs(4_Rotation2_5)
>= 0

c_l_ZabsConstraint2(4_Vacation_1_1)_:
-1 Z(4_Vacation_1)
+1 Z(4_Vacation_2)
+1 Zabs(4_Vacation_1)
>= 0

c_l_ZabsConstraint2(4_Vacation_1_2)_:
-1 Z(4_Vacation_2)
+1 Z(4_Vacation_3)
+1 Zabs(4_Vacation_2)
>= 0

c_l_ZabsConstraint2(4_Vacation_2_4)_:
-1 Z(4_Vacation_4)
+1 Z(4_Vacation_5)
+1 Zabs(4_Vacation_4)
>= 0

c_l_ZabsConstraint2(4_Vacation_2_5)_:
-1 Z(4_Vacation_5)
+1 Z(4_Vacation_6)
+1 Zabs(4_Vacation_5)
>= 0

c_u_continuityConstraint(1_Clinic_1)_:
+1 Zabs(1_Clinic_1)
+1 Zabs(1_Clinic_2)
<= 1

c_u_continuityConstraint(1_Clinic_2)_:
+1 Zabs(1_Clinic_4)
+1 Zabs(1_Clinic_5)
<= 1

c_u_continuityConstraint(1_Rotation1_1)_:
+1 Zabs(1_Rotation1_1)
+1 Zabs(1_Rotation1_2)
<= 1

c_u_continuityConstraint(1_Rotation1_2)_:
+1 Zabs(1_Rotation1_4)
+1 Zabs(1_Rotation1_5)
<= 1

c_u_continuityConstraint(1_Rotation2_1)_:
+1 Zabs(1_Rotation2_1)
+1 Zabs(1_Rotation2_2)
<= 1

c_u_continuityConstraint(1_Rotation2_2)_:
+1 Zabs(1_Rotation2_4)
+1 Zabs(1_Rotation2_5)
<= 1

c_u_continuityConstraint(1_Vacation_1)_:
+1 Zabs(1_Vacation_1)
+1 Zabs(1_Vacation_2)
<= 1

c_u_continuityConstraint(1_Vacation_2)_:
+1 Zabs(1_Vacation_4)
+1 Zabs(1_Vacation_5)
<= 1

c_u_continuityConstraint(4_Clinic_1)_:
+1 Zabs(4_Clinic_1)
+1 Zabs(4_Clinic_2)
<= 1

c_u_continuityConstraint(4_Clinic_2)_:
+1 Zabs(4_Clinic_4)
+1 Zabs(4_Clinic_5)
<= 1

c_u_continuityConstraint(4_Rotation1_1)_:
+1 Zabs(4_Rotation1_1)
+1 Zabs(4_Rotation1_2)
<= 1

c_u_continuityConstraint(4_Rotation1_2)_:
+1 Zabs(4_Rotation1_4)
+1 Zabs(4_Rotation1_5)
<= 1

c_u_continuityConstraint(4_Rotation2_1)_:
+1 Zabs(4_Rotation2_1)
+1 Zabs(4_Rotation2_2)
<= 1

c_u_continuityConstraint(4_Rotation2_2)_:
+1 Zabs(4_Rotation2_4)
+1 Zabs(4_Rotation2_5)
<= 1

c_u_continuityConstraint(4_Vacation_1)_:
+1 Zabs(4_Vacation_1)
+1 Zabs(4_Vacation_2)
<= 1

c_u_continuityConstraint(4_Vacation_2)_:
+1 Zabs(4_Vacation_4)
+1 Zabs(4_Vacation_5)
<= 1

c_e_ONE_VAR_CONSTANT: 
ONE_VAR_CONSTANT = 1.0

bounds 
   0 <= Z(1_Clinic_1) <= 1
   0 <= Z(1_Clinic_2) <= 1
   0 <= Z(1_Clinic_3) <= 1
   0 <= Z(1_Clinic_4) <= 1
   0 <= Z(1_Clinic_5) <= 1
   0 <= Z(1_Clinic_6) <= 1
   0 <= Z(1_Clinic_7) <= 1
   0 <= Z(1_Clinic_8) <= 1
   0 <= Z(1_Rotation1_1) <= 1
   0 <= Z(1_Rotation1_2) <= 1
   0 <= Z(1_Rotation1_3) <= 1
   0 <= Z(1_Rotation1_4) <= 1
   0 <= Z(1_Rotation1_5) <= 1
   0 <= Z(1_Rotation1_6) <= 1
   0 <= Z(1_Rotation1_7) <= 1
   0 <= Z(1_Rotation1_8) <= 1
   0 <= Z(1_Rotation2_1) <= 1
   0 <= Z(1_Rotation2_2) <= 1
   0 <= Z(1_Rotation2_3) <= 1
   0 <= Z(1_Rotation2_4) <= 1
   0 <= Z(1_Rotation2_5) <= 1
   0 <= Z(1_Rotation2_6) <= 1
   0 <= Z(1_Rotation2_7) <= 1
   0 <= Z(1_Rotation2_8) <= 1
   0 <= Z(1_Vacation_1) <= 1
   0 <= Z(1_Vacation_2) <= 1
   0 <= Z(1_Vacation_3) <= 1
   0 <= Z(1_Vacation_4) <= 1
   0 <= Z(1_Vacation_5) <= 1
   0 <= Z(1_Vacation_6) <= 1
   0 <= Z(1_Vacation_7) <= 1
   0 <= Z(1_Vacation_8) <= 1
   0 <= Z(2_Clinic_1) <= 1
   0 <= Z(2_Clinic_2) <= 1
   0 <= Z(2_Clinic_3) <= 1
   0 <= Z(2_Clinic_4) <= 1
   0 <= Z(2_Clinic_5) <= 1
   0 <= Z(2_Clinic_6) <= 1
   0 <= Z(2_Clinic_7) <= 1
   0 <= Z(2_Clinic_8) <= 1
   0 <= Z(2_Rotation1_1) <= 1
   0 <= Z(2_Rotation1_2) <= 1
   0 <= Z(2_Rotation1_3) <= 1
   0 <= Z(2_Rotation1_4) <= 1
   0 <= Z(2_Rotation1_5) <= 1
   0 <= Z(2_Rotation1_6) <= 1
   0 <= Z(2_Rotation1_7) <= 1
   0 <= Z(2_Rotation1_8) <= 1
   0 <= Z(2_Rotation2_1) <= 1
   0 <= Z(2_Rotation2_2) <= 1
   0 <= Z(2_Rotation2_3) <= 1
   0 <= Z(2_Rotation2_4) <= 1
   0 <= Z(2_Rotation2_5) <= 1
   0 <= Z(2_Rotation2_6) <= 1
   0 <= Z(2_Rotation2_7) <= 1
   0 <= Z(2_Rotation2_8) <= 1
   0 <= Z(2_Vacation_1) <= 1
   0 <= Z(2_Vacation_2) <= 1
   0 <= Z(2_Vacation_3) <= 1
   0 <= Z(2_Vacation_4) <= 1
   0 <= Z(2_Vacation_5) <= 1
   0 <= Z(2_Vacation_6) <= 1
   0 <= Z(2_Vacation_7) <= 1
   0 <= Z(2_Vacation_8) <= 1
   0 <= Z(3_Clinic_1) <= 1
   0 <= Z(3_Clinic_2) <= 1
   0 <= Z(3_Clinic_3) <= 1
   0 <= Z(3_Clinic_4) <= 1
   0 <= Z(3_Clinic_5) <= 1
   0 <= Z(3_Clinic_6) <= 1
   0 <= Z(3_Clinic_7) <= 1
   0 <= Z(3_Clinic_8) <= 1
   0 <= Z(3_Rotation1_1) <= 1
   0 <= Z(3_Rotation1_2) <= 1
   0 <= Z(3_Rotation1_3) <= 1
   0 <= Z(3_Rotation1_4) <= 1
   0 <= Z(3_Rotation1_5) <= 1
   0 <= Z(3_Rotation1_6) <= 1
   0 <= Z(3_Rotation1_7) <= 1
   0 <= Z(3_Rotation1_8) <= 1
   0 <= Z(3_Rotation2_1) <= 1
   0 <= Z(3_Rotation2_2) <= 1
   0 <= Z(3_Rotation2_3) <= 1
   0 <= Z(3_Rotation2_4) <= 1
   0 <= Z(3_Rotation2_5) <= 1
   0 <= Z(3_Rotation2_6) <= 1
   0 <= Z(3_Rotation2_7) <= 1
   0 <= Z(3_Rotation2_8) <= 1
   0 <= Z(3_Vacation_1) <= 1
   0 <= Z(3_Vacation_2) <= 1
   0 <= Z(3_Vacation_3) <= 1
   0 <= Z(3_Vacation_4) <= 1
   0 <= Z(3_Vacation_5) <= 1
   0 <= Z(3_Vacation_6) <= 1
   0 <= Z(3_Vacation_7) <= 1
   0 <= Z(3_Vacation_8) <= 1
   0 <= Z(4_Clinic_1) <= 1
   0 <= Z(4_Clinic_2) <= 1
   0 <= Z(4_Clinic_3) <= 1
   0 <= Z(4_Clinic_4) <= 1
   0 <= Z(4_Clinic_5) <= 1
   0 <= Z(4_Clinic_6) <= 1
   0 <= Z(4_Clinic_7) <= 1
   0 <= Z(4_Clinic_8) <= 1
   0 <= Z(4_Rotation1_1) <= 1
   0 <= Z(4_Rotation1_2) <= 1
   0 <= Z(4_Rotation1_3) <= 1
   0 <= Z(4_Rotation1_4) <= 1
   0 <= Z(4_Rotation1_5) <= 1
   0 <= Z(4_Rotation1_6) <= 1
   0 <= Z(4_Rotation1_7) <= 1
   0 <= Z(4_Rotation1_8) <= 1
   0 <= Z(4_Rotation2_1) <= 1
   0 <= Z(4_Rotation2_2) <= 1
   0 <= Z(4_Rotation2_3) <= 1
   0 <= Z(4_Rotation2_4) <= 1
   0 <= Z(4_Rotation2_5) <= 1
   0 <= Z(4_Rotation2_6) <= 1
   0 <= Z(4_Rotation2_7) <= 1
   0 <= Z(4_Rotation2_8) <= 1
   0 <= Z(4_Vacation_1) <= 1
   0 <= Z(4_Vacation_2) <= 1
   0 <= Z(4_Vacation_3) <= 1
   0 <= Z(4_Vacation_4) <= 1
   0 <= Z(4_Vacation_5) <= 1
   0 <= Z(4_Vacation_6) <= 1
   0 <= Z(4_Vacation_7) <= 1
   0 <= Z(4_Vacation_8) <= 1
   0 <= X(1_Clinic_1) <= 1
   0 <= X(1_Clinic_2) <= 1
   0 <= X(1_Rotation1_1) <= 1
   0 <= X(1_Rotation1_2) <= 1
   0 <= X(1_Rotation2_1) <= 1
   0 <= X(1_Rotation2_2) <= 1
   0 <= X(1_Vacation_1) <= 1
   0 <= X(1_Vacation_2) <= 1
   0 <= X(4_Clinic_1) <= 1
   0 <= X(4_Clinic_2) <= 1
   0 <= X(4_Rotation1_1) <= 1
   0 <= X(4_Rotation1_2) <= 1
   0 <= X(4_Rotation2_1) <= 1
   0 <= X(4_Rotation2_2) <= 1
   0 <= X(4_Vacation_1) <= 1
   0 <= X(4_Vacation_2) <= 1
   0 <= Zabs(1_Clinic_1) <= 1
   0 <= Zabs(1_Clinic_2) <= 1
   0 <= Zabs(1_Clinic_4) <= 1
   0 <= Zabs(1_Clinic_5) <= 1
   0 <= Zabs(1_Rotation1_1) <= 1
   0 <= Zabs(1_Rotation1_2) <= 1
   0 <= Zabs(1_Rotation1_4) <= 1
   0 <= Zabs(1_Rotation1_5) <= 1
   0 <= Zabs(1_Rotation2_1) <= 1
   0 <= Zabs(1_Rotation2_2) <= 1
   0 <= Zabs(1_Rotation2_4) <= 1
   0 <= Zabs(1_Rotation2_5) <= 1
   0 <= Zabs(1_Vacation_1) <= 1
   0 <= Zabs(1_Vacation_2) <= 1
   0 <= Zabs(1_Vacation_4) <= 1
   0 <= Zabs(1_Vacation_5) <= 1
   0 <= Zabs(4_Clinic_1) <= 1
   0 <= Zabs(4_Clinic_2) <= 1
   0 <= Zabs(4_Clinic_4) <= 1
   0 <= Zabs(4_Clinic_5) <= 1
   0 <= Zabs(4_Rotation1_1) <= 1
   0 <= Zabs(4_Rotation1_2) <= 1
   0 <= Zabs(4_Rotation1_4) <= 1
   0 <= Zabs(4_Rotation1_5) <= 1
   0 <= Zabs(4_Rotation2_1) <= 1
   0 <= Zabs(4_Rotation2_2) <= 1
   0 <= Zabs(4_Rotation2_4) <= 1
   0 <= Zabs(4_Rotation2_5) <= 1
   0 <= Zabs(4_Vacation_1) <= 1
   0 <= Zabs(4_Vacation_2) <= 1
   0 <= Zabs(4_Vacation_4) <= 1
   0 <= Zabs(4_Vacation_5) <= 1
   2 <= Zhat(1) <= +inf
   2 <= Zhat(2) <= +inf
   2 <= Zhat(3) <= +inf
   2 <= Zhat(4) <= +inf
general
  Zhat(1)
  Zhat(2)
  Zhat(3)
  Zhat(4)
binary
  Z(1_Clinic_1)
  Z(1_Clinic_2)
  Z(1_Clinic_3)
  Z(1_Clinic_4)
  Z(1_Clinic_5)
  Z(1_Clinic_6)
  Z(1_Clinic_7)
  Z(1_Clinic_8)
  Z(1_Rotation1_1)
  Z(1_Rotation1_2)
  Z(1_Rotation1_3)
  Z(1_Rotation1_4)
  Z(1_Rotation1_5)
  Z(1_Rotation1_6)
  Z(1_Rotation1_7)
  Z(1_Rotation1_8)
  Z(1_Rotation2_1)
  Z(1_Rotation2_2)
  Z(1_Rotation2_3)
  Z(1_Rotation2_4)
  Z(1_Rotation2_5)
  Z(1_Rotation2_6)
  Z(1_Rotation2_7)
  Z(1_Rotation2_8)
  Z(1_Vacation_1)
  Z(1_Vacation_2)
  Z(1_Vacation_3)
  Z(1_Vacation_4)
  Z(1_Vacation_5)
  Z(1_Vacation_6)
  Z(1_Vacation_7)
  Z(1_Vacation_8)
  Z(2_Clinic_1)
  Z(2_Clinic_2)
  Z(2_Clinic_3)
  Z(2_Clinic_4)
  Z(2_Clinic_5)
  Z(2_Clinic_6)
  Z(2_Clinic_7)
  Z(2_Clinic_8)
  Z(2_Rotation1_1)
  Z(2_Rotation1_2)
  Z(2_Rotation1_3)
  Z(2_Rotation1_4)
  Z(2_Rotation1_5)
  Z(2_Rotation1_6)
  Z(2_Rotation1_7)
  Z(2_Rotation1_8)
  Z(2_Rotation2_1)
  Z(2_Rotation2_2)
  Z(2_Rotation2_3)
  Z(2_Rotation2_4)
  Z(2_Rotation2_5)
  Z(2_Rotation2_6)
  Z(2_Rotation2_7)
  Z(2_Rotation2_8)
  Z(2_Vacation_1)
  Z(2_Vacation_2)
  Z(2_Vacation_3)
  Z(2_Vacation_4)
  Z(2_Vacation_5)
  Z(2_Vacation_6)
  Z(2_Vacation_7)
  Z(2_Vacation_8)
  Z(3_Clinic_1)
  Z(3_Clinic_2)
  Z(3_Clinic_3)
  Z(3_Clinic_4)
  Z(3_Clinic_5)
  Z(3_Clinic_6)
  Z(3_Clinic_7)
  Z(3_Clinic_8)
  Z(3_Rotation1_1)
  Z(3_Rotation1_2)
  Z(3_Rotation1_3)
  Z(3_Rotation1_4)
  Z(3_Rotation1_5)
  Z(3_Rotation1_6)
  Z(3_Rotation1_7)
  Z(3_Rotation1_8)
  Z(3_Rotation2_1)
  Z(3_Rotation2_2)
  Z(3_Rotation2_3)
  Z(3_Rotation2_4)
  Z(3_Rotation2_5)
  Z(3_Rotation2_6)
  Z(3_Rotation2_7)
  Z(3_Rotation2_8)
  Z(3_Vacation_1)
  Z(3_Vacation_2)
  Z(3_Vacation_3)
  Z(3_Vacation_4)
  Z(3_Vacation_5)
  Z(3_Vacation_6)
  Z(3_Vacation_7)
  Z(3_Vacation_8)
  Z(4_Clinic_1)
  Z(4_Clinic_2)
  Z(4_Clinic_3)
  Z(4_Clinic_4)
  Z(4_Clinic_5)
  Z(4_Clinic_6)
  Z(4_Clinic_7)
  Z(4_Clinic_8)
  Z(4_Rotation1_1)
  Z(4_Rotation1_2)
  Z(4_Rotation1_3)
  Z(4_Rotation1_4)
  Z(4_Rotation1_5)
  Z(4_Rotation1_6)
  Z(4_Rotation1_7)
  Z(4_Rotation1_8)
  Z(4_Rotation2_1)
  Z(4_Rotation2_2)
  Z(4_Rotation2_3)
  Z(4_Rotation2_4)
  Z(4_Rotation2_5)
  Z(4_Rotation2_6)
  Z(4_Rotation2_7)
  Z(4_Rotation2_8)
  Z(4_Vacation_1)
  Z(4_Vacation_2)
  Z(4_Vacation_3)
  Z(4_Vacation_4)
  Z(4_Vacation_5)
  Z(4_Vacation_6)
  Z(4_Vacation_7)
  Z(4_Vacation_8)
  X(1_Clinic_1)
  X(1_Clinic_2)
  X(1_Rotation1_1)
  X(1_Rotation1_2)
  X(1_Rotation2_1)
  X(1_Rotation2_2)
  X(1_Vacation_1)
  X(1_Vacation_2)
  X(4_Clinic_1)
  X(4_Clinic_2)
  X(4_Rotation1_1)
  X(4_Rotation1_2)
  X(4_Rotation2_1)
  X(4_Rotation2_2)
  X(4_Vacation_1)
  X(4_Vacation_2)
  Zabs(1_Clinic_1)
  Zabs(1_Clinic_2)
  Zabs(1_Clinic_4)
  Zabs(1_Clinic_5)
  Zabs(1_Rotation1_1)
  Zabs(1_Rotation1_2)
  Zabs(1_Rotation1_4)
  Zabs(1_Rotation1_5)
  Zabs(1_Rotation2_1)
  Zabs(1_Rotation2_2)
  Zabs(1_Rotation2_4)
  Zabs(1_Rotation2_5)
  Zabs(1_Vacation_1)
  Zabs(1_Vacation_2)
  Zabs(1_Vacation_4)
  Zabs(1_Vacation_5)
  Zabs(4_Clinic_1)
  Zabs(4_Clinic_2)
  Zabs(4_Clinic_4)
  Zabs(4_Clinic_5)
  Zabs(4_Rotation1_1)
  Zabs(4_Rotation1_2)
  Zabs(4_Rotation1_4)
  Zabs(4_Rotation1_5)
  Zabs(4_Rotation2_1)
  Zabs(4_Rotation2_2)
  Zabs(4_Rotation2_4)
  Zabs(4_Rotation2_5)
  Zabs(4_Vacation_1)
  Zabs(4_Vacation_2)
  Zabs(4_Vacation_4)
  Zabs(4_Vacation_5)
end 

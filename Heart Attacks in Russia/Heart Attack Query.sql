# Load Data 
select * from `heart_attack_russia_data 1`;
SELECT * FROM `heart_attack_russia_data 2`;

# Combine Both Data Sets
select * 
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
;

# Data Exploration 
SELECT heart_attack
from `heart_attack_russia_data 1`
group by DISTINCT heart_attack;

# Heart Attack Stats
select Heart_Attack, avg(Age), avg(Heart_Rate), max(Blood_Pressure), count(Heart_Attack), avg(Stress_Level)
from `heart_attack_russia_data 1`
group by Heart_Attack
;

# Gender Stats
select Gender, avg(Age), avg(Heart_Rate), max(Blood_Pressure), count(Heart_Attack), avg(Stress_Level)
from `heart_attack_russia_data 1`
group by Gender
;

# Age Stas
select Age, count(Age), avg(Heart_Rate), max(Blood_Pressure), count(Heart_Attack), avg(Stress_Level)
from `heart_attack_russia_data 1`
group by Age
;

# Conditional Query
select * 
from `heart_attack_russia_data 1`
where Age > 30 and Heart_Rate > 70;

select * 
from `heart_attack_russia_data 2`
where Heart_Disease_History = 'True' and Occupation = 'Unemployed';

select Gender
from `heart_attack_russia_data 1`
where Heart_Attack = 'True'
group by Gender
;

select Age ,Gender , COUNT(ID)
from `heart_attack_russia_data 1`
group by Age, Gender
order by Age;

# Gender Undisclosed
select *
from `heart_attack_russia_data 1`
where Gender = "Other";

# Condition 
# High Stress level and Heart rate
select Heart_Attack , count(ID)
from `heart_attack_russia_data 1`
where Stress_Level > 5 and Heart_Rate > 70
group by Heart_Attack;

# Low Exercise more likely to lead to heart attack ?
select Exercise_Level , count(Heart_Attack ="FALSE"), count(Heart_Attack ="TRUE")
from `heart_attack_russia_data 1`
group by Exercise_Level;

# Diet in relation to heart disease in general
select Diet , count(ID)
from `heart_attack_russia_data 2`
where Heart_Disease_History = 'TRUE'
group by Diet;

# Effects using age parameter
select Age , count(ID)
from `heart_attack_russia_data 1`
where Heart_Attack = 'TRUE'
group by Age
order by count(ID) DESC;

# Effects using gender parameter
select Gender , count(ID)
from `heart_attack_russia_data 1`
where Heart_Attack = 'TRUE'
group by Gender
order by count(ID) DESC;

select * 
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
where Urban_Rural = 'Urban' and Heart_Attack = 'TRUE'
;

# Statistics basesed on parameters where a Heart Attack was recorded
select Region, avg(Blood_Pressure),avg(Heart_Rate), SUM(CASE WHEN Family_History = 'TRUE' THEN 1 ELSE 0 END)as count_family_history_true,
SUM(CASE WHEN Family_History = 'FALSE' THEN 1 ELSE 0 END)as count_family_history_false, avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
	LENGTH(heart_attack - heart_attack_ture) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Region
;

select Diabetes, avg(Blood_Pressure),avg(Heart_Rate), SUM(CASE WHEN Family_History = 'TRUE' THEN 1 ELSE 0 END)as count_family_history_true,
SUM(CASE WHEN Family_History = 'FALSE' THEN 1 ELSE 0 END)as count_family_history_false, avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false  
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Diabetes
;

select Heart_Attack, avg(Blood_Pressure),avg(Heart_Rate), avg(Stress_Level), avg(Health_Awareness), avg(Daily_Water_Intake),
avg(Daily_Water_Intake),avg(Mental_Health), avg(Cholesterol)
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
where Urban_Rural = 'Urban'
group by Heart_Attack
;

select Alcohol_Consumption, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Alcohol_Consumption
;

select Heart_Disease_History, avg(Blood_Pressure),avg(Heart_Rate), SUM(CASE WHEN Family_History = 'TRUE' THEN 1 ELSE 0 END)as count_family_history_true,
SUM(CASE WHEN Family_History = 'FALSE' THEN 1 ELSE 0 END)as count_family_history_false, avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Heart_Disease_History
;

select Occupation, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness), avg(Daily_Water_Intake),
avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Occupation
;

select Marital_Status, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Marital_Status
;

select Family_History, avg(Blood_Pressure),avg(Heart_Rate), SUM(CASE WHEN Family_History = 'TRUE' THEN 1 ELSE 0 END)as count_family_history_true,
SUM(CASE WHEN Family_History = 'FALSE' THEN 1 ELSE 0 END)as count_family_history_false, avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Family_History
;

select Exercise_Level, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness), avg(Daily_Water_Intake),
avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Exercise_Level
;

select Medication, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Medication
;

select Angina, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Angina
;

select Smoking, avg(Blood_Pressure),avg(Heart_Rate),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Smoking
;

select Income_Level, avg(Blood_Pressure),avg(Heart_Rate), avg(Health_Awareness),avg(Daily_Water_Intake),avg(Daily_Water_Intake),
 SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Income_Level
;

select Obesity,avg(Blood_Pressure), count(Family_History),avg(Heart_Rate), avg(Health_Awareness),
 avg(Daily_Water_Intake),avg(Daily_Water_Intake), SUM(CASE WHEN d1.Heart_Attack = 'TRUE' THEN 1 ELSE 0 END) AS heart_attack_true,
    SUM(CASE WHEN d1.Heart_Attack = 'FALSE' THEN 1 ELSE 0 END) AS heart_attack_false
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by Obesity
;

select family_history, sum(case when d1.family history ='TRUE'), sum(case when d1.family history ='FALSE')
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
group by family_history
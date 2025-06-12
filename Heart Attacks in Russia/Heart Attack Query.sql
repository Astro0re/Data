# Load Data 
select * from `heart_attack_russia_data 1`;

select * from `heart_attack_russia_data 2`;

# Combine Both Data Sets
select * 
from `heart_attack_russia_data 1` as d1
join `heart_attack_russia_data 2` as d2
	on d1.ID = d2.ID 
;

# Data Exploration 
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
# Not really significant
select Exercise_Level , count(ID)
from `heart_attack_russia_data 1`
where Heart_Attack = 'TRUE'
group by Exercise_Level;

# Diet in relation to heart disease in general
# No significance noticed
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
select * from `heart_attack_russia_data 1`
where Age > 30 and Heart_Rate > 70;

select * from `heart_attack_russia_data 2`
where Heart_Disease_History = 'True' and Occupation = 'Unemployed';

select Age, Gender , COUNT(ID)
from `heart_attack_russia_data 1`
group by Gender
having Heart_Attack = 'True';

select Age ,Gender , COUNT(ID)
from `heart_attack_russia_data 1`
group by Age, Gender
order by Age;

select Gender, COUNT(ID)
from `heart_attack_russia_data 1`
group by Gender;
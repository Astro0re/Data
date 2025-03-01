-- @block 
CREATE DATABASE Russia_Heart_Attacks;

-- @block
USE Russia_Heart_Attacks;

-- @block
CREATE TABLE Heart_Attacks (
    ID INT UNIQUE , 
    Age INT,
    Gender VARCHAR,
    Region VARCHAR(50)
);

-- @block
CREATE TABLE Health_Info (
    ID INT UNIQUE , 
    Angina BOOLEAN,
    Blood_Pressure FLOAT,
    Cholesterol FLOAT,
    BMI FLOAT,
    Diabetes BOOLEAN,
    Heart_Rate FLOAT,
    Heart_Attack BOOLEAN
);

-- @block
CREATE TABLE Lifestyle_Info (
    ID INT UNIQUE , 
    Exercise_Level INT,
    Smoking BOOLEAN,
    Family_History BOOLEAN,
    Stress_Level RANGE
);

ID,
Heart_Disease_History,
Diet,
Sleep_Hours,
Occupation
,Income_Level
,Physical_Activity
,Education_Level
,Marital_Status,Urban_Rural,Medication,Health_Awareness,Daily_Water_Intake,Mental_Health,Obesity,Alcohol_Consumption,Heart_Attack

-- @block
IMPORT TABLE heart_attack_russia_Data 1.csv INTO Heart_Attacks;

-- @block
IMPORT TABLE heart_attack_russia_Data 2.csv INTO Heart_Attacks;

-- @block 
CREATE DATABASE Russia_Heart_Attacks;

-- @block
USE Russia_Heart_Attacks;

-- @block
CREATE TABLE Heart_Attacks (
    ID INT UNIQUE , 
    Age INT
,Urban_Rural
,Medication
,Health_Awareness
,Daily_Water_Intake
,Mental_Health
,Obesity



-- @block
IMPORT TABLE heart_attack_russia_Data 1.csv INTO Heart_Attacks;

-- @block
IMPORT TABLE heart_attack_russia_Data 2.csv INTO Heart_Attacks;


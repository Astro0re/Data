-- @block 
CREATE DATABASE Russia_Heart_Attacks;

-- @block
USE Russia_Heart_Attacks;

-- @block
CREATE TABLE Heart_Attacks (
    ID INT UNIQUE , 
    Age INT,
    Gender VARCHAR,
    Region VARCHAR(50),
    Education_Level VARCHAR
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
    Family_History BOOLEAN,
    Heart_Attack BOOLEAN,
    Heart_Disease_History BOOLEAN,  
    Medication BOOLEAN,
    Health_Awareness INT
);

-- @block
CREATE TABLE Lifestyle_Info (
    ID INT UNIQUE,
    Alcohol_Consumption COMMENT, 
    Exercise_Level VARCHAR,
    Smoking BOOLEAN,
    Diet COMMENT,
    Sleep_Hours FLOAT,
    Marital_Status VARCHAR,
    Urban_Rural VARCHAR,
    Daily_Water_Intake FLOAT,
    Mental_Health INT,
    Obesity BOOLEAN
);

-- @block
CREATE TABLE External_Factors_Info (
    ID INT UNIQUE , 
    Stress_Level RANGE,
    Occupation VARCHAR,
    Pyhsical_Activity VARCHAR,
    Income_Level VARCHAR,
);

-- @block
INSERT DATA INTO TABLE Heart_Attacks, Health_Info, Lifestyle_Info, External_Factors_Info
FROM '/Data/Heart Attacks in Russia/heart_attack_russia_youth_vs_adult for sql.csv'
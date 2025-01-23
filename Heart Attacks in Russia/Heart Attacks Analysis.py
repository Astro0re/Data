import pandas as pd
import numpy as nu
import matplotlib as mat

Hrt_A =pd.read_csv(r"C:\Users\USER\Downloads\heart_attack_russia_youth_vs_adult.csv")

print(Hrt_A.head())

print(Hrt_A.shape)

print(Hrt_A.info())

print(Hrt_A.describe())

print(f"Highest Age recorded is {Hrt_A['Age'].max()}")

#check relations between obesity and heart attacks 
Obe_Att_Tru = Hrt_A['Obesity'] == True , Hrt_A['Heart_Attack']==True
Obe_Att_Fal = Hrt_A['Obesity'] == False , Hrt_A['Heart_Attack']==True
print(Obe_Att_Fal)
print(Obe_Att_Tru)
print(len(Obe_Att_Tru))
print(len(Obe_Att_Fal))

#check relations between stress level and heart attacks 

#check relations urban/rural level and heart attacks 

#check relations between daily water intake and 
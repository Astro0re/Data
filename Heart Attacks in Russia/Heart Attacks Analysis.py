import pandas as pd
import numpy as nu
import matplotlib as mat

Hrt_A =pd.read_csv(r"C:\Users\USER\Downloads\heart_attack_russia_youth_vs_adult.csv")

print(Hrt_A.head())

print(Hrt_A.shape)

print(Hrt_A.info())

print(Hrt_A.describe())

print(Hrt_A['Age'].max())
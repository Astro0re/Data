import pandas as pd
import numpy as nu
import matplotlib as mt

Hrt =pd.read_csv(r"C:\Users\USER\Downloads\Dataset Heart Disease.csv")

view_info = Hrt.head()

print(view_info)

print(Hrt.shape)

Hrt.info()

view_data_details = Hrt.describe()

print(Hrt['age'].value_counts())

nu.abs(.45)


Density_Plot =Hrt['age'].plot(kind='box' , vert=True, figsize=(14,6))


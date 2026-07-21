# Housing Analysis
## Packages
import os
import pandas as pd 
import numpy as nu 
import matplotlib.pyplot as plt 

## Data collection
path = os.getcwd()
print(path)
data = pd.read_csv(f"{path}/Q_housing/quebec_housing_sales_v2.csv") 


print(data.info())
print(data.head())
print(data.describe())

## Data Cleaning 

print(data[data['lot_size_sqft'].isna()])

## Data Analysis 


## Data Visualization


## insights 
""" 
Duration between year built(renovation impact) and sale year
High population density
Nighborhood pefrence
Family size based on bedroon/bathroom
What year experienced the highest number of houses built
Factors influencing sale price
issues to address
"""
import pandas as pd
import numpy as np
import matplotlib as mat

glass=pd.read_csv(r"C:\Users\USER\Documents\Git_Hub Data\Data\Glass\glass.csv")

print(glass.head())
print(glass.info())
print(glass.describe())
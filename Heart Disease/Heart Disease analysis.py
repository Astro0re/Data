import pandas as pd

Hrt =pd.read_csv(r"C:\Users\USER\Downloads\Dataset Heart Disease.csv")

view_info = Hrt.head()

print(Hrt.shape)

Hrt.info()

view_data_details = Hrt.describe()

Hrt.index
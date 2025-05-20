library(tidyverse)
library(Hmisc)
library(ggplot2)

lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")

describe(lung)

head(lung_c)

# Smocking_Status
table(lung_c$Smoking_Status)

# Works but does not display properly
# Output wrong 
Smoke_stat <- lung_c %>% 
  group_by(Smoking_Status) %>% 
  summarise(Lung_Cancer = table(lung_c$Lung_Cancer_Stage))
print(Smoke_stat)
  

# Secondhand_Smoke
table(lung_c$Secondhand_Smoke_Exposure)

Smoke_stat <- lung_c %>% 
  group_by(Secondhand_Smoke_Exposure) %>% 
  summarise(Lung_Cancer = table(lung_c$Lung_Cancer_Stage))
print(Smoke_stat)

# Smoke stats never should relate to years_smoking and cigarettes_per_day ??

view(lung_c$Smoking_Status)

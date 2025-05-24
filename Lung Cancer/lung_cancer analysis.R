library(tidyverse)
library(Hmisc)
library(ggplot2)

lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")

describe(lung_c)

head(lung_c)

# Smocking_Status
table(lung_c$Smoking_Status)

# Works but does not display properly
# Output wrong 
Smoke_stat <- lung_c %>% 
  group_by(Smoking_Status) %>% 
  summarise(Lung_Cancer = table(lung_c$Lung_Cancer_Stage))
print(Smoke_stat)

  
lung_c %>% ggplot(aes(Smoking_Status, 1))+
  geom_col()

# Secondhand_Smoke
table(lung_c$Secondhand_Smoke_Exposure)

Smoke_stat <- lung_c %>% 
  group_by(Secondhand_Smoke_Exposure) %>% 
  summarise(Lung_Cancer = table(lung_c$Lung_Cancer_Stage))
print(Smoke_stat)

lung_c %>% ggplot(aes(Secondhand_Smoke_Exposure, 1))+
  geom_col()+
  facet_wrap(~lung_c$Lung_Cancer_Stage)

# Smoke stats never should relate to years_smoking and cigarettes_per_day ??

table(lung_c$Occupation_Exposure)

lung_c %>% ggplot(aes(Secondhand_Smoke_Exposure, 1))+
  geom_col()+
  facet_wrap(~lung_c$Lung_Cancer_Stage)

lung_c %>% ggplot(aes(Gender,0.1))+
  geom_col()


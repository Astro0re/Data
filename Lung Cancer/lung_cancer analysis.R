library(tidyverse)
library(Hmisc)
library(ggplot2)

lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")

describe(lung_c)

head(lung_c)

# Smocking_Status
table(lung_c$Smoking_Status)


# Data Viz
#Gender
lung_c %>% ggplot(aes(Gender, 0.1)) +
  geom_col()
#Run T/AB testing on gender
lung_c %>% ggplot(aes(Gender, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)

# Smoking status
# Smoke stats never should relate(display 0) to years_smoking and cigarettes_per_day ??
lung_c %>% ggplot(aes(Smoking_Status, 1)) +
  geom_col()

# Secondhand_Smoke
table(lung_c$Secondhand_Smoke_Exposure)

lung_c %>% ggplot(aes(Secondhand_Smoke_Exposure, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)
#This Graph shows that second hand smoke exposure does not directly relate to lung cancer

#Occupational exposure
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Occupation_Exposure, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)

table(lung_c$Occupation_Exposure)

#Family History
lung_c %>% ggplot(aes(Family_History, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)

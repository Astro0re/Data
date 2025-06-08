library(tidyverse)
library(Hmisc)
library(ggplot2)

lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")

describe(lung_c)

head(lung_c)

# Finding possible causative factors of lung cancer 
# Finding correlative factors

#Variables 
# Patients infected with lung cancer of any stage
lung_c$infect_dummy <- lung_c$Lung_Cancer_Stage != "None"

lung_c %>% ggplot(aes(infect_dummy))+
  geom_bar()

lung_c %>% filter(infect_dummy == "TRUE") %>% 
  ggplot(aes(Occupation_Exposure))+
  geom_bar()

lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Diagnosis_Year, infect_dummy))+
  geom_point()+
  geom_line()

lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Diagnosis_Year))+
  geom_bar()


lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Survival_Status))+
  geom_bar()

# Not Infected
lung_c %>% filter(infect_dummy == "FALSE") %>%
  ggplot(aes(Survival_Status))+
  geom_bar()

# Lived more than 10 years after diagnosis 
lung_c$longevity <- (2025 - lung_c$Diagnosis_Year) > 9

lung_c %>%  filter(infect_dummy == "TRUE") %>%
  ggplot(aes(longevity))+
  geom_bar()


# Smocking_Status
table(lung_c$Smoking_Status)
lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Smoking_Status))+
  geom_bar()

# Data Viz
#Gender
lung_c %>% filter(infect_dummy == "TRUE") %>% 
  ggplot(aes(Gender))+
  geom_bar()

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
  ggplot(aes(Occupation_Exposure)) +
  geom_bar()

table(lung_c$Occupation_Exposure)

#Family History
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Family_History, 1, colour = Lung_Cancer_Stage))+
  geom_col()

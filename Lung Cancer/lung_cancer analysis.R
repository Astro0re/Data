# Load Packages
library(tidyverse)
library(Hmisc)
library(ggplot2)

#Load data and explore data 
lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")

describe(lung_c)
summarise(lung_c)


# Finding possible causative factors of lung cancer 
# Finding correlative factors
male <- subset(lung_c, lung_c$Gender== 'Male')
female <- subset(lung_c, lung_c$Gender== 'Female')

#Variables 
# Patients infected with lung cancer of any stage
lung_c$infect_dummy <- lung_c$Lung_Cancer_Stage != "None"

lung_c %>% ggplot(aes(infect_dummy))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

lung_c %>% filter(infect_dummy == "TRUE") %>% 
  ggplot(aes(Occupation_Exposure))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Diagnosis_Year))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')


lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Survival_Status))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

# Not Infected
lung_c %>% filter(infect_dummy == "FALSE") %>%
  ggplot(aes(Survival_Status))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

lung_c %>% filter(infect_dummy == "FALSE") %>%
  ggplot(aes(BMI))+
  geom_bar()
lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(BMI))+
  geom_bar()

# Lived more than 10 years after diagnosis 
lung_c$longevity <-  (2025 - lung_c$Diagnosis_Year) > 10 & lung_c$Survival_Status == "Alive"


lung_c %>%  filter(infect_dummy == "TRUE") %>%
  ggplot(aes(longevity))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')


# Smocking_Status
table(lung_c$Smoking_Status)
lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Smoking_Status))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

# Data Viz
#Gender
lung_c %>% filter(infect_dummy == "TRUE") %>% 
  ggplot(aes(Gender))+
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

#Run T/AB testing on gender
lung_c %>% ggplot(aes(Gender, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)+
  labs(title = ''  , y= '' , x= '')

# Smoking status
# Smoke stats never should relate(display 0) to years_smoking and cigarettes_per_day ??
lung_c %>% ggplot(aes(Smoking_Status, 1)) +
  geom_col()+
  labs(title = ''  , y= '' , x= '')


# Secondhand_Smoke
table(lung_c$Secondhand_Smoke_Exposure)

lung_c %>% ggplot(aes(Secondhand_Smoke_Exposure, 1)) +
  geom_col() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)+
  labs(title = ''  , y= '' , x= '')

#This Graph shows that second hand smoke exposure does not directly relate to lung cancer

#Occupational exposure
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Occupation_Exposure)) +
  geom_bar()+
  labs(title = ''  , y= '' , x= '')

table(lung_c$Occupation_Exposure)

#Family History
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Family_History, 1, colour = Lung_Cancer_Stage))+
  geom_col()+
  labs(title = ''  , y= '' , x= '')

#Not a lot of significant causative factors 

lung_c$infect_dummy <- as.integer(lung_c$infect_dummy)

#t.test(male$infect_dummy, female$infect_dummy, conf.level = 0.95, alternative = "two.sided")

t.test(male$Age, female$Age, conf.level = 0.95, alternative = "two.sided")

lung_c %>%ggplot(aes(Diagnosis_Year, infect_dummy))+
  geom_col()+
  labs(title = ''  , y= '' , x= '')

#Death rate
sum(lung_c$Survival_Status == "Deceased") / length(lung_c$Survival_Status)
 
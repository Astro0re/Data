# Load Packages
library(tidyverse)
library(Hmisc)


#Load data and explore data 
lung_c <- read.csv("C:/Users/USER/Documents/Git_Hub Data/Data/Lung Cancer/Lung_Cancer_Trends_Realistic.csv")
describe(lung_c)

#Variables 
# Patients infected with lung cancer of any stage
lung_c$infect_dummy <- lung_c$Lung_Cancer_Stage != "None"

# Finding possible causative factors of lung cancer 
# Finding correlative factors

#Gender
male <- subset(lung_c, lung_c$Gender== 'Male')
female <- subset(lung_c, lung_c$Gender== 'Female')

lung_c %>% ggplot(aes(infect_dummy))+
  geom_bar()+
  labs(title = 'INFECTION STATUS'  , y= 'COUNT' , x= 'INFECTION STATUS')


lung_c %>% 
  ggplot(aes(Diagnosis_Year, fill = infect_dummy))+
  geom_bar()+
  labs(title = 'INFECTION RATE OVER THE YEARS'  , y= 'COUNT' , x= 'YEAR')

lung_c %>% 
  ggplot(aes(Survival_Status, fill = infect_dummy))+
  geom_bar()+
  labs(title = 'SURVIVAL STATS'  , y= 'COUNT' , x= 'SURVIVAL STATUS')

# Not Infected
lung_c %>% filter(infect_dummy == "FALSE") %>%
  ggplot(aes(Survival_Status))+
  geom_bar()+
  labs(title = 'SURVIVAL STATS(NOT INFECTED)'  , y= 'COUNT' , x= 'SURVIVAL STATUS')

lung_c %>% filter(infect_dummy == "FALSE") %>%
  ggplot(aes(BMI))+
  geom_bar()+
  labs(title = "Average BMI(Not infected)")

lung_c %>% filter(infect_dummy == "TRUE") %>%
  ggplot(aes(BMI))+
  geom_bar()+
  labs(title = "Average BMI(Infected)")

# Lived more than 10 years after diagnosis 
longev <- subset(lung_c, (2025 - lung_c$Diagnosis_Year) >= 10  & lung_c$Survival_Status == "Alive" &  lung_c$infect_dummy == "TRUE" )

longev %>%  filter(infect_dummy == "TRUE") %>%
  ggplot(aes(Gender))+
  geom_bar()+
  labs(title = 'LONGEVITY(ALIVE FOR OVER TEN YEARS FOLLOWING INFECTION)'  , y= 'COUNT' , x= 'LONGEVITY')


# Data Viz
#Gender
lung_c %>%
  ggplot(aes(Gender, fill = infect_dummy))+
  geom_bar()+
  labs(title = 'GENDER'  , y= 'COUNT' , x= 'GENDER')

lung_c %>%
  ggplot(aes(Gender, fill= Occupation_Exposure))+
  geom_bar()+
  labs(title = 'GENDER-EXPOSURE'  , y= 'COUNT' , x= 'GENDER')

#Run T/AB testing on gender
lung_c %>% filter(lung_c$Lung_Cancer_Stage != "None") %>% 
  ggplot(aes(Gender)) +
  geom_bar() +
  facet_wrap(~lung_c$Lung_Cancer_Stage)+
  labs(title = 'GENDER'  , y= 'COUNT' , x= 'GENDER')

# Smoking status
# Smoke stats never should relate(display 0) to years_smoking and cigarettes_per_day ??
lung_c %>% ggplot(aes(Smoking_Status)) +
  geom_bar()+
  labs(title = 'SMOKING STATUS'  , y= 'COUNT' , x= 'STATUS')

# Smocking_Status
table(lung_c$Smoking_Status)
lung_c %>% 
  ggplot(aes(Smoking_Status, fill = infect_dummy))+
  geom_bar()+
  labs(title = 'SMOKING STATUS'  , y= 'COUNT' , x= 'SMOKING STATUS')

# Secondhand_Smoke
table(lung_c$Secondhand_Smoke_Exposure)

lung_c %>% filter(Lung_Cancer_Stage !="None") %>% 
  ggplot(aes(Secondhand_Smoke_Exposure, fill = Lung_Cancer_Stage)) +
  geom_bar()+
  labs(title = 'SECOND HAND EXPOSURE'  , y= 'COUNT' , x= 'SMOKE EXPOSURE')

#This Graph shows that second hand smoke exposure does not directly relate to lung cancer

#Occupational exposure
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Occupation_Exposure)) +
  geom_bar()+
  labs(title = 'EXPOSURE(INFECTED)'  , y= 'COUNT' , x= 'FACTORS')

table(lung_c$Occupation_Exposure)

#Family History
lung_c %>% filter(Lung_Cancer_Stage != "None") %>%
  ggplot(aes(Family_History, fill = Lung_Cancer_Stage))+
  geom_bar()+
  labs(title = 'FAMILY HISTORY(INFECTED)'  , y= 'cOUNT' , x= 'HISTORY')

#Not a lot of significant causative factors 

lung_c %>% lung_c$infect_dummy <- as.integer(lung_c$infect_dummy) %>% 
   t.test(male$Age, female$Age, conf.level = 0.95, alternative = "two.sided")

lung_c %>%
  lung_c$infect_dummy <- as.integer(lung_c$infect_dummy) %>% 
   t.test(male$infect_dummy, female$infect_dummy, conf.level = 0.95, alternative = "two.sided")
lung_c %>%ggplot(aes(Diagnosis_Year, infect_dummy))+
  geom_col()+
  labs(title = 'INFECTION RATE THROUGH THE YEARS'  , y= 'INFECTED COUNT' , x= 'YEARS')

#Death rate
lung_DeathR <- sum(lung_c$Survival_Status == "Deceased") / length(lung_c$Survival_Status)

lung_c %>% 
  ggplot(aes(Diagnosis_Year))+
  geom_bar()+
  facet_wrap(~Survival_Status)+
  labs(title = 'INFECTION RATE OVER THE YEARS'  , y= 'COUNT' , x= 'YEAR')

# Region 
lung_c %>% filter(infect_dummy == "TRUE") %>% 
  ggplot(aes(Region))+
  geom_bar()+
  labs(title = "Infection Count by Region(Infected)")

lung_c %>%
  ggplot(aes(Diet_Quality))+
  geom_bar()+
  facet_wrap(~Region)+
  labs(title = "Diet_Quality by Region(Infected)")

lung_c %>%
  ggplot(aes(Smoking_Status))+
  geom_bar()+
  facet_wrap(~Region)+
  labs(title = "Smoking Status by Region(Infected)")

lung_c %>%
  ggplot(aes(Family_History))+
  geom_bar()+
  facet_wrap(~Region)+
  labs(title = "Family History by Region(Infected)")

lung_c %>%
  ggplot(aes(Occupation_Exposure))+
  geom_bar()+
  facet_wrap(~Region)+
  labs(title = "Occupation Exposure by Region(Infected)")

lung_c %>%
  ggplot(aes(Genetic_Markers_Positive))+
  geom_bar()+
  facet_wrap(~Region)+
  labs(title = "Genetic Markers by Region(Infected)")

#Genetic Markers x Family History
lung_c %>%
  ggplot(aes(Genetic_Markers_Positive , fill = Family_History))+
  geom_bar()+
  labs(title = "")

lung_c %>%
  ggplot(aes(Family_History , fill = Genetic_Markers_Positive))+
  geom_bar()+
  labs(title = "")

#Chronic Lung Disease x Lung Cancer
lung_c %>%
  ggplot(aes(Chronic_Lung_Disease, fill = Lung_Cancer_Stage))+
  geom_bar()+
  labs(title = "")

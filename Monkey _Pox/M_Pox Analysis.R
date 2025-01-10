#Load Data gotten from https://catalog.ourworldindata.org
M_Pox <- read.csv("C:/Users/USER/Downloads/monkeypox.csv")

#Load R Studio Packages
library(tidyverse)

#Grouped into locations of the world(Continents)
Afri <- M_Pox%>%
  filter(location %in% c("Africa", "Benin","Cameroon","Central African Republic",
                         "Congo","Cote d'Ivoire","Democratic Republic of Congo",
                         'Egypt','France','Ghana','Guinea','Kenya','Liberia','Morocco',
                         'Mozambique','Nigeria','Rwanda','South Africa','Sudan','Uganda',
                         'Zambia','Zimbabwe'))
Euro <- M_Pox%>%
  filter(location %in% c("Europe", "Andorra","Austria","Belgium","Bosnia and Herzegovina",
                         "Bulgaria","Croatia","Cyprus","Czechia","Denmark",'Estonia'
                         ,'Europe','France','Georgia','Germany','Gibraltar','Greece',
                         'Greenland','Hungary','Iceland','Ireland','Italy','Latvia',
                         'Lithuania','Luxembourg','Malta','Martinique','Moldova',
                         'Monaco','Montenegro','Netherlands','Norway','Poland',
                         'Portugal','Romania','Russia','Saint Martin (French part)',
                         'San Marino','Serbia','Slovakia','Slovenia','Spain','Sweden',
                         'Switzerland','Turkey','Ukraine','United Kingdom'))
Asia <- M_Pox%>%
  filter(location %in% c("Asia", "Bahrain","Cambodia","China",'India','Indonesia',
                         'Iran','Israel','Japan','Jordan','Laos','Lebanon','Malaysia',
                         'Nepal','Oman','Pakistan','Philippines','Qatar','Saudi Arabia',
                         'Singapore','South Korea','Sri Lanka','Thailand','United Arab Emirates',
                         'Vietnam'))

Ocea <- M_Pox%>%
  filter(location %in% c("Oceania", "Australia",'Guam','New Caledonia','New Zealand'))

Nt_Ame <- M_Pox%>%
  filter(location %in% c("North America","Canada","Costa Rica","Cuba",
                         'Dominican Republic','El Salvador','Guadeloupe','Guatemala',
                         'Honduras','Jamaica','Mexico','Panama','Trinidad and Tobago',
                         'United States'))

St_Ame <- M_Pox%>%
  filter(location %in% c("South America", "Argentina", "Bolivia","Brazil","Chile",
                         "Colombia","Curacao",'Ecuador','Guyana','Paraguay','Peru',
                         'Uruguay','Venezuela'))
Isl <- M_Pox%>%
  filter(location %in% c("Aruba", "Bahamas","Barbados","Bermuda","Burundi"))

Un_Spe <- M_Pox%>%
  filter(location %in% c("World"))

#Average Case reported, Death Rate, New cases, Suspected cases in each region

#Average Total Cases 
Afri_TC <- mean(Afri$total_cases,na.rm = TRUE)
Asia_TC <- mean(Asia$total_cases,na.rm = TRUE)
Euro_TC <- mean(Euro$total_cases,na.rm = TRUE)
Isl_TC <- mean(Isl$total_cases,na.rm = TRUE)
Nt_Ame_TC <- mean(Nt_Ame$total_cases,na.rm = TRUE)
Ocea_TC <- mean(Ocea$total_cases,na.rm = TRUE)
St_Ame_TC <- mean(St_Ame$total_cases,na.rm = TRUE)
Un_Spe_TC <- mean(Un_Spe$total_cases,na.rm = TRUE)

Total_Cases <- c(Afri_TC,Euro_TC,Asia_TC,Isl_TC,Ocea_TC,Nt_Ame_TC,St_Ame_TC,Un_Spe_TC)

#Due to un-specified locations in the data set, the region with the most cases
#cannot be determined
#However setting aside the unidentified areas the regions of North America, South America,
#and Europe have the larges number of reported/confirmed cases(according to the dataset)

#Average Total Death 
Afri_td <- mean(Afri$total_deaths, na.rm = TRUE)
Asia_td <- mean(Asia$total_deaths, na.rm = TRUE)
Euro_td <- mean(Euro$total_deaths, na.rm = TRUE)
Isl_td <- mean(Isl$total_deaths, na.rm = TRUE)
Nt_Ame_td <- mean(Nt_Ame$total_deaths, na.rm = TRUE)
Ocea_td <- mean(Ocea$total_deaths, na.rm = TRUE)
St_Ame_td <- mean(St_Ame$total_deaths, na.rm = TRUE)
Un_Spe_td <- mean(Un_Spe$total_deaths, na.rm = TRUE)

Total_Death <- c(Afri_td,Asia_td,Euro_td,Isl_td,Nt_Ame_td,Ocea_td,St_Ame_td,Un_Spe_td)

#Large number of death recorded in North America, South America and Africa 

#Death rate is Total Cases/Total Death 
Death_R <-mutate(M_Pox,death_rate = M_Pox$total_deaths/M_Pox$total_cases*100)
Afri<- mutate(Afri,death_rate = Afri$total_deaths/Afri$total_cases*100)
Asia<- mutate(Asia,death_rate = Asia$total_deaths/Asia$total_cases*100)
Euro<- mutate(Euro,death_rate = Euro$total_deaths/Euro$total_cases*100)
Isl<- mutate(Isl,death_rate = Isl$total_deaths/Isl$total_cases*100)
Nt_Ame<- mutate(Nt_Ame,death_rate = Nt_Ame$total_deaths/Nt_Ame$total_cases*100)
Ocea<- mutate(Ocea,death_rate = Ocea$total_deaths/Ocea$total_cases*100)
St_Ame<- mutate(St_Ame,death_rate = St_Ame$total_deaths/St_Ame$total_cases*100)
Un_Spe<- mutate(Un_Spe,death_rate = Un_Spe$total_deaths/Un_Spe$total_cases*100)

MPox_Death_Rate <- Death_R

#Average Death rate
Afri_dr <- mean(Afri$death_rate, na.rm = TRUE)
Asia_dr <- mean(Asia$death_rate, na.rm = TRUE)
Euro_dr <- mean(Euro$death_rate, na.rm = TRUE)
Isl_dr <- mean(Isl$death_rate, na.rm = TRUE)
Nt_Ame_dr <- mean(Nt_Ame$death_rate, na.rm = TRUE)
Ocea_dr <- mean(Ocea$death_rate, na.rm = TRUE)
St_Ame_dr <- mean(St_Ame$death_rate, na.rm = TRUE)
Un_Spe_dr <- mean(Un_Spe$death_rate, na.rm = TRUE)

Death_Rates <- c(Afri_dr,Asia_dr,Euro_dr,Isl_dr,Nt_Ame_dr,Ocea_dr,St_Ame_dr,Un_Spe_dr)

#AFRICA WHEN COMPARED TO EUROPE HAS LESS TOTAL CASES BUT A HIGHER DEATH RATE 
#(ACCORDING TO THIS DATASET)
#This may be due to lack of proper equipment /other missing infrastructure 

#Average Suspected cases(Undocumented)
Afri_sc <- mean(Afri$suspected_cases_cumulative, na.rm = TRUE)
Asia_sc <- mean(Asia$suspected_cases_cumulative, na.rm = TRUE)
Euro_sc <- mean(Euro$suspected_cases_cumulative, na.rm = TRUE)
Isl_sc <- mean(Isl$suspected_cases_cumulative, na.rm = TRUE)
Nt_Ame_sc <- mean(Nt_Ame$suspected_cases_cumulative, na.rm = TRUE)
Ocea_sc <- mean(Ocea$suspected_cases_cumulative, na.rm = TRUE)
St_Ame_sc <- mean(St_Ame$suspected_cases_cumulative, na.rm = TRUE)
Un_Spe_sc <- mean(Un_Spe$suspected_cases_cumulative, na.rm = TRUE)

Suspected_Cases <- c(Afri_sc,Asia_sc,Euro_sc,Isl_sc,Nt_Ame_sc,Ocea_sc,St_Ame_sc,Un_Spe_sc)

#Africa has the largest amount of suspected cases, reported in the data set

M_Stat<- cbind(Death_Rates,Suspected_Cases,Total_Cases,Total_Death)
M_Stat<- data.frame(M_Stat)

#Data Visualization
barplot.default (M_Stat$Death_Rates,ylim = c(0.0,8.5),names.arg = c("Afri","Asia","Euro","Isl","Ocea","Nt_Ame","St_Ame","Un_Spe"),main = "Death Rate")

pie(x = M_Stat$Death_Rates, labels = c("Af","As","Eu","Isl","Oc","Nt_Am","St_Am","Un_Spe"), col = colors(), main = "Death Rate" )

pie(x = M_Stat$Suspected_Cases, labels = c("Af","As","Eu","Isl","Oc","Nt_Am","St_Am","Un_Spe"), col = colors(), main = "Death Rate" )

pie(x = M_Stat$Total_Cases, labels = c("Af","As","Eu","Isl","Oc","Nt_Am","St_Am","Un_Spe"), col = colors(), main = "Death Rate" )

pie(x = M_Stat$Total_Death, labels = c("Af","As","Eu","Isl","Oc","Nt_Am","St_Am","Un_Spe"), col = colors(), main = "Death Rate" )

pie_chart <- ggplot(M_Stat, aes(x = "", y = M_Stat$Death_Rates, fill = )) +
  geom_bar(stat = "identity", width = 1) + 
  coord_polar("y", start = 0) + 
  labs(title = "Death Rates") +
  theme_void()  

barplot(height = M_Stat, )
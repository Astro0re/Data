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

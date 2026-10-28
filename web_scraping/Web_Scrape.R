# Get R package
library(rvest)
library(tidyverse)
library(Hmisc)

# Save url as variable
url <- "https://webscraper.io/test-sites/pagination"

# Read HTML page
page <- read_html(url)

# Extract main section of scraping (inspect page)
data <- page %>% 
  html_nodes("main")

# for multiple items create data frame
data_scrape <- data.frame(
  description = character()
)

# Loop through for multiple inputs
for(info in data) {
  
  
  item_des <- data %>%
    html_nodes(".description")%>%
    html_text(trim=TRUE)

# add to data frame    
  data_scrape <- rbind(data_scrape, data.frame(
    description = item_des
    ))
}

print(data_scrape)
  

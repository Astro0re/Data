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
  
# for html table 
html_table()

# for multiple pages create a function for scraping of each item 

next_page <- "/"
page_count <- 1

while(!is.null(next_page) && page_count <=10)
  current_url <- paste0(url,next_page)
  message("scraping page ", page_count, " : ", current_url )

  page_scrape <- 0 #scrape_function
  # rowbind to dataset
  page_count <- page_count + 1
  
  
# reference vid url : https://www.youtube.com/watch?v=pJp1HrhWZ9E
library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")


#to select columns to keep (in parenthesis add df first to tell R where to grab 
#it)

select(surveys, plot_id, species_id,weight)


#To choose rows based on specific criteria, use filter()

filter(surveys, year ==1995)

#select is for columns and filter is for rows


#to select and filter use pipes



surveys %>%
  filter(weight < 5) %>% #keeps rows where weight is less than five
  select(species_id, sex, weight) #keeps columns with those names 






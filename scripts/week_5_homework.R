library(tidyverse)


surveys <- read_csv('data/portal_data_joined.csv') 

# Problem 1
surveys_wide <- select(surveys,genus, plot_id)

surveys_wide <- pivot_wider(names_from="genus")

 




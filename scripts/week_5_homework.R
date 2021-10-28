library(tidyverse)

surveys <- read_csv('data/portal_data_joined.csv') 

str(surveys)

# Problem 1
surveys_wide <- select(surveys, genus, plot_type, hindfoot_length);surveys_wide

surveys_wide <- surveys_wide[complete.cases(surveys_wide),]

surveys_wide

surveys_wide <- surveys_wide %>% 
  group_by(plot_type,genus) %>% 
  summarise(mean_hindfoot = mean(hindfoot_length)) ; surveys_wide


surveys_wide <- surveys_wide %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control); surveys_wide

#Problem 2

summary (surveys$weight)

#case when 

surveys_weight_cat <- surveys %>% 
  mutate(weight_cat=case_when
         (weight >= 20.00 ~ "small", weight > 20.00 & weight < 48.00 ~ "medium", weight >= 48.00 ~ "large")) ;surveys_weight_cat

surveys_weight_cat <- surveys_weight_cat[complete.cases(surveys_weight_cat),]
surveys_weight_cat


#if else 


surveys_weight_cat2 <- surveys %>% 
  mutate(weight_cat = ifelse(weight > 20.00, "small",
                              ifelse(weight > 20.00 & weight < 48.00, "medium",
                                     "large"))) ;surveys_weight_cat2





  
library(tidyverse)

surveys_t <- read_csv("data/portal_data_joined.csv"); surveys_t



surveys2 <- select (surveys_t, c('sex', 'weight', 'species_id')) ; surveys2



surveys2 <- surveys2 [complete.cases(surveys2),]; surveys2 



surveys3 <- select(filter(surveys2, weight >= 30 & weight <=60), species_id,sex,weight) ; surveys3



head(surveys3)



surveys4 <- surveys3 %>% 
              group_by(species_id, sex) %>%
              summarize(max(weight)) ; surveys4









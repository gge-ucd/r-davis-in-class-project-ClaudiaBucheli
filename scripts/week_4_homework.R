library(tidyverse)

surveys_t <- read_csv("data/portal_data_joined.csv"); surveys_t

#############    2  & 3 & 4    ##############

surveys2 <- select (surveys_t, c('sex', 'weight', 'species_id')) ; surveys2

surveys2 <- surveys2 [complete.cases(surveys2),]; surveys2 

surveys3 <- filter(surveys2, weight > 30 & weight <60) ; surveys3
head(surveys3)

biggest_critters <- surveys3 %>% 
              group_by(species_id, sex) %>%
              summarize(max(weight)) ; biggest_critters

###############    5    ###################

surveys_avg_weight <- surveys2 %>% 
              group_by(species_id, sex) %>%
              mutate (avg_weight = mean(weight)) 
surveys_avg_weight



###############    6    ###################
above_average <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight )
above_average

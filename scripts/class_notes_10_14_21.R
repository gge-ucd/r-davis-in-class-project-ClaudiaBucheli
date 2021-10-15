surveys <- read.csv('data/portal_data_joined.csv') ; surveys

library(tidyverse)


surveys_hindfoot_half <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>%
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  select(species_id,hindfoot_half) %>%
  filter(hindfoot_half < 30) ; surveys_hindfoot_half


hindfoot_half_max <- surveys_hindfoot_half %>% group_by(species_id) %>% summarise(max(hindfoot_half)) ; hindfoot_half_max


hindfoot_half_min <-surveys_hindfoot_half %>% group_by(species_id) %>% summarise(min(hindfoot_half))  ; hindfoot_half_min


hindfoot_half_mean <- surveys_hindfoot_half %>% group_by(species_id) %>% summarise(mean(hindfoot_half)) ; hindfoot_half_mean



surveys_hindfoot_half %>% group_by(species_id) %>%
  mutate(hindfoot_length = hindfoot_half * 2) %>%
  summarize(mean(hindfoot_length),min(hindfoot_length),max(hindfoot_length))









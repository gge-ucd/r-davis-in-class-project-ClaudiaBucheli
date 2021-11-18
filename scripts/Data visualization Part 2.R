library(tidyverse)

surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

#use count function to count up the year and species_id combo which provides 
#column n

yearly_counts <- surveys_complete %>% 
  count(year, species_id)
yearly_counts

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) + 
  geom_point()

ggplot(data = yearly_counts, 
       mapping = aes(x = year, y = n, groub_by = species_id)) +
  geom_line() +
  facet_wrap(~species_id,scales = 'free_y')
 #scales are all different on each plot


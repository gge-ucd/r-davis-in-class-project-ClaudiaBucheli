library(tidyverse)
library(dbplyr)

planes <- read_csv("data/nyc_13_planes.csv") %>% 
  filter(complete.cases(.)) ; planes 


weather <- read_csv("data/nyc_13_weather.csv")  %>% 
  filter(complete.cases(.)) ; weather


fsmall <- read_csv("data/nyc_13_flights_small.csv") %>% 
  filter(complete.cases(.))


combined <- left_join(fsmall, weather)


combined1 <- left_join(combined, planes) ; combined1


plot <- ggplot(data = combined1, mapping = aes(y = dep_delay , x = precip)) +
  geom_point(alpha = 0.3) +
  lm(precip ~ dep_delay)

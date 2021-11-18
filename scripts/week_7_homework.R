library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

popg <- gapminder %>% 
  select(pop, country, continent, year) %>% 
  filter(year > 2002) %>%
  pivot_wider(names_from = year, values_from = pop) %>%
  mutate(pop_dif = 2007 - 2002)

popg %>% 
filter(continent != "Oceania") %>% 
ggplot(aes(x = order_by(country), y = popg)) +
  geom_col(aes(fill = continent)) + 
  

library(tidyverse)
library (LaCroixColoR)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

popg <- gapminder %>% 
  select(pop, country, continent, year) %>% 
  filter(year >= 2002) %>%
  filter(continent != "Oceania") %>% 
  pivot_wider(names_from = year, values_from = pop) %>%
  mutate(pop_dif = `2007` - `2002`)


  ggplot(data = popg, aes(x = reorder(country, pop_dif), y = pop_dif)) +
  geom_col(aes(fill = continent)) +
  facet_wrap(~continent, scales = "free") +
  scale_y_continuous(name = 'Population growth between 2002 and 2007') +
  scale_x_discrete(name ='Countries by continent') +
  theme_grey() +
  scale_color_gradient(low="blue", high="red") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

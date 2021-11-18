library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv") %>% 
  filter(complete.cases(.))

# problem 1 

gaplifeExp <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_lifeExp = mean(lifeExp)) ; gaplifeExp

# problem 2

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + 
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed')
  theme_bw()

#a) the scale function adjusts the x axis to a logarithmic axis
#b) the geom smooth is the trend line with the black dashes and gray area
  
  
# problem 3 

  gap <- gapminder %>% 
    group_by(country, lifeExp) %>% 
    filter(row.names( Brazil, China, Niger)) %>% 
    summarise(mean_lifeExp = mean(lifeExp)) ; gap
  
  
  
  ggplot(gap, aes(x = country , y = mean_lifeExp)) +
    geom_point(aes(color = country), size = .25) + 
    geom_smooth() +
    theme_bw()
    
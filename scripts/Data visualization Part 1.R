###GG Plot and Data visualization

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))
 
#Gives you blank canvas
ggplot(data = surveys)

#Blank canvas with axes
ggplot(data = surveys, mapping = aes(x= weight, y = hindfoot_length))

# Add in geom for shape 
ggplot(data = surveys, mapping = aes (x = weight, y = hindfoot_length)) +
  geom_point()

#create an object so we don't have to rewrite 

base_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length))
base_plot 

base_plot + geom_point()

#adding plot elements- transparency = alpha, color = color, infill = fill 

base_plot +geom_point(alpha = 0.2)
base_plot + geom_point(color = "blue")
base_plot + geom_point(color="blue", alpha = 0.3)


#color by a categorical variable in the data
#species id is an additional variable where color will be added to specify the 
#species

ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(mapping = aes(color = species_id))

#geom_boxplot 

ggplot(data = surveys, mapping = aes (x = species_id, y = weight)) + geom_boxplot()

base_plot2 <- ggplot(data = surveys, mapping = aes(x = species_id, y = weight))
base_plot2 +
  geom_boxplot(color = "purple") +
  geom_point()

base_plot2+
  geom_boxplot()+
  geom_jitter(alpha = 0.3)
#Jitter spreads out data 

base_plot2+
  geom_boxplot()+
  geom_jitter(alpha = 0.3, mapping = aes(color = species_id))

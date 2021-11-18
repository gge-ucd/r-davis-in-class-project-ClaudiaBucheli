library(tidyverse)
surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

plot <- ggplot(data = surveys_complete, mapping = aes(y = weight, x = species_id)) +
  geom_point(alpha = 0.5, aes(color = plot_type))

plot

plot2<- ggplot(data = surveys_complete,
       mapping = aes(y = weight, x = plot_type)) +
  geom_point(alpha = 0.5, aes(color = species_id)) ;plot2

plot3<- ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_point() +
  facet_wrap(~plot_type) ; plot3

plot4 <- ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_point() +
  theme_classic(); plot4

plot5 <- ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_jitter(mapping = aes(color = plot_type)) : plot5

plot6 <- ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_violin() +
  theme_classic(); plot6

plot7 <- ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_violin() +
  theme_classic(); plot7 #ignore this one 

plot6.1 <-plot6 %>% 
  scale_y_log10() ; plot6.1

plot6.2 <- ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_violin(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") ; plot6.2

# adding violin
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1, color = "tomato") +
  geom_violin(alpha = 0)

# adding
base <- ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight))

base +
  geom_jitter(alpha = .1) +
  geom_violin() +
  scale_y_log10()

?scale_y_log10

# Make a new plot to explore the distrubtion of hindfoot_length just for species NL and PF. Overlay a jitter plot of the hindfoot lengths of each species by a boxplot. Then, color the datapoints according to the plot from which the sample was taken.


surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_id))

# plotis is numeric but want it to be categorical

hindfoot_survey <- surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF")

hindfoot_survey$plot_factor <- as.factor(hindfoot_survey$plot_id)

ggplot(data = hindfoot_survey,
       mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor))


surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  mutate(plot_factor = as.factor(plot_id)) %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor))



surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = as.factor(plot_id)))


ggplot(data = surveys_complete,
       mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1,
              mapping = aes(as.factor(plot_id))) +
  geom_violin(alpha = 0)


labs(x = "Species ID", y= "Hindfoot Length", title = "Boxplot")

surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = as.factor(plot_id))) +
  labs(x = "Species ID",
       y = "Hindfoot Length",
       title = "Boxplot",
       color = "Plot ID") +
  theme_classic() +
  theme()

              
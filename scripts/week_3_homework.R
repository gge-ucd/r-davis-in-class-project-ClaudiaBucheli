#####Packages######
library(tidyverse)

surveys_t <- read.csv("data/portal_data_joined.csv");surveys_t


surveys_base <- surveys_t[c("species_id","weight","plot_type")];surveys_base


surveys_base <- surveys_base[1:60,]; surveys_base


surveys_base$species_id <- as.character(surveys_base$species_id)

surveys_base$plot_type <- as.character(surveys_base$plot_type)

surveys_base <- surveys_base[complete.cases(surveys_base),];surveys_base

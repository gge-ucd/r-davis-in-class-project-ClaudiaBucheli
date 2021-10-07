####Packages#####
library(tidyverse)

#Reading in Data#

surveys <- read.csv("data/portal_data_joined.csv")

#Inspecting data#

# Number of rows:

nrow(surveys)

#Number of columns 

ncol(surveys)

#Look at the top or bottom of the data

head(surveys)
tail(surveys)

#Look at data in its entirety

View(surveys)

#More about the data

str(surveys)

#Indexing 

#Inside brackets [row, column]

surveys [1,1]

surveys[1:6,]

#subset with column name

surveys["species_id"]
colnames(surveys)

install.packages("tidyverse")
# load a package into a session





surveys_t <- read_csv("data/portal_data_joined.csv")
surveys_t


class(surveys_t)


surveys[,1]
surveys_t[,1]
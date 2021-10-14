###New Spreadsheets

surveys <- read.csv("data/portal_data_joined.csv") ; surveys

head(surveys)
tail(surveys)
 
nrow(surveys)
ncol(surveys)

View(surveys)
colnames(surveys)
rownames(surveys)

str(surveys) ##All string functions work on characters and vectors 

class(surveys)

head(surveys, )

head(surveys, n=10)

head(surveys, n=1)

summary(surveys)#### DO THIS FIRST ####

surveys[1,2] ###REMEMBER ITS ROW,COLUMN###

surveys$species  ###Use dollar sign to call up a column name###

unique(surveys$species)

length(unique(surveys$species))

table(surveys$species)

sum(!duplicated(surveys$species))

#Levels as a way to identify unique characters

levels(surveys$species)

surveys_200 <- surveys[200,]
surveys_200

tail(surveys)

surveys_last <- surveys[34786,] ; surveys_last

surveys_middle <- surveys[17393,] ; surveys_middle

surveyshead <- surveys[-(7:nrow(surveys)),]
surveyshead ### negative means I do NOT want rows 7 through n row or 34786 or whatever it s
#comma nothing means give me all the columns 


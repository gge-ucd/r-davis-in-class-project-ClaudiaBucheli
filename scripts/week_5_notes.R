library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

#two ways to do the same thing 


filter(surveys, weight > 30 & weight <60 )


surveys %>% filter(weight > 30 &weight <60)


surveys %>% filter(weight > 30 &weight <60) %>% head()


surveys %>% filter(weight > 30 & weight <60) %>% head(n=300,13)

#to specify number of rows you see, do n= after the head function if you want 
#to see the top n number of rows

surveys %>% filter(weight > 30 &weight <60) %>% head(n=20,13)


biggest_critters <- surveys %>%
  filter(!is.na(weight) & !is.na(sex) & !is.na(species)) %>%
  group_by(species, sex) %>%
  summarize(maximum_weight = max(weight))
biggest_critters


surveys %>%
  filter(is.na(hindfoot_length)) %>% 
  group_by(species_id) %>%
  tally()

?tally #reduces data down to the column you grouped by so it can be a dead end

#another way if you wanted to keep going : 

surveys %>%
  filter(is.na(hindfoot_length)) %>%
  group_by(species) %>%
  summarize(count = n(), mean = mean(weight, na.rm = T))
            
 # saw use of sum(is.na()) for certain columns
  sum(is.na(surveys$weight))
            
# colSums(is.na())

colSums(is.na(surveys))


#conditional statement 

surveys %>%
  filter(!is.na(weight))%>%
  mutate(weight_cat = case_when(weight > mean(weight) ~ "big",
                                weight < mean(weight) ~ "small"))



# Using the iris data frame (this is built in to R), create a new variable 
#that categorizes petal length into three groups:
#small (less than or equal to the 1st quartile)
#medium (between the 1st and 3rd quartiles)
#large (greater than or equal to the 3rd quartile)
#Hint: Explore the iris data using summary(iris$Petal.Length), to see the petal
#length distribution. Then use your function of choice: ifelse() or case_when() to 
#make a new variable named petal.length.cat based on the conditions listed above. 
#Note that in the iris data frame there are no NAs, so we don’t have to deal with #them here.
 

data(iris) ; iris 


summary(iris)

# if the first statement is true, small, then go to nested. if nested is true, 
#go to large and if still not true, go to medium



iris %>%
  mutate(length_cat = ifelse(Petal.Length <= 1.6, "small",
                             ifelse(Petal.Length >= 5.1, "large",
                                    "medium")))
# if the first statement is true, small, then go to nested. if nested is true, 
#go to large and if still not true, go to medium

iris %>%
  mutate(length_cat = case_when(Petal.Length <= 1.6 ~ "small",
                                Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium",
                                Petal.Length > 5.1 ~ "large"))

iris %>%
   mutate(length_cat = case_when(Petal.Length <= 1.6 ~ "small",
                                Petal.Length > 1.6 & Petal.Length < 5.1 ~ "medium",
                                Petal.Length > 5.1 ~ "large"))



surveys = read_csv('data/portal_data_joined.csv')
tail_length = read_csv('data/tail_length.csv')


str(tail_length)
str(surveys)

#prints out a vector where the colnames intersect
intersect(colnames(surveys),colnames(tail_length))

combo_dataframe = left_join(surveys,tail_length)
str(combo_dataframe)


piv_surveys <- surveys %>% group_by(year,plot_id) %>% tally() ; piv_surveys


surveys %>% group_by(plot_id,year) %>% summarize(n_distinct(genus))

?n_distinct
?dim
?str


            
            
            
            
            




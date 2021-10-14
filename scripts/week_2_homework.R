set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

########## Problem 1 ##########
hw2<- na.omit(hw2)
hw2
prob1<- hw2[hw2 >=14 & hw2 <=38]
prob1

########## Problem 2 ##########

times3 <- prob1*3
times3
plus10 <- times3 + 10
plus10

######### Problem 3 ###########

final<- plus10[c(TRUE, FALSE)]
final


############# seq function seq() generates regular sequences  from a certain 
##value to another value skipping by a certain number seq(from =1, to = 23, by = 2)


###other example seq(1,23,2) which is the same as above 


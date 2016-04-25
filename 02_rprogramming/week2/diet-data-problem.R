#url for practice https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmdgetwd()

#store dataset in the desired location and move to that location
getwd()
setwd("/Users/johnkoretoff/datascience/jhudss/02_rprogramming/week2")

#view files in the dataset 
list.files("diet_data")

#view contents of files
andy <- read.csv("diet_data/Andy.csv")
head(andy)

#determine the rows in set
length(andy$Day)

#observe the dimensions in the set
dim(andy) #30 rows and 4 columns

#get a quick overview of the data
str(andy)
summary(andy)
names(andy)

#check the dimensions of all data to see if they fit

#look at Andy's starting weight
andy[1, "Weight"]

#look at Andy's final weight
andy[30, "Weight"]

#other methods for looking at final weight
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

#or use subset()
subset(andy$Weight, andy$Day==30)

#assignment of starting and ending weight vectors
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

#track and print how much weight Andy lost
andy_loss <- andy_start - andy_end
andy_loss

#back to the data - stored in alpha order - we will put it in a variable
files <- list.files("diet_data")
files




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

#subset files bc we know they are in alphabetical order
files[1]
files[2]
files[3:5]

#look at John's data
#head(read.csv(files[3])) returns an error so we edit the code

#edited
files_full <- list.files("diet_data", full.names=TRUE)
files_full

#now try looking at John again
head(read.csv(files_full[3]))

#now we make a massive frame with rbind and a loop
andy_david <- rbind(andy, read.csv(files_full[2]))

#check the code
head(andy_david)
tail(andy_david)

#observe the 25th day for Andy and David
day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

#now we build the loop - test - we will run this through all the data
for (i in 1:5) {print(i)}

#apply the loop to all our files - error - can't rbind() something that DNE
#for (i in 1:5) {
#      dat <- rbind(dat, read.csv(files_full[i]))
#}

#therefore, we create an empty data frame
dat <- data.frame()
for (i in 1:5) {
      dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
#note, dat cannot go inside the loop bc we will only be returned the last file

#now we find the median weight of the entire "dat" frame
median(dat$Weight)
#woah! we had an na...... have to fix that

#problem. solved.
median(dat$Weight, na.rm = TRUE)

#find the mean weight of day 30
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight, na.rm = TRUE)

#build a function that will return a median weight on a given day
#weightmedian <- function(directory, day) { # content of the function }

#need to put the data in one frame - use list.file() and rbind()
#run loop through
weightmedian <- function(directory, day)  {
      files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
      dat <- data.frame()                             #creates an empty data frame
      for (i in 1:5) {                                
            #loops through the files, rbinding them together 
            dat <- rbind(dat, read.csv(files_list[i]))
      }
      dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
      median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
      #while stripping out the NAs
}

#test for above
weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)

#REVIEW THE LAST PORTION OF THIS EXAMPLE FOR MORE SOPHISTICATED APPROACH
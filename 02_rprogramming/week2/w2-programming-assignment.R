#store dataset in the desired location and move to that location
getwd()
setwd("/Users/johnkoretoff/datascience/jhudss/02_rprogramming/week2")

#view files in the dataset 
list.files("spec_data")

#edited
files_full <- list.files("spec_data", full.names=TRUE)
files_full

#checkout the header
head(read.csv(files_full[1]))

#determine the rows in set
length(read.csv(files_full[1]))

#observe the dimensions in the set
dim(read.csv(files_full[1])) #1461 rows and 4 columns

#get a quick overview of the data
str(read.csv(files_full[1]))
summary(read.csv(files_full[1]))
names(read.csv(files_full[1]))

#create an empty data frame
dat <- data.frame()
for (i in 1:332) {
      dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
#tail(dat) #to check the data

#check sulfate and nitrate medians
median(dat$sulfate, na.rm = TRUE)
median(dat$nitrate, na.rm = TRUE)

## PART ONE - WRITE A FUNCTION TO FIND THE MEAN ##
pollutantmean <- function(directory, id, pollutant)  {
      files_list <- list.files(directory, full.names = TRUE)   #creates a list of files
      dat <- data.frame() #creates an empty data frame
      for (i in 1:4) {                                
            #loops through the files, rbinding them together 
            dat <- rbind(dat, read.csv(files_list[i]))
      }
      dat_subset <- dat[(dat[, "ID"] %in% id),]  #subsets the rows that match the 'id' argument
      mean(dat_subset[, "sulfate"], na.rm = TRUE)
}
pollutantmean(directory = "spec_data", id = 1:4)
pollutantmean("spec_data", 4)
pollutantmean("spec_data", 3)
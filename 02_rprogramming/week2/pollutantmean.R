#store dataset in the desired location and move to that location
getwd()
setwd("/Users/johnkoretoff/datascience/jhudss/02_rprogramming/week2")

#view full file names in data set
files_full <- list.files("spec_data", full.names=TRUE)
files_full

#create an empty list that stores length of output
summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

#read the csv files into the list
#each element of the list is a dataframe with one csv
for (i in seq_along(files_full)) {
      tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

#create a single data frame with do.call()
#do.call(function_you_want_to_use, list_of_arguments)
output <- do.call(rbind, tmp)
#str(output)

#create function
pollutantmean <- function(directory, pollutant, id = 1:332) {
      files_list <- list.files(directory, full.names = TRUE)
      output_subset <- output[(output[, "ID"] %in% id),]
      if(pollutant == "sulfate") {
            mean(output_subset[,"sulfate"], na.rm = TRUE)
      } else if(pollutant == "nitrate") {
            mean(output_subset[,"nitrate"], na.rm = TRUE)
      } 
}

#test
pollutantmean("spec_data", "sulfate", 1:10)
pollutantmean("spec_data", "nitrate", 70:72)
pollutantmean("spec_data", "nitrate", 23)

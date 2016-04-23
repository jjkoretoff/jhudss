# Function 1
add2 <- function (x, y) {
  x + y
}
add2(2, 3)

# Function 2
above10 <- function(x) {
  use <- x > 10
  x[use]
}
x <- 1:20
above10(x)

# Function 3, n = 10 gives spec default for user 
above <- function(x, n = 10) {
  use <- x > n
  x[use]
}
x <- 1:20
above(x, 11)

# Function 4
colmean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}
colmean(airquality)
# F4 calculates the means for each column
# in the airquality dataset by using a 
# for loop to cycle through each column
# and return its mean and remove NAs
# enables the program to calculate the vals


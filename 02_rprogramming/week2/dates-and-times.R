# dates and times
# represented by Date class
# times rep by POSIXct or POSIXlt class
# date format: 1970-01-01 - days since 
# time format: 1970-01-01 - seconds since

# example
x <- as.Date("1970-01-01")
x # not actually a character string

unclass(x) # prints as 0 because it is "days since"

unclass(as.Date("1970-01-02"))

# POSIX - family of computing standard
# POSIXct - large integers for times (usefull for data frame)
# POSIXlt - stores times as list and day of week, year, month

# example
x <- Sys.time() #current time
x 

p <- as.POSIXlt(x) #converted time

names(unclass(x))

p$sec 

# example
x <- Sys.time()
x #already in POSIXct format

unclass(x)

p <- as.POSIXlt(x)
p$sec

# converting date strings to objects
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

class(x)

#example - make sure they are the same type of object
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")

x <- as.POSIXlt(x)
x - y

# example - leap year
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x - y

# example - timezones
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz ="GMT")

y - x

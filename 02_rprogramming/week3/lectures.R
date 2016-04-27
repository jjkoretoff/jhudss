#loop functions
#lapply(), sapply(), apply(), tapply(), mapply()
#auxillary function split() - work with lapply()

#lapply() takes 3 arguments - a list. a funcition. other arguments.
#example
#lapply always returns a list

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

#returns mean of first and second elements

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100, 5))

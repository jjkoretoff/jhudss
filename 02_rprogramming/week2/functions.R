# basics, lexical scoping, example

# argument matching
mydata <- rnorm(100)
# all options below are equivalent ouputs for mydata
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

# mix postional matching
args(lm)
function (formula, data, subset, weights, na.action,
         method = "qr", model = TRUE, x = FALSE, 
         y = FALSE, qr = TRUE, singular.ok = TRUE,
         contrasts = NULL, offset, ...)
# call the funciton above = equivalent
lm(data = mydata, y - x, model = FALSE, 1:100)
lm(y - x, mydata, 1:100, model = FALSE)

# defining a function
f <- function(a, b = 1, c = 2, d = NULL) {
  
}

# lazy evaluation - arguments evaluated as needed
f <- function(a, b) {
  a ^ 2
}
f(2)

# lazy evaluation 2
f <- function(a, b) {
  print(a)
  print(b)
}
f(45, 32)

# "..." argument - variable number of arguments and leaves defaults
my_plot <- function(x, y, type = "1", ...) {
   plot(x, y, type = type, ...)
}

# "..." for generics - dispatch methods

# must explicitly name after "..."
args(paste)
function(..., sep = " ", collapse = NULL)

paste("a", "b", sep = ":")

# scoping rules - bind value to symbol
lm <- function(x) {x * x}
lm(2)

# lexical scoping - z is a free variable 
z <- 1

f <- function(x, y) {
   x ^ 2 + y / z
}
f(2, 4)

# lexical scoping - the values of free variables are serached
# for in the environment in which the function was defined

# defining a function inside a function
make.power <- function (n) {
  pow <- function(x) {
    x ^ n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

# exploring the function environment - extentsion of example above
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))

# example
y <- 10

f <- function(x) {
  y <- 2
  y ^ 2 + g(x)
}

g <- function(x) {
  x * y
}

f(3)

# example
y <- 3

g <- function(x) {
  a <- 3
  x + a + y
}

g(2)

# python, scheme, perl, common lisp support lexical scoping
# in R, all objects must be stored in memory



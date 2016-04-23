x0 <- 1
tol <- 1e-8

repeat {
  x1 <- computeEstimate()
  
  if(abs(x1 - x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

# better to use loops with hard limit and algo

# NEXT
for(i in 1:100) {
  if( i <= 20) {
    # skip the first 20 iterations
    next
  }
  # do something
}
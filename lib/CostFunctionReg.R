CostFunction <- function(X, y, Theta, Lambda){
  Hypothesis <- 1 / (1 + exp(- X %*% Theta)) # probability that y = 1 on input X
  J <- (1/m) * sum(- y * log(Hypothesis) - (1 - y) * log(1 - Hypothesis)) # compute J cost
  reg <- (Lambda / (2 * m)) * sum(Theta[2:length(Theta)] ^ 2)
  J <- J + reg
  return(J)
}
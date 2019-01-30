GradFunction <- function(X, y, Theta, Lambda){
  m <- length(y)
  Hypothesis <- 1 / (1 + exp(- X %*% Theta))
  Grad <- ((t(X) %*% (Hypothesis - y)) / m) + ((Lambda / m) * c(0,Theta[2:length(Theta)]))
  return(Grad)
}
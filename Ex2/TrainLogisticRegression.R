source("../Ex2/GradFunction.R")
source("../Ex2/CostFunction.R")

TrainLogisticReg <- function(X, y, Lambda){
  
  ifelse(is.vector(X), initial_theta <- c(0,0), initial_theta <- rep(0, ncol(X))) # initialize theta
  ifelse(is.vector(X), m <- length(X), m <- nrow(X))
  assign("m", m, .GlobalEnv)
  
  CostFunction(X,y,initial_theta,0)
  LogisticRec <- optim(par = initial_theta,
                       fn = CostFunction,
                       gr = GradFunction,
                       method = "BFGS",
                       X = X,
                       y = y,
                       Lambda = Lambda)
  
  
  print(paste("J", LogisticRec$value))
  return(LogisticRec$par)
}
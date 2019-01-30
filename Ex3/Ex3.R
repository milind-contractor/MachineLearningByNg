library(R.matlab)

source("../Ex2/CostFunction.R")
source("../Ex2/GradFunction.R")

# Test Script for CostFunction Expected Answere = 2.534819
theta_t <- c(-2, -1, 1, 2)
X_t <- as.matrix(cbind(1, matrix(1:15, 5,3)/10))
y_t <- c(1, 0, 1, 0, 1) >= 0.5
lambda_t <- 3
CostFunction(X_t, y_t, theta_t, lambda_t)


#GradFunction(X_t,  y_t, theta_t, lambda_t)
#[,1]
#[1,]  0.1465614
#[2,] -0.5485584
#[3,]  0.7247223
#[4,]  1.3980030
GradFunction(X_t, y_t, theta_t, lambda_t)

ds_data <- readMat("ex3data1.mat")
ds_weight <- readMat("ex3weights.mat")

X <- as.matrix(ds_data$X)
X <- cbind(1, X)
y <- as.vector(ds_data$y)

theta1 <- as.matrix(ds_weight$Theta1)
theta2 <- as.matrix(ds_weight$Theta2)
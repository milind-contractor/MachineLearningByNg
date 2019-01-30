library(ggplot2)

source("TrainLogisticRegression.R")
source("CostFunction.R")
source("BoundaryPoints.R")

# Build Logistic Regression Model.
# Read Data from File provide as part of Ex2
ex2data2 <- read.csv("ex2data2.txt", header = FALSE)
names(ex2data2) <- c("Microchip_Test_1", "Microchip_Test_2", "Test")

X <- ex2data2[ , -3]
y <- ex2data2[ , 3]

plot(X$Microchip_Test_1, X$Microchip_Test_2, 
     col= as.factor(y), 
     pch= 20,
     main= "Training data: in red success test, in black failure")

X_poly <- mapFeature(X[ ,1], X[ ,2], 6)

m <- nrow(X_poly)

# testing
CostFunction(as.matrix(X_poly),y, rep(0, ncol(X_poly)), 1)
CostFunction(as.matrix(X_poly), y, rep(1, ncol(X_poly)),10)  

lambda0 <- TrainLogisticReg(as.matrix(X_poly), y, 0)

lambda0_boundary <- boundary_fct(lambda0)

plot <- ggplot(ex2data2, aes(x= Microchip_Test_1, y= Microchip_Test_2))+
  geom_point(aes(colour= as.factor(Test)))+
  xlab("Microchip test 1")+
  ylab("Microchip test 2")+
  theme_bw()


plot + geom_contour(data = lambda0_boundary, aes(x = u, y = v, z = z), bins= 1) + 
  ggtitle("Lambda 0")

lambda1 <- TrainLogisticReg(as.matrix(X_poly), y, 1)

lambda1_boundary <- boundary_fct(lambda1)

plot + geom_contour(data = lambda1_boundary, aes(x = u, y = v, z = z), bins= 1) + 
  ggtitle("Lambda 1")


lambda100 <- TrainLogisticReg(as.matrix(X_poly), y, 100)

lambda100_boundary <- boundary_fct(lambda100)
plot + geom_contour(data = lambda100_boundary, aes(x = u, y = v, z = z), bins= 1) + 
  ggtitle("Lambda 100")

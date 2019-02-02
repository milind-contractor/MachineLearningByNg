library(ggplot2)

source("./lib/TrainLogisticRegression.R")

# Build Logistic Regression Model.
# Read Data from File provide as part of Ex2
data.ExamScore = read.csv("./Ex2/ex2data1.txt", header = FALSE)
names(data.ExamScore) <- c("Ex1", "Ex2","Admission")


x = as.matrix(data.ExamScore[,1:2])
y = as.matrix(data.ExamScore[[3]])

m <- nrow(x)
X= cbind(1, x)
Lambda=0

theta_result <- TrainLogisticReg(X, y, 0)

ggplot(data.ExamScore, aes(x = Ex1 , y= Ex2, color = as.factor(y) ))  + 
  geom_point( shape = 1, size = 2.5) + geom_abline(slope = (-theta_result[2] / theta_result[3]), intercept = (-theta_result[1] / theta_result[3]), colour= "red", size=1)



library(epicalc)
##Linear Regression
setwd("/Users/amutuku/Documents/markdown_file/R pwani.")
Smoking<-read.csv("data/Smoking.csv", header=T)
des(Smoking)
summ(Smoking)

##Scatter plot
plot(Smoking$smoke, Smoking$log.deaths, xlab="Smoking", ylab="Logarithm of deaths",
     main="Logarithm of deaths by smoking status")

##Linear Regression
model1<-lm(Smoking$log.deaths ~ Smoking$smoke)
summary(model1)
##Adding the regression line to the scatter plot
abline(model1)
hist(residuals(model1))
qqnorm(residuals(model1))
shapiro.test(residuals(model1))
plot(fitted(model1), residuals(model1),xlab="Fitted values")
plot(fitted(model1), residuals(model1),xlab="Fitted values", type="n")
text(fitted(model1), residuals(model1), labels=as.character(Smoking$day))
abline(h=0, col="blue")

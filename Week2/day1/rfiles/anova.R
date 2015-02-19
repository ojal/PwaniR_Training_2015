library(epicalc)
library(foreign)
library(Hmisc)
library(ggplot2)
setwd("/Users/amutuku/Documents/markdown_file/R pwani.")
data<-read.csv("data/systolic.csv", header=T)
data$drug<-as.factor(data$drug) #
data$disease<-as.factor(data$disease) #
data
str(data)
summ(data$systolic, by=data$drug)  #Summarizing the data by the treatment group
table(data$systolic, data$drug)
ggplot(data, aes( drug, systolic )) + geom_boxplot() + theme_bw()
       
       ##################################################

##ANOVA

one.way<-aov(data$systolic~data$drug)
one.way                      ##gives the degrees of freedom and the sum of squares, the estimated treatments may be of unequal replication
summary(one.way)      	##gives the full anova table. check on the F_statistic and assess whether it's significant.
###rejecting the null indicates a significant difference in means amongst the different groups


print(model.tables(one.way,"means"),digits=3)       #report the means and the number of subjects/cell
oneway.test(data$systolic~data$drug, var.equal = TRUE)
plot1<-plot(one.way, pch=16) ##gives the various plots on the residuals, normality etc

##Linear Regression
setwd("/Users/amutuku/Documents/markdown_file/R pwani.")
Bloodloss<-read.csv("data/Bloodloss.csv", header=T)
des(Bloodloss)
summ(Bloodloss)

##Scatter plot
plot(Bloodloss$worm, Bloodloss$bloodloss, xlab="No. of worms", ylab="ml.per day",
     main="Blood loss by number of hookworms in the bowel",type="n")
## "n"-tells R not to plot anything to allow for id plotting. 

text(Bloodloss$worm, Bloodloss$bloodloss, labels=Bloodloss$id)

##Linear Regression
model1<-lm(Bloodloss$bloodloss ~ Bloodloss$worm)
summary(model1)
##Adding the regression line to the scatter plot
abline(model1)
points(Bloodloss$worm, fitted(model1),pch=18,col="blue")
segments(Bloodloss$worm,Bloodloss$bloodloss,Bloodloss$worm, fitted(model1), col="green")
residuals(model1)  
hist(residuals(model1))
qqnorm(residuals(model1))
shapiro.test(residuals(model1))
plot(fitted(model1), residuals(model1),xlab="Fitted values")
plot(fitted(model1), residuals(model1),xlab="Fitted values", type="n")
text(fitted(model1), residuals(model1), labels=as.character(Bloodloss$id))
abline(h=0, col="blue")



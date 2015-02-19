library(epicalc)
library(foreign)
library(Hmisc)
setwd("/Users/amutuku/Documents/markdown_file/R pwani.")
data<-read.csv("data/Anova1.csv", header=T)
data$Treatment<-as.factor(data$Treatment) #
data
str(data)
summ(data$Scores, by=data$Treatment)  #Summarizing the data by the treatment group
plot(data)  # side by side box plots
##################################################

##ANOVA

one.way<-aov(data$Scores~data$Treatment)
one.way                      ##gives the degrees of freedom and the sum of squares, the estimated treatments may be of unequal replication
summary(one.way)    		##gives the full anova table. check on the F_statistic and assess whether it's significant.
###rejecting the null indicates a significant difference in means amongst the different groups


print(model.tables(one.way,"means"),digits=3)       #report the means and the number of subjects/cell
oneway.test(data$Scores~data$Treatment, var.equal = TRUE)
plot1<-plot(one.way, pch=16) ##gives the various plots on the residuals, normality etc


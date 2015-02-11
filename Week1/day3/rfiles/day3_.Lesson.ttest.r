# The data used here is for Statistics One Course by Prof Andrew Conway, 2013, Lab 8 (https://www.coursera.org/course/stats1)


#goals
# One sample t test
#   Dependent t-tests
#   Independent t-tests

# Example Data explanation

#  Working memory training experiment (N = 120)
#  The dependent variable (DV) is number of items answered correctly on an intelligence test
#  There are three independent variables:
#    Time (2 levels): pre and post training
#    Training (2 levels): training (1) and control (0) (n.training = 80, n.control = 40)
#    Training sessions (4 levels): 8, 12, 17, 19 (for each, n = 20)



#-------------------------------------------------------------------------

# Load packages
#install.packages(psych)
library(psych)
library(ggplot2)

#single t test
babies <- rnorm(141, mean = 3.01 , sd=0.475)
mean(babies)
sd(babies)

#create your own function if it doesnt exist - se=sd/sqrt(n)
stderr <- function(x) sd(x)/sqrt(length(x))
stderr(babies)

t.test(babies , mu = 3.25 )


#for Depedent and Indpedent load the data into R

# Read data into a dataframe called wm
wm <-  read.csv("data/training.csv", header = T)


# Summary statistics by all groups (control, 8 sessions, 12 sessions, 17 sessions, 19 sessions)
describeBy(wm, wm$cond)

# Create two subsets of data: One for the control group and another for the training groups
wm.c <- subset(wm, wm$train == "0")
wm.t <-  subset(wm, wm$train == "1")

# Dependent t-tests
# First, compare pre and post scores in the control group
t.test(wm.c$post, wm.c$pre, paired = T)

# Next, compare pre and post scores in the training groups
t.test(wm.t$post, wm.t$pre, paired = T)
 

  
# Independent t-test
# Compare the gain scores in the control and training groups 
t.test(wm$gain ~ wm$train, var.equal = T)


# Boxplot
ggplot(wm, aes(x=as.factor(train), y=gain)) +   geom_boxplot() +  guides(fill=FALSE)
  
# To compare the gain scores across all groups, use ANOVA

aov.model = aov(wm.t$gain ~ wm.t$cond)
summary(aov.model)

# Save results in a table to illustrate calculation of effect size
aov.table = summary(aov.model)

# Effect size for ANOVA
ss = aov.table[[1]]$"Sum Sq"
eta.sq = ss[1] / (ss[1] + ss[2])
eta.sq
#or
etaSquared(aov.model, anova=T)



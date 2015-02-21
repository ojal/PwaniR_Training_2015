##########Calculation of the CI from a given dataset
install.packages("epicalc")
library(epicalc) #epdim* packages (ci, sd, )

#read data

maltreat<-read.csv("data/maltreat.csv")
names(maltreat)
##describe the maltreat data set
str(maltreat) 

##inspect the pcv variable for missing,maximum,minimum etc
summary(maltreat$pcv)
View(maltreat)

##identify values out of range(note:normal pcv=35% in children)
library(ggplot2)
ggplot(maltreat , aes(pcv, pcv)) + geom_boxplot() + theme_bw()

##check the distribution of pcv
hist(maltreat$pcv, freq=F)
lines(density(maltreat$pcv))

##descriptive statistics for pcv
summary(maltreat$pcv)


##se(mean) of 670 obs
#confint(maltreat$pcv,level=0.90)
ci(maltreat$pcv,alpha=0.10)

#confint(maltreat$pcv,level=0.95)
ci(maltreat$pcv,alpha=0.05)

#confint(maltreat$pcv,level=0.99)
ci(maltreat$pcv,alpha=0.01)


mean(maltreat$pcv)


##analysis of first 60 obs
maltreat.60 <- maltreat[1:60,]
ci(maltreat.60$pcv,alpha=0.05)
mean(maltreat.60$pcv)


#do a ci for heartrate
ci(maltreat$heartrate,alpha=0.01)
ci(maltreat$heartrate,alpha=0.05)
ci(maltreat$heartrate,alpha=0.1)

#do a ci for resprate
ci(maltreat$resprate,alpha=0.01)
ci(maltreat$resprate,alpha=0.05)
ci(maltreat$resprate,alpha=0.1)





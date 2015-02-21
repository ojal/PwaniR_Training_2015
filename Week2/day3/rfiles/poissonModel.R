hospitalData <- read.csv("data/hospital_visits.csv")
names(hospitalData)
dim(hospitalData)
hospitalData$num2 <- as.factor(hospitalData$num)
str(hospitalData)
table(hospitalData$num2)
head(hospitalData)
table(hospitalData$target)

#distribution check
library(ggplot2)
ggplot(hospitalData, aes(num)) + geom_density() +
  theme_bw() + ggtitle("distribution of num")

#poission model
poisoModel <- glm(num~ coop+target , 
                  data =hospitalData, 
                  family = poisson(link="log") )
summary(poisoModel)

exp(coef(poisoModel))
exp(confint(poisoModel))

library(qcc)
qcc.overdispersion.test(hospitalData$num, 
                        type="poisson")

poisoModelQuasi <- glm(num~ coop+target , 
                  data =hospitalData, 
                  family = quasipoisson(link="log") )
summary(poisoModelQuasi)


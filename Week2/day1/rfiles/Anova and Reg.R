           # ANOVA -Practical# 
# Inputting sample data 
Drug=rep(c("memory drug", "placebo", "No treatment"),5)
Scores=c(70,37,3,77,43,10,83,50,17,90,57,23,97,63,30)
Colnames=c("Drug","Scores")
A =data.frame(Drug,Scores)
plot(A)
B=aov (A$Scores~A$Drug)
summary(B)
plot(B) 





# Loading  the data "cars"  from the data set in R 
plot(cars$speed~cars$dist, pch=16,main = "SST")
abline(mean(cars$speed),0) #grandmean
for(i in 1:130) lines(c(cars$dist[i],cars$dist[i]),c(mean(cars$speed),cars$speed[i]),lty=2)
model<-lm(cars$speed~cars$dist)
summary(model)
abline(lm(cars$speed~cars$dist)) ##alternative
yhat<-predict(model)
yhat
data.frame(yhat)
plot(cars$speed~cars$dist,pch=16,main="SSE")
abline(model) 
for(i in 1:130) lines(c(cars$dist[i],cars$dist[i]),c(cars$speed[i],yhat[i]),lty=2)
plot(cars$speed~cars$dist,pch=16,main="SSR")
abline(mean(cars$speed),0,lty =2)
model<-lm(cars$speed~cars$dist)
abline(model)
for(i in 1:130) lines(c(cars$dist[i],cars$dist[i]),c(mean(cars$speed),predict(model)[i]))

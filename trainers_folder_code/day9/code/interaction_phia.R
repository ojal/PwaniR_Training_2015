install.packages("phia")
library(phia)
help(phia)
some(Boik)
mod.boik <- lm(edr ~ therapy+medication+therapy*medication, data=Boik)
summary(mod.boik)

data.logistic = data.frame(gender=rep(c("Male","Female"),c(6,6)), dept=rep(LETTERS[1:6],2),yes=c(512,353,120,138,53,22,89,17,202,131,94,24),no=c(313,207,205,279,138,351,19,8,391,244,299,317))
mod.form = "cbind(yes,no) ~ gender * dept"
glm.out = glm(mod.form, family=binomial(logit), data=data.logistic )
summary(glm.out)
exp(coef(glm.out))  

#MANTEL HANSEL ANALYSIS
mymatrix1 <-matrix(c(400,340,200,190),nrow=2,byrow=TRUE) 
colnames(mymatrix1) <- c("Disease","Control") 
rownames(mymatrix1) <- c("Exposure","Unexposed") 
print(mymatrix1) # to get the stratified table
mymatrix2 <- matrix(c(50,100,100,220),nrow=2,byrow=TRUE) 
colnames(mymatrix2) <- c("Disease","Control") 
rownames(mymatrix2) <- c("Exposure","Unexposed") 
print(mymatrix2) # to get the stratified table

myarray <- array(c(mymatrix1,mymatrix2),dim=c(2,2,2))
mantelhaen.test(myarray)
library("lawstat")
cmh.test(myarray)

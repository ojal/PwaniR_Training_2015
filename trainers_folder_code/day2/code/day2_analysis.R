mydata<-read.csv('data/bwmal_subset.csv')
dim(mydata)
head(mydata)
tail(mydata)

#get last six rows of the dataset
tail(mydata, n=4)

#check the variable names
names(mydata)

#view entry in row 17 and column 6
mydata[17,6]

#view all values of variable gestweeks
mydata$gestwks

#check value for  in column 7
data[,7]

#view all values of birthweight
mydata$bweight

#alternative way of viewing all values of birthweight
mydata[,6]
mydata["bweight"]

#alternative way of viewing all values of birthweight
head(mydata$bweight,n=20)

#alternative way of viewing all values of birthweight
mydata["bweight"]

median(mydata$smoke)
mean(mydata$smoke)
mydata$smoke

#summarize continous variable
mean(mydata$matage)
summary(mydata$matage)
summary(mydata$bweight)

#summarize categorical variable
table(mydata$sex)

# crosstabulate categorical variable
table(mydata$sex,mydata$smoke)

#alternative crosstabulate categorical variable
?with
with(mydata, table(sex,smoke))

#calculate bmi*
weight2<-mydata$bweight*100

mydata$weight2<-weight2


#method1
#create variable height2
height2<-(mydata$mheight^2)*100
#attach it to your dataset
mydata$height2<-height2

# method2
mydata$height2<-(mydata$mheight^2)*100


height2<-mydata$mheight^2*100

mydata$height2<-height2
bmi*<-mydata$weight2/mydata$height2
bmi<-mydata$weight2/mydata$height2
mydata$bmi*<-bmi*
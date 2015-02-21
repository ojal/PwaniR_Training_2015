data1 <- read.csv("data/bwmal.csv")
View(data1)
str(data1)
names(data1)
meanbweight<-mean(data1$bweight)
meanbweight
data1$mhw <- data1$mheight + data1$bweight
data1$bm1 <- data1$bweight/(data1$mheight*data1$mheight)
View(data1)
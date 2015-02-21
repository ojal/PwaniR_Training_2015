bwmal <- read.csv("data/bwmal_subset.csv")

#view the first 10 values
head(bwmal , n=10)

#view the last 10 observation

tail(bwmal, n=10)

#sd of weight

sdweight <- sd(bwmal$bweight)
sdweight

#mean of age

meanAge <- mean(bwmal$matage, na.rm = T)
meanAge

#install package ggplot2

install.packages("ggplot2")

#rename a variable in R
library(reshape)
bwmal <- rename(bwmal, c(mheight="mheight2"))


#Numerical Exploration - Practical exercise - solutions
##
#Create datset for practical
#SKIP THIS BIT!!
# data <- read.csv('H:/PwaniStatsCourse/PwaniR_Training_2015/PwaniR_Training_2015/Week1/day2/presentation/maltreat.csv')
# data <- data[!is.na(data$ageyrs),]
# head(data)
# maltreat_subset <- data[c(1:5,100:160,200:210),c("scrno","ageyrs","sex",'whensick',"ethnic","weight","temp")]
# head(maltreat_subset)
# tail(maltreat_subset)
# write.csv(maltreat_subset, 'H:/PwaniStatsCourse/PwaniR_Training_2015/PwaniR_Training_2015/Week1/day2/presentation/maltreat_subset.csv')
#data <- read.csv('H:/PwaniStatsCourse/PwaniR_Training_2015/PwaniR_Training_2015/Week1/day2/presentation/maltreat_subset.csv')
#END OF SKIP THIS BIT



##QN 1: READING DATA---------------------------------------------------------------------------------------------------------------------
#Read the csv dataset named maltreat
data <- read.csv('maltreat.csv')

##QN 2: EXPLORING DATA-------------------------------------------------------------------------------------------------------------------
#How many rows and columns does the dataset have?
dim(data)
#List the variable names in the dataset
names(data) 
#List the first 6 roes of the dataset
head(data) 
#List the last 6 roes of the dataset
tail(data) 
#Extract the value at row 2 and column 3
data[2,3]  
#Extract the value at column 5
data[,5]
#Extract the value at row 24
data[24,]
#Extract what the values that lie within  row 12 to 14 and column 2 to 5
data[12:14, 2:5]

##QN 3: SUMMARIZING DATA----------------------------------------------------------------------------------------------------------------
#get the mean, median, minimum, maximum, standatd deviation, 25th and 75th percentile of the continous variables
mean(data$weight)
var(data$weight)
sd(data$weight)
median(data$weight)
summary(data$weight) 

#tabulate the categorical variables
#as a single variable
table(data$sex)  
#cross-tabulate two or more variables
table(data$sex,data$whensick) 
with(data, table(sex,whensick)) 


##QN 4: USING R AS A CALCULATOR---------------------------------------------------------------------------------------------------------
#calculate 1000 minus 2 ...
#...times 10 to power 2...
#divide by ...
#8 plus 2
1000-2*10^2/(8+2)

#Calculate:
#logarithm of 1.4 to base 10
log10(1.4)
#square root of 16
sqrt(16) 

##QN 5: CALCULATIONS WITH STORED VARIABLES AND ASSIGNMENT STATEMENTS
#store the value 100.55 in an R object named x 
x <- 100.55
#display what is in the variable that you created
x
#calculate the logarithm of that variable x times 3 and store the result as under a new R object y
y <- 3*log(x)
data(mtcars)
View(mtcars)
plot(mtcars$mpg~mtcars$hp,col="green",pch=16)
fit<-lm(mtcars$mpg~mtcars$hp)
abline(fit,col="blue")
cor(mtcars$mpg,mtcars$hp)
class(cor)
print(fit)
##   y=30.09+(-0.068*mtcars$disp)   // Linear equation for regression line model

mtcars$hp
mtcars$disp
30.09886 +(-0.06823*110)
mtcars$mpg

?resid()
resid(fit)
print(fit) #gives the intercept and slope values 

#residual=observed value -estimated value

hist(resid(fit))
summary(fit)

#ques- explain the inverse relationship in terms of unit change in x wrt y

cor(mtcars)
plot(mtcars$disp~mtcars$cyl)


#multiple linear regression

model1<-lm(mpg~hp+disp+cyl,data=mtcars)
print(model1);summary(model1)


model2<-lm(mpg~hp+wt+cyl,data=mtcars);print(model2);summary(model2)
hist(resid(model2))

library(readxl)
data<-read_excel("ward level census.xlsx",3)
View(data)
model<-lm(data$NON_WORK_F~data$F_SC+data$F_ILL)
print(model)
print(model)
summary(model)

plot(data$NON_WORK_F~data$F_SC,col="blue",pch=16)
abline(model,col="red")
cor(data$MARGWORK_F,data$F_ILL)

var(data)
dim(data)
model$
  
  vif(model1)
library(car)
#vif = Variance Inflation Factors

?vif()
#Z score values

pnorm(1)

hist(pnorm(1))
pnorm(-1)
(pnorm(1))
pnorm(1500,1100,200)

#  we use the function qnorm() by putting in percentile (eg: 0.90,0.9332) to get the corresponding absolute value as output 
qnorm(1500,1100,200)
?qnorm()
?pnorm()
?qnorm()
qnorm(0.90,100,5)
qnorm(0.9332,1100,200) 
qnorm(0.95,1100,200)

#rnorm(no. of obs=1000,mean=100, sd=10)
x<-rnorm(100,mean=125, sd=10)
plot(x)
hist(x)


# working with dplyr package 

#dplyr is grammer of data manipulation
#mutate() adds new variables that are functions of the existing variables
#select() picks variables based on their names 
#filter() picks cases based on their values
#summarise() reduces multiple values down to single summary
#arrange() changes the ordering of the rows
#rename()
#group_by()
#index()-create a new variable name with condition
#starts_with() , ends_with()

install.packages(dplyr)
library(dplyr)
data<-read.csv("india-districts-census-2011.csv")
View(data)
subset<-select(data,Literate:Female_Literate)
head(subset)
subset01<-select(data,ends_with("le"))
head(subset01)
subset<-select(data,-(Literate:Female_Literate))
head(subset[1:3])


data(mtcars)
x<-select(mtcars,starts_with("c"))
mtcars
subset<-filter(mtcars,mpg > 25)
head(subset[1:6],4)

x<-rename(mtcars,mileage=mpg,power=hp)
x
names(mtcars)
colnames(mtcars)

mtcars_index<-mutate(mtcars,index=mpg-cyl)
head(mtcars_index[8:12],4)

pop<-group_by(dist,State.name)
pop_t<-summarize(pop,,pop=sum(Population))
print(pop_t)
View(pop_t)
class(data$Population)
getwd()

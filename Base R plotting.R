#Types of plot : 1.Base plotting system 2.Lattice system 3. GGPLOT2
#par() function - For parameters
#pch=1->point character , lwd-length width, lty=Line type , bg=background,mar=margin
#rnorm()- Random normal variable function to generate random numbers,
#pch-Point character,col="green"-For color, cex=1{for zooming in/magnifying}
#xlab="x axis var name",ylab="y axis var name"
#type='l'>line graph, type='h'>histogram , type='b'>line and dots both, type="s">stair steps
#las=level orientation
x<-rnorm(100)
plot(x,pch=19,col="Blue",cex=2.2,xlab="Items",ylab="change in %",main="Export Data");
par("col");
class(x);
par(x)
par("pch");par("col")
summary(x)
length(x);
par("bg")
df<-data.frame(marks=c(65,78,98,46,75),subject=c("maths","science","history","physics","chemistry"));
barplot(df$marks,names.arg=df$subject,col="Red",xlab="subjects",ylab="marks",main="student marks");
barplot(df$marks,names.arg=df$subject,col="Red",xlab="subjects",ylab="marks",main="student marks",las=2)
data(mtcars)
mileage<-mtcars$mpg
boxplot(mtcars$mpg,xlab="Mileage",ylab="Miles per gallon")

data(mtcars)
boxplot(mtcars$mpg~mtcars$cyl,xlab="No. of Cylinders",ylab="Miles per gallon")

#Pie chart

x<-c(25,25,25,25);labels<-c("Delhi","Mumbai","Banglore","Kolkata");pie(x,labels);pie(x,labels,main="City");

x<-c(26,77,87,25,61);labels<-c("Delhi","Mumbai","Banglore","Kolkata");
piepercent<-round(100*x/sum(x),1)
pie(x,labels=piepercent,main="City pie chart",col=heat.colors(length(x)));
legend("bottomright",c("Delhi","Mumbai","Banglore","Kolkata"),cex=0.8,fill=heat.colors(length(x)));

library(paletteer)
paletteer_c("grDevices::rainbow",6)
paletteer_c("grDevices::heat.colors",7)
paletteer_c(heat.colors",7)
paletteer_c(grDevices::terrain.colors",7)


x<-c(25,40,50,75,50);y<-c(23,26,50,40,69);z<-c(1:5);
plot(x,type="o",lwd=3,lty=4,col="pink");
lines(y,type="o",col="blue")
lines(z,type="o",col="blue")


rain1<-c(7,12,28,3,41);rain2<-c(14,7,6,19,3);
plot(rain1,type="o",col="red",xlab="Month",ylab="Rainfall in inches",main="Rainfall chart",pch=1,lty=1,lwd=3);
lines(rain2,col="violet",type="o",pch=2,lty=3,lwd=3)
legend("topleft",c("year 2001","year 2002"),col = c("red","violet"),lty=c(1,3),pch=c(1,2),lwd=c(3,3));


rain1<-c(7,12,28,3,41);rain2<-c(14,7,6,19,3);
months<-c("Jan","Feb","March","April","May");
plot(rain1,type="o",col="Red",xlab="Month",pch=10,ylab="Rainfall in inches",main="Rainfall chart",xaxt="n");
lines(rain2,col="blue",pch=16,xaxt="n")
axis(1,labels=months,at=1:5)
legend("topleft",c("year 2001","year 2002"),col = c("red","blue"),lty=c(1,1),pch=c(10,16),cex=1.5);


x<-1:10;y<-x^2;z<-y/2;xy<-y/1.5;
plot(x,y,col="red",type="o");
points(y,pch=15,)     

#Grouped barplot

x<-1:6;y<-2:7;xy<-cbind(x,y);class(xy);
print(xy)
barplot(xy,beside=T,col=rainbow(length(xy)),names.arg=c("2010","2020"),xlab="Year",ylab="Percentage increase in migration")
legend("topleft",fil=rainbow(6),c("Delhi",'MUMBAI',"Banglore","Kolkata","Cochin","Chennai"))



x<-1:6;y<-2:7;df<-data.frame(x,y);
barplot(df,xlab="Year",ylab="% increase in migration",names.arg=c("2010","2020"),col=rainbow(6));



x<-1:4;y<-2:5;yx<-rbind(x,y);print(yx);
barplot(yx,beside=T,col=c("red","green"),names.arg=c("2001","2002","2003","2004"),xlab="Year",ylab="Production in lacs in MT",main="Grain production data")
legend("topleft",c("Rice","Wheat"),fill=c("red","green"),cex=2)


data(mtcars)
mtcars 
plot(mtcars$hp~mtcars$mpg,pch=2,col="purple") #when we use ~ plot will be y to x

plot(mtcars$hp,mtcars$mpg,pch=2,col="purple") #plot will be x to y


data(mtcars)
plot(mtcars$hp,mtcars$mpg,pch=6,col="blue")
abline(v=146.68,col="yellow",lty=1) #Abline function 

abline(h=25,col="red")
text(250,26,"Meanpoint",cex=1.2,col="black")#textfunction 
abline(h=median(mtcars$mpg),col="purple",lwd=4)
abline(v=median(mtcars$hp),col="purple",lwd=4)

data(mtcars)
plot(mtcars$hp,mtcars$mpg,pch=6,col="blue")
abline(v=,col="yellow",lty=1)
abline(h=25,col="red")

library(datasets)

class(airquality);str(airquality);var(airquality)
#with(airquality,plot(Wind,Ozone,main="Ozone and Wind in Newyork city",pch=16))
with(subset(airquality,Month==6),points(Wind,Ozone,col="red",pch=16))

with(subset(airquality,Month==8),points(Wind,Ozone,col="blue",pch=16))
legend("topright",c("June","August","All months"),pch=c(6,3,1),col=c("red","blue","black"))

#Multiframe plot

x<-rnorm(100)
par(mfrow=c(2,2)) #three row and two columns

hist(x,main="Left plot")
boxplot(x,main="Right plot")
hist(x)
plot(x)

#matrix plot in R , #3D plot in R

edit version 
plot(mtcars)

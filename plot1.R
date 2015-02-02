# replace with your working directory
getwd()
setwd("C:/Users/User/Desktop/datasiencecoursera")

# reading text file from working directory
p1<-read.table("household_power_consumption.txt",header=FALSE,sep = ";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt")),nrow=2879)
attach(p1)

# create plot1 in base plotting system
## find it in your working directory
par(mfrow=c(1,1),mar=c(4,4,1,2),oma=c(0,0,0,0))
hist(Global_active_power,col="red",ylim=c(0,1200),xlab="Global Active Power(kilowatts)",main="Global Active Power",cex=1,cex.axis=0.7,cex.lab=0.7,cex.main=0.8)

#plot1 is saved in your local working directory
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
#replace with your working directory
getwd()
setwd("C:/Users/User/Desktop/datasiencecoursera")

#reading text file from working directory
p1<-read.table("household_power_consumption.txt",header=FALSE,sep = ";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt")),nrow=2879)
attach(p1)

# create object DateTime
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
dates <- Date
times <- Time
x <- paste(dates,times)
DateTime<- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# create plot3 in base plotting system
## find it in your working directory
par(mfrow=c(2,2),mar=c(4,4,1,2),cex=0.65,cex.axis=0.8,cex.lab = 0.8)
with(p1, {plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
          plot(DateTime,Voltage,type="l")
})
with(p1,plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(DateTime,Sub_metering_1,type="l")
lines(DateTime,Sub_metering_2,type="l",col="red")
lines(DateTime,Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),cex=0.8,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",yjust=1)
plot(DateTime,Global_reactive_power,type="l")
dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()
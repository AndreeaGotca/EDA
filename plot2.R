#replace with your working directory
getwd()
setwd("C:/Users/User/Desktop/datasiencecoursera")

#reading text file from working directory
##
p1<-read.table("household_power_consumption.txt",header=FALSE,sep = ";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip = grep("1/2/2007",readLines("household_power_consumption.txt")),nrow=2879)
attach(p1)

# create plot2 in base plotting system
## find it in your working directory
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
dates <- Date
times <- Time
x <- paste(dates,times)
DateTime<- strptime(x, format = "%d/%m/%Y %H:%M:%S")
par(mar=c(2.5,4,1,2))
plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",cex=1,cex.axis=0.7,cex.lab=0.7)
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()
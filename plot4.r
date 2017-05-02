library(lubridate)
setwd("~/Documents/Study_materials/RProgram/week4_exploratory analysis ")

#read the data dump
powerconsumption<-read.table(file = "household_power_consumption.txt", 
                             header = TRUE, sep = ";",na.strings = "?", 
                             stringsAsFactors = FALSE,
                             quote = '\"')
#convert date
powerconsumption$Date<-dmy(powerconsumption$Date)

# subset required data
plotdata<- subset(powerconsumption, Date == '2007-02-01' | Date == '2007-02-02')
#remove full data
rm(powerconsumption)

#convert data and time to timestamp
plotdata$timestamp<-ymd_hms(paste(plotdata$Date,plotdata$Time))

#plot4
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0))
with(plotdata, {
  #subplot1
  plot(Global_active_power~timestamp, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  #subplot2
  plot(Voltage~timestamp, type="l",ylab="Voltage (volt)", xlab="datetime")
  
  #subplot3
  plot(Sub_metering_1~timestamp, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~timestamp,col='Red')
  lines(Sub_metering_3~timestamp,col='Blue')
  legend("topleft", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #subplot4
  plot(Global_reactive_power~timestamp, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

#copy to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
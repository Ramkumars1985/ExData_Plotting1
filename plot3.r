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

#plot3
with(plotdata, {
          plot(Sub_metering_1~timestamp, type = "l", 
                    xlab = "", ylab = "Engery sub metering")
          lines(Sub_metering_2~timestamp, col ="Red")
          lines(Sub_metering_3~timestamp, col ="Blue")
    })

#adding legend
legend("topright",col = c("black","red","blue"),lty = 1, lwd = 1, 
                legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))

#copy to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

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


#plot2
plot(plotdata$Global_active_power~plotdata$timestamp,type = "l" ,
     ylab="Global Active Power (kilowatts)", xlab="")

#copy to png2
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
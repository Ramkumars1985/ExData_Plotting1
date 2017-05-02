library(lubridate)
setwd("~/Documents/Study_materials/RProgram/week4_exploratory analysis ")

#read the data dump
powerconsumption<-read.table(file = "household_power_consumption.txt", 
                             header = TRUE, sep = ";",na.strings = "?")
#convert date
powerconsumption$Date<-dmy(powerconsumption$Date)

# subset required data
plotdata<- subset(powerconsumption, Date == '2007-02-01' | Date == '2007-02-02')

#remove full data
rm(powerconsumption)

plotdata$Global_active_power<-as.numeric(plotdata$Global_active_power)

#call histogram
hist(plotdata$Global_active_power,col = "red", main = "Global Active Power", xlab = 
       "Global Active Power(kilowatts)")

# copy file to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)

#closing png
dev.off()
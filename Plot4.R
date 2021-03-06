rm(list=ls())
library(sqldf)
setwd("C:\\Users\\rreev\\Desktop\\Exploratory Data Analysis\\Week1\\Projects\\Assignment-1")

df<-read.csv.sql("household_power_consumption.txt", sep=';',header=T, sql="select * from file where Date in ( '1/2/2007', '2/2/2007')") 

dt<- strptime(paste(df$Date, df$Time, sep=' '), "%d/%m/%Y %H:%M:%S") 

png(filename = "Plot4.png",  width = 480, height = 480)

par(mfrow=c(2,2))
#Plot a
plot(dt, df$Global_active_power, type='l', ylab='Global Active Power', xlab='')

#Plot b
plot(dt, df$Voltage, type='l', ylab='Voltage', xlab='datetime')

#Plot c
plot(dt, df$Sub_metering_1, type='l', ylab='Energey sub metering', xlab='')
points(dt, df$Sub_metering_2, type='l',col="Red")
points(dt, df$Sub_metering_3, type='l', col="Blue")
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c("Black","red","blue"))

#Plot d
plot(dt, df$Global_reactive_power, type='l', ylab='Global_reactive_power', xlab='')

dev.off()

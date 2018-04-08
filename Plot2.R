rm(list=ls())
library(sqldf)
setwd("C:\\Users\\rreev\\Desktop\\Exploratory Data Analysis\\Week1\\Projects\\Assignment-1")

df<-read.csv.sql("household_power_consumption.txt", sep=';',header=T, sql="select * from file where Date in( '1/2/2007', '2/2/2007')") 

dt<- strptime(paste(df$Date, df$Time, sep=' '), "%d/%m/%Y %H:%M:%S") 

png(filename = "Plot2.png",  width = 480, height = 480)
plot(dt, df$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='')

dev.off()

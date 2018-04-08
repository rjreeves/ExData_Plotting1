rm(list=ls())
library(sqldf)
setwd("C:\\Users\\rreev\\Desktop\\Exploratory Data Analysis\\Week1\\Projects\\Assignment-1")
f<-file("household_power_consumption.txt")

df<-read.csv.sql("household_power_consumption.txt", sep=';',header=T, sql="select * from file where Date in( '1/2/2007', '2/2/2007')") 


png(filename = "Plot1.png",  width = 480, height = 480)
hist(as.numeric(as.character(df$Global_active_power)),col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()


# Set the working directory
setwd("C:/Users/frost/Documents/DataScience/hpc")
getwd() # CHECK UP

library(dplyr)


# read tha data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
data<-as.data.frame(data)

# convert date and time in the right format
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<- format(strptime(data$Time,"%H:%M:%S"),"%H:%M:%S")

# get a required subset of data from 2007-02-01 till 2007-02-02

sample<-filter(data,data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"))

# Plot 1

## call a function hist() to create a histogram with specified title and x-axis
hist(sample$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
## copy the histogram to a png file
dev.copy(png,file="plot1.png")
## close the png device
dev.off()

# Plot 2


# Plot 3


# Plot 4
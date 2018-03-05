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
#add a column
data$days<-weekdays(data$Date,abbreviate=TRUE)


# get a required subset of data from 2007-02-01 till 2007-02-02

sample<-filter(data,data$Date>=as.Date("2007-02-01")&data$Date<=as.Date("2007-02-02"))


# Plot 1

## call a function hist() to create a histogram with specified title and x-axis
hist(sample$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
## copy the histogram to a png file
dev.copy(png,file="plot1.png",width=480,height=480)
## close the png device
dev.off()

# Plot 2

## call a function hist() to create a histogram with y-axis label and no x-axis labels
plot(sample$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab="",type = "l",xaxt = 'n')
# annoteting the plot by adding the days of the week on the x-axis of the plot
step<-sum(sample$days == "Fri")-1
lengthframe<-nrow(sample)
axis(1,at=seq(1, lengthframe, by=step),labels=list("Thu","Fri","Sat"))
## copy the histogram to a png file
dev.copy(png,file="plot2.png",width=480,height=480)
## close the png device
dev.off()


# Plot 3


# Plot 4
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


# Plot 4

## open a png device
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

# subplot 1
plot(sample$Global_active_power, ylab = "Global Active Power",xlab="",type = "l",xaxt = 'n')
step<-sum(sample$days == "Fri")-1
lengthframe<-nrow(sample)
axis(1,at=seq(1, lengthframe, by=step),labels=list("Thu","Fri","Sat"))

# subplot 2
plot(sample$Voltage, ylab = "Voltage",xlab="datetime",type = "l",xaxt = 'n')
step<-sum(sample$days == "Fri")-1
lengthframe<-nrow(sample)
axis(1,at=seq(1, lengthframe, by=step),labels=list("Thu","Fri","Sat"))


# subplot 3
plot(sample$Sub_metering_1, ylab = "Energy sub metering",xlab="",type = "l",xaxt = 'n',col="black")
lines(sample$Sub_metering_2,col="red",type="l")
lines(sample$Sub_metering_3,col="blue",type="l")
# annotating the plot by adding the days of the week on the x-axis of the plot
step<-sum(sample$days == "Fri")-1
lengthframe<-nrow(sample)
axis(1,at=seq(1, lengthframe, by=step),labels=list("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1),bty = "n", ncol=1,trace = TRUE)

# subplot 4
plot(sample$Global_reactive_power, ylab = "Global Reactive Power",xlab="datetime",type = "l",xaxt = 'n')
step<-sum(sample$days == "Fri")-1
lengthframe<-nrow(sample)
axis(1,at=seq(1, lengthframe, by=step),labels=list("Thu","Fri","Sat"))


## close the png device
dev.off()


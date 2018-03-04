# Set the working directory
setwd("C:/Users/frost/Documents/DataScience/hpc")
getwd() # CHECK UP

# read tha data
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
data<-as.data.frame(data)

# convert date and time in the right format
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<- format(strptime(data$Time,"%H:%M:%S"),"%H:%M:%S")

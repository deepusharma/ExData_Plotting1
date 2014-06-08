data = read.table("data/household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors = FALSE)
dataSubsetIndex = (as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(data$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
data= data[dataSubsetIndex,]


png(filename = "plot4.png")

par(mfrow = c(2, 2))

# Graph 1
plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Global_active_power),type="l", xlab="", ylab="Global Active Power")

# Graph 2
plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Voltage),type="l", xlab="datetime", ylab="Voltage")


# Graph 3
plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_1),type="l", xlab="", ylab="Energy Sub metering")

lines(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_2),type="l", col="red")  

lines(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_3),type="l", col="blue")  

legend("topright", lwd=c(1,1,1), cex=0.6, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Graph 4
plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Global_reactive_power),type="l", xlab="datetime", ylab="Global_reactive_power")

# Write to file
#dev.copy(png, "plot4.png", width=480, height=480, units="px")

dev.off()



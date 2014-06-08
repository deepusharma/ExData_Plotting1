data = read.table("data/household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors = FALSE)
dataSubsetIndex = (as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(data$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
data= data[dataSubsetIndex,]



png(filename = "plot3.png")

par(mfrow = c(1, 1))

plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_1),type="l", xlab="", ylab="Energy Sub metering")

lines(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_2),type="l", col="red")  

lines(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Sub_metering_3),type="l", col="blue")  

legend("topright", lwd=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, "plot3.png", width=480, height=480, units="px")


dev.off()


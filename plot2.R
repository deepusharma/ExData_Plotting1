data = read.table("data/household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors = FALSE)
dataSubsetIndex = (as.Date(data$Date,"%d/%m/%Y") >= as.Date("01/02/2007","%d/%m/%Y")) & (as.Date(data$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"))
data= data[dataSubsetIndex,]

png(filename = "plot1.png")

plot(strptime(paste( data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S") , as.numeric(data$Global_active_power),type="l", xlab="", ylab="Global Active Power(kilowatts)")

#dev.copy(png, "plot2.png", width=480, height=480, units="px")

dev.off()
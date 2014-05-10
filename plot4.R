

data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

date.time.vec <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$date.time <- date.time.vec
rm(date.time.vec)


plot4.dev <- png(filename="plot4.png", width = 480, height = 480)
with(data, {
  par(mfrow=c(2,2))
  plot(date.time,Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(date.time,Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(date.time,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(date.time,Sub_metering_1,col="black")
  lines(date.time,Sub_metering_2,col="red")
  lines(date.time,Sub_metering_3,col="blue")
  legend("topright", lwd=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  plot(date.time,Global_reactive_power, type="l", xlab="datetime",
       ylab="Global_reactive_power")
})
dev.off()

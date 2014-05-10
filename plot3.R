


# Data is loaded as in plot1.R

data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Plot sub metring variables in different colours


plot3.dev <- png(filename="plot3.png", width = 480, height = 480)
with(data, {
  plot(date.time,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(date.time,Sub_metering_1,col="black")
  lines(date.time,Sub_metering_2,col="red")
  lines(date.time,Sub_metering_3,col="blue")
  legend("topright", lwd=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
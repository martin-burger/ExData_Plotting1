
# Data is loaded as in plot1.R

data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

data$Global_active_power <- as.numeric(data$Global_active_power)

# Date and Time are merged together

date.time.vec <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$date.time <- date.time.vec

plot2.dev <- png(filename="plot2.png", width = 480, height = 480)
with(data, plot(date.time,Global_active_power, type="l", xlab="",
                ylab="
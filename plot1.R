
# The household power consumption is readed from a data file and plotted into a histogramm
# only data from 1 and 2, February 2007 is used

data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

data$Global_active_power <- as.numeric(data$Global_active_power)

plot_1.dev <- png(filename="plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
                main="Global Active Power"))
dev.off()
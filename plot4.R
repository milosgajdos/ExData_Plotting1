# plot4 plots 4 graphs into one PNG graphics device: 2 graphs on each row

# source loadData.R helper script
loadDataPath <- file.path("loadData.R")
invisible(sapply(loadDataPath, source))

# data URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# load data from provided URL
data <- loadData(url)

# create PNG graphics device
png("plot4.png", width=480, height=480)
# set plot parameters to plot 4 graphs: 2 rows x 2 columns
par(mfrow = c(2, 2))
# convert character dates and times into POSIX time
timeSeries <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# plot all the graphs as per assignment
# plot Global Active Power over time
plot(timeSeries, data$Global_active_power, type="l", 
     xlab="", lwd = 2, ylab="Global Active Power")
# plot Voltage over time
plot(timeSeries, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot Sub metering over time with a graph legend
plot(timeSeries, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(timeSeries, data$Sub_metering_2, col="red")
lines(timeSeries, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
              lty=1, lwd=2, col=c("black", "red", "blue"))
# plot Global_reactive_power over time
plot(timeSeries, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")
# turn off graphics device to close file descriptors
dev.off()

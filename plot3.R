# plot3 plots Energy sub metering graphi over a time period
# it plots 3 different submetering graphs into the same global graph

# source loadData.R helper script
loadDataPath <- file.path("loadData.R")
invisible(sapply(loadDataPath, source))

# data URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# load data from provided URL
data <- loadData(url)

# create PNG graphics device
png("plot3.png", width=480, height=480)
# convert character dates and times into POSIX time
timeSeries <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# plot line graph (type="l") as per assignment
plot(timeSeries,  data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(timeSeries, data$Sub_metering_2, col="red")
lines(timeSeries, data$Sub_metering_3, col="blue")
# create graph legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))
# turn off graphics device to close file descriptors
dev.off()

# plot1 plots a histogram showing a distrbution of global active power

# source loadData.R helper script
loadDataPath <- file.path("loadData.R")
invisible(sapply(loadDataPath, source))

# data URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# load data from provided URL
data <- loadData(url)

# create PNG graphics device
png("plot1.png", width=480, height=480)
# plot histogram as per assignment
hist(data$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
# turn off graphics device to close file descriptors
dev.off()

# loadData downloads data file from a provided url and stores the unzipped file in dest_path
# It parses the required data into a data.table and returns it
loadData <- function(url) {
        # load required packages
        library(data.table)
        library(utils)
        # create temp file to download data file into
        temp <- tempfile()
        # download data file
        download.file(url, temp)
        # unzip the downloaded data file
        unpacked <- unzip(temp, exdir = tempdir())
        # loads the data into data.table with particular data types
        rawData <- fread(unpacked, na.strings = "?", 
                         colClasses = c(rep("character", 2), rep("numeric", 7)))
        # remove downloaded zip file
        unlink(temp)
        # remove unpacked file now that all data is loaded
        unlink(unpacked)
        # return subset of the data from required dates
        data <- rawData[rawData$Date %in% c("1/2/2007","2/2/2007"),]
}

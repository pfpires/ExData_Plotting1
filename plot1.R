## plot1.R
##


setwd("E:/dev/coursera/ds/ExploratoryDataAnalysis/project01")


#############################
## LOAD DATA
#############################

##
## Rougth estimate: (2075259 * 9 * 8) / 2^20 == 142.4967 Mb
##

Sys.time()

# Load the data
dtraw = read.table("household_power_consumption.txt"
                  , header=TRUE
                  , sep = ";"
                  , na.strings = "?"
                  , colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                  , nrows = 2075260
                  , comment.char = "")

Sys.time()

# Extract the daterange for this assignent
data <- dtraw[dtraw$Date == "1/2/2007" |  dtraw$Date == "2/2/2007",]

## NOTE: sum(complete.cases(data)) == nrow(data) so there are no NAs in this date range

Sys.time()

# Create a new column named datetime with the POSIXct time for all rows
data[,"datetime"] <- as.POSIXct(strptime(paste(data$Date,data$Time), "%e/%m/%Y %H:%M:%S"))

Sys.time()


#############################
## Plot 1
#############################

png(filename="plot1.png",width = 480, height = 480)

hist(data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()

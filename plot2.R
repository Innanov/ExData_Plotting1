## By Innanov
library("data.table")

setwd("c:/user/Nouha/Coursera/Data Science/Github/Exploratory_Data_Analysis")

#Read data
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Modifying variables
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Convert date format
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Dates of analysis 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

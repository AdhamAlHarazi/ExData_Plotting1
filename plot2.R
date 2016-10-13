# import required libraries
library(lubridate)

# read in the data
data1 = read.table('household_power_consumption/household_power_consumption.txt',sep=";", header=TRUE, na.strings= '?',colClasses = c('factor', 'factor', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric' ))

# convert the Date from factor into a Date Class
data1$Date = dmy(data1$Date)

# Subset the data by the required dates
subdata = subset(data1, Date == "2007-02-01" | Date == "2007-02-02")
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

# plot the graph
plot(subdata$Global_active_power~ subdata$Datetime, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")


# copy the plotted graph into a png file
dev.copy(png, file="plot2.png",width=480, height=480)
# close the device
dev.off()
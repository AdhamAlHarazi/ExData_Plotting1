# import required libraries
library(lubridate)

# read in the data
data1 = read.table('household_power_consumption/household_power_consumption.txt',sep=";", header=TRUE, na.strings= '?',colClasses = c('factor', 'factor', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric' ))

# convert the Date from factor into a Date Class
data1$Date = dmy(data1$Date)

# Subset the data by the required dates
subdata = subset(data1, Date == "2007-02-01" | Date == "2007-02-02")

hist(subdata$Global_active_power, 
     col="red",
     xlab = "Global Active Power (Killowatts)",
     main = "Global Active Power")


# copy the plotted graph into a png file
dev.copy(png, file="plot1.png",width=480, height=480)
# close the device
dev.off()
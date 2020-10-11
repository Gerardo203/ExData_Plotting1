library(dplyr)

# Download Data
tempf = tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', tempf)
unzip(tempf)
data <- read.csv2('household_power_consumption.txt')

# Filter data
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


# Replace ? with NA.
replace(data, data == '?', NA)
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$date_time <- paste(data$Date, data$Time)
data$date_time <- strptime(data$date_time, format = '%Y-%m-%d %H:%M:%S')

# Plot
png(filename = 'plot3.png', height = 480, width = 480)
plot(x = data$date_time, y = as.numeric(data$Sub_metering_1), type = 'l', xlab = '', ylab = "Energy Sub Metering")
lines(x = data$date_time, y = as.numeric(data$Sub_metering_2), type = 'l', col = 'red')
lines(x = data$date_time, y = as.numeric(data$Sub_metering_3), type = 'l', col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub metering 1', 'sub_metering 2', 'sub_metering 3'))
dev.off()

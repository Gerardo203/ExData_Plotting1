library(dplyr)

# Download Data
tempf = tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', tempf)
unzip(tempf)
data <- read.csv2('household_power_consumption.txt')

# Filter dates
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Histogram
png(filename = 'plot1.png', width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (KW)', ylab = 'Frequency')
dev.off()

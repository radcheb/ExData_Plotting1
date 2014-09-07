rm(list=ls()) # clean all workspace
data <- read.table('household_power_consumption.txt',sep = ";",header = TRUE,na.strings = '?',nrows = 70000)
data[,'Date'] <- as.Date(data[,'Date'],format='%d/%m/%Y')
data$Time <- strptime(paste(data$Date,data$Time,sep = ","),format="%d/%m/%Y,%H:%M:%S")
cleanData <- data[(! is.na(data$Global_active_power)) & (! is.na(data$Global_reactive_power)) & (! is.na(data$Global_intensity)) & (! is.na(data$Voltage)) & (! is.na(data$Sub_metering_1)) & (! is.na(data$Sub_metering_2)) & (! is.na(data$Sub_metering_3)),]
usefulData <- cleanData[as.Date(cleanData$Date,format='%d/%m/%Y') == as.Date('2007-02-01') | as.Date(cleanData$Date,format='%d/%m/%Y') == as.Date('2007-02-02'),]
png("plot1.png", width = 480, height = 480)
hist(usefulData$Global_active_power,col = 'red',xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
title(main = "Global Active Power")
dev.off()
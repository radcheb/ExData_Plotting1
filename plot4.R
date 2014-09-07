rm(list=ls()) # clean all workspace
data <- read.table('household_power_consumption.txt',sep = ";",header = TRUE,na.strings = '?',nrows = 70000)
data$Time <- strptime(paste(data$Date,data$Time,sep = ","),format="%d/%m/%Y,%H:%M:%S")
data[,'Date'] <- as.Date(data[,'Date'],format='%d/%m/%Y')
cleanData <- data[(! is.na(data$Global_active_power)) & (! is.na(data$Global_reactive_power)) & (! is.na(data$Global_intensity)) & (! is.na(data$Voltage)) & (! is.na(data$Sub_metering_1)) & (! is.na(data$Sub_metering_2)) & (! is.na(data$Sub_metering_3)),]
usefulData <- cleanData[as.Date(cleanData$Date,format='%d/%m/%Y') == as.Date('2007-02-01') | as.Date(cleanData$Date,format='%d/%m/%Y') == as.Date('2007-02-02'),]
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#plot1
plot(usefulData$Time ,usefulData$Global_active_power  ,ylab = 'Global Active Power',xlab ='',type = 'l',cex.lab=0.75)
#plot2
plot(usefulData$Time ,usefulData$Voltage  ,ylab = 'Voltage',xlab ='datetime',type = 'l',cex.lab=0.75)
#plot3
plot(usefulData$Time ,usefulData$Sub_metering_1  ,ylab = 'Energy sub metering',xlab ='',type = 'l',col='black',cex.lab=0.75)
lines(usefulData$Time ,usefulData$Sub_metering_2,col="red")
lines(usefulData$Time ,usefulData$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1),col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,bty = "n")
#plot4
plot(usefulData$Time ,usefulData$Global_reactive_power  ,ylab = 'Global_reactive_power',xlab ='datetime',type = 'l',cex.lab=0.75)
dev.off()
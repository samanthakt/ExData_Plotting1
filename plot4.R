data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings=c("?", "NA")) ## read the file
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y") ## convert the Date variable to Date class
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S") ## convert Time variables to Time class
datasubset <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02") ## subset only data from the dates 2007-02-01 and 2007-02-02
par(mfrow=c(2,2)) ## number of plots per row and column (plots are filled row-wise with previously graphics)
plot(datasubset$Time, datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", mar=c(2,2,1,1))
plot(datasubset$Time, datasubset$Voltage, type="l", xlab="datetime", ylab="Voltage", mar=c(2,2,1,1))
plot(datasubset$Time, datasubset$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", mar=c(2,2,1,1))
lines(datasubset$Time, datasubset$Sub_metering_1)
lines(datasubset$Time, datasubset$Sub_metering_2, col="red")
lines(datasubset$Time, datasubset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1, bty="n", xjust=2, yjust=0, adj=c(0.1,0.2))
plot(datasubset$Time, datasubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", mar=c(2,2,1,1))
dev.copy(png, file="plot4.png") ## saving plot
dev.off()

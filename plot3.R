data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings=c("?", "NA")) ## read the file
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y") ## convert the Date variable to Date class
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S") ## convert Time variables to Time class
datasubset <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02") ## subset only data from the dates 2007-02-01 and 2007-02-02
plot(datasubset$Time, datasubset$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering") ## create a blank graphic
lines(datasubset$Time, datasubset$Sub_metering_1) ## put information from sub metering 1 variable
lines(datasubset$Time, datasubset$Sub_metering_2, col="red") ## put information from sub metering 2 variable
lines(datasubset$Time, datasubset$Sub_metering_3, col="blue") ## put information from sub metering 3 variable
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1, adj=c(0.1,0.2)) ## create a legend
dev.copy(png, file="plot3.png") ## saving the plot
dev.off()

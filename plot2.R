data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings=c("?", "NA")) ## read the file
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y") ## convert the Date variable to Date class
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S") ## convert Time variables to Time class
datasubset <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02") ## subset only data from the dates 2007-02-01 and 2007-02-02
plot(datasubset$Time,datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", mar=c(1,2,1,1)) ##plot Global active power along the two days
dev.copy(png, file="plot2.png") ## saving the plot
dev.off()

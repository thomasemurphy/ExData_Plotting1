load_data <- function(filename="household_power_consumption.txt"){
  all_data <- read.table(filename, header=TRUE, sep=";")
  all_data[,"dateTime"] <- as.POSIXct(paste(all_data$Date, all_data$Time), format="%d/%m/%Y %H:%M:%S")
  feb_data <- subset(all_data, dateTime >= as.POSIXct("2007-02-01", format="%Y-%m-%d") & dateTime < as.POSIXct("2007-02-03", format="%Y-%m-%d"))
  feb_data
}

feb_data$Global_active_power <- as.numeric(as.character(feb_data$Global_active_power))
feb_data$Sub_metering_1 <- as.numeric(as.character(feb_data$Sub_metering_1))
feb_data$Sub_metering_2 <- as.numeric(as.character(feb_data$Sub_metering_2))
feb_data$Sub_metering_3 <- as.numeric(as.character(feb_data$Sub_metering_3))
feb_data$Voltage <- as.numeric(as.character(feb_data$Voltage))
feb_data$Global_reactive_power <- as.numeric(as.character(feb_data$Global_reactive_power))

png("plot4.png")

par(mfcol=c(2,2))

# top left
plot(feb_data$dateTime, feb_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# bottom left
plot(feb_data$dateTime, feb_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(feb_data$dateTime, feb_data$Sub_metering_2, col="red")

lines(feb_data$dateTime, feb_data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lty="solid", bty="n")

# top right
plot(feb_data$dateTime, feb_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# bottom right
plot(feb_data$dateTime, feb_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


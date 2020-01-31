load_data <- function(filename="household_power_consumption.txt"){
  all_data <- read.table(filename, header=TRUE, sep=";")
  all_data[,"dateTime"] <- as.POSIXct(paste(all_data$Date, all_data$Time), format="%d/%m/%Y %H:%M:%S")
  feb_data <- subset(all_data, dateTime >= as.POSIXct("2007-02-01", format="%Y-%m-%d") & dateTime < as.POSIXct("2007-02-03", format="%Y-%m-%d"))
  feb_data
}

feb_data$Sub_metering_1 <- as.numeric(as.character(feb_data$Sub_metering_1))
feb_data$Sub_metering_2 <- as.numeric(as.character(feb_data$Sub_metering_2))
feb_data$Sub_metering_3 <- as.numeric(as.character(feb_data$Sub_metering_3))

png("plot3.png")

plot(feb_data$dateTime, feb_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(feb_data$dateTime, feb_data$Sub_metering_2, col="red")

lines(feb_data$dateTime, feb_data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid")

dev.off()
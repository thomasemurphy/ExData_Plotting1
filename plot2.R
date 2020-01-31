load_data <- function(filename="household_power_consumption.txt"){
  all_data <- read.table(filename, header=TRUE, sep=";")
  all_data[,"dateTime"] <- as.POSIXct(paste(all_data$Date, all_data$Time), format="%d/%m/%Y %H:%M:%S")
  feb_data <- subset(all_data, dateTime >= as.POSIXct("2007-02-01", format="%Y-%m-%d") & dateTime < as.POSIXct("2007-02-03", format="%Y-%m-%d"))
  feb_data
}

png("plot2.png")
plot(feb_data$dateTime, feb_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
load_data <- function(filename="household_power_consumption.txt"){
  all_data <- read.table(filename, header=TRUE, sep=";")
  all_data[,"dateTime"] <- as.POSIXct(paste(all_data$Date, all_data$Time), format="%d/%m/%Y %H:%M:%S")
  feb_data <- subset(all_data, dateTime >= as.POSIXct("2007-02-01", format="%Y-%m-%d") & dateTime < as.POSIXct("2007-02-03", format="%Y-%m-%d"))
  feb_data
}

feb_data <- load_data()

feb_data$Global_active_power <- as.numeric(as.character(feb_data$Global_active_power))

png(filename = "plot1.png", width = 480, height = 480)

hist(feb_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
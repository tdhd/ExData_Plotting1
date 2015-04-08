#install.packages('lubridate')
library(lubridate)

dataset <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)

dataset$DateTime <- dmy_hms(paste(dataset$Date, dataset$Time))
dataset$Date <- dmy(dataset$Date)
dataset$Time <- hms(dataset$Time)

idcs <- dataset$Date >= ymd("2007-02-01") & dataset$Date <= ymd("2007-02-02")
dataset <- dataset[idcs,]

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dataset$DateTime, dataset$Global_active_power, type="l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dataset$DateTime, dataset$Voltage, type="l", main = "", ylab = "Voltage", xlab = "datetime")
plot(dataset$DateTime, dataset$Sub_metering_1, type="l", main = "", ylab = "Energy sub metering", xlab = "")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1))
plot(dataset$DateTime, dataset$Global_reactive_power, type="l", main = "", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

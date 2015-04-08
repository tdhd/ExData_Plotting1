#install.packages('lubridate')
library(lubridate)

dataset <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)

dataset$DateTime <- dmy_hms(paste(dataset$Date, dataset$Time))
dataset$Date <- dmy(dataset$Date)
dataset$Time <- hms(dataset$Time)

# filter timespan
idcs <- dataset$Date >= ymd("2007-02-01") & dataset$Date <= ymd("2007-02-02")
dataset <- dataset[idcs,]

png("plot2.png", width = 480, height = 480)
plot(dataset$DateTime, dataset$Global_active_power, type="l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

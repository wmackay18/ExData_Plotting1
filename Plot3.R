# Plot3

setwd("~/Coursera/EDA")

hpc_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

hpc_sub1 <- subset(hpc_data, Date %in% c("1/2/2007","2/2/2007"))

hpc_sub1$Date <- as.Date(hpc_sub1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(hpc_sub1$Date), hpc_sub1$Time)

hpc_sub1$Datetime <- as.POSIXct(datetime)

with(hpc_sub1, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
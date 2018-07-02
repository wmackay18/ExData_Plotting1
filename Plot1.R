# Plot1

setwd("~/Coursera/EDA")

hpc_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

hpc_sub1 <- subset(hpc_data, Date %in% c("1/2/2007","2/2/2007"))

hpc_sub1$Date <- as.Date(hpc_sub1$Date, format="%d/%m/%Y")

hist(hpc_sub1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()


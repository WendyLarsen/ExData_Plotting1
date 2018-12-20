#LOAD AND CLEAN DATA

mydata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## SET TIME VARIABLE
finaldata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldata$Date, finaldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(SetTime, finaldata)

### GENERATE PLOT 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finaldata$SetTime, finaldata$Sub_metering_1, type="l", col=columnlines[1], ylab="Energy Sub Metering", xlab="")
lines(finaldata$SetTime, finaldata$Sub_metering_2, col=columnlines[2])
lines(finaldata$SetTime, finaldata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()



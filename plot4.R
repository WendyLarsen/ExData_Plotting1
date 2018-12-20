#LOAD AND CLEAN DATA

mydata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## SET TIME VARIABLE
finaldata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldata$Date, finaldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(SetTime, finaldata)

### GENERATE PLOT 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finaldata$SetTime, finaldata$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(finaldata$SetTime, finaldata$Voltage, type="l", ylab="Voltage", xlab="DateTime")
plot(finaldata$SetTime, finaldata$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(finaldata$SetTime, finaldata$Sub_metering_2, type="l", col="red")
lines(finaldata$SetTime, finaldata$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finaldata$SetTime, finaldata$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()






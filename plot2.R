#LOAD AND CLEAN DATA

mydata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## SET TIME VARIABLE
finaldata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldata$Date, finaldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(SetTime, finaldata)


### GENERATE PLOT 2
plot(finaldata$SetTime, finaldata$Global_active_power, type="l", col="black", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


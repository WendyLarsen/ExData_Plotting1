#LOAD AND CLEAN DATA

mydata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## SET TIME VARIABLE
finaldata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldata$Date, finaldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(SetTime, finaldata)


### GENERATE PLOT 1
hist(finaldata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()



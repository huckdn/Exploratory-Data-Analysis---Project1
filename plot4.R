rawData <- read.table("household_power_consumption.txt",header=T,sep=";", na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

rawData$DateTime <- paste(rawData$Date, rawData$Time)

rawData$DateTimeActual <- strptime(rawData$DateTime,format="%d/%m/%Y %H:%M:%S")

tidy <- subset(rawData, rawData$DateTimeActual >= as.POSIXct("2007-02-01 00:00:00") & rawData$DateTimeActual <= as.POSIXct("2007-02-02 23:59:00"))

#Fourth Plot
png(file="plot4.png",width = 480, height = 480)
par(mfrow =c(2,2))
plot(tidy$Global_active_power,x = tidy$DateTimeActual,ylab="Global Active Power (kilowatts)",xlab ="",type='l')
plot(tidy$Voltage,x = tidy$DateTimeActual,ylab="Voltage", xlab="datetime",type='l')
plot(tidy$Sub_metering_1,x = tidy$DateTimeActual,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(tidy$Sub_metering_2,x = tidy$DateTimeActual, col="red")
lines(tidy$Sub_metering_3,x = tidy$DateTimeActual, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = '-', col=c("black","red","blue"))
plot(tidy$Global_reactive_power,x = tidy$DateTimeActual ,col="black",ylab="Global_reactive_Power",xlab="datetime",type='l')
dev.off()
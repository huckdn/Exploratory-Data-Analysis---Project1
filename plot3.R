rawData <- read.table("household_power_consumption.txt",header=T,sep=";", na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

rawData$DateTime <- paste(rawData$Date, rawData$Time)

rawData$DateTimeActual <- strptime(rawData$DateTime,format="%d/%m/%Y %H:%M:%S")

tidy <- subset(rawData, rawData$DateTimeActual >= as.POSIXct("2007-02-01 00:00:00") & rawData$DateTimeActual <= as.POSIXct("2007-02-02 23:59:00"))

#ThirdPlot
png(file="plot3.png",width = 480, height = 480)
plot(tidy$Sub_metering_1,x = tidy$DateTimeActual,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(tidy$Sub_metering_2,x = tidy$DateTimeActual, col="red")
lines(tidy$Sub_metering_3,x = tidy$DateTimeActual, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = '-', col=c("black","red","blue"))
dev.off()
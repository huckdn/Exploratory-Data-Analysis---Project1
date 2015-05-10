rawData <- read.table("household_power_consumption.txt",header=T,sep=";", na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

rawData$DateTime <- paste(rawData$Date, rawData$Time)

rawData$DateTimeActual <- strptime(rawData$DateTime,format="%d/%m/%Y %H:%M:%S")

tidy <- subset(rawData, rawData$DateTimeActual >= as.POSIXct("2007-02-01 00:00:00") & rawData$DateTimeActual <= as.POSIXct("2007-02-02 23:59:00"))

#First Plot
png(file="plot1.png",width = 480, height = 480)
hist(tidy$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
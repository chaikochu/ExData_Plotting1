epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
epc <- epc[complete.cases(epc),]
dateTime <- paste(epc$Date, epc$Time)
epc <- epc[ ,!(names(epc) %in% c("Date","Time"))]
epc <- cbind(dateTime, epc)
epc$dateTime <- as.POSIXct(dateTime)
hist(epc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
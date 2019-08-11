library(data.table)
library(readr)

hpc <- fread(file='household_power_consumption.txt')
hpc <- hpc[complete.cases(hpc),]

hpc <- hpc[, Date := as.POSIXct(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S")]
hpc <- hpc[, Global_active_power := as.numeric(as.character(Global_active_power))]
hpc <- hpc[, Global_reactive_power := as.numeric(as.character(Global_reactive_power))]
hpc <- hpc[, Voltage := as.numeric(as.character(Voltage))]
hpc <- hpc[, Global_intensity := as.numeric(as.character(Global_intensity))]
hpc <- hpc[, Sub_metering_1 := as.numeric(as.character(Sub_metering_1))]
hpc <- hpc[, Sub_metering_3 := as.numeric(as.character(Sub_metering_3))]
hpc <- hpc[, Sub_metering_2 := as.numeric(as.character(Sub_metering_2))]

rhpc <- hpc[Date>="2007-02-01" & Date<="2007-02-03"]
rm(hpc)

par(mfrow=c(1,1))

xl <- "Energy sub metering"

plot(rhpc$Date, rhpc$Sub_metering_1, type = "l", ylab = xl, xlab = NA)
lines(rhpc$Date, rhpc$Sub_metering_2, type = "l", col = 'Red')
lines(rhpc$Date, rhpc$Sub_metering_3, type = "l", col = 'Blue')
legend("topright", o, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=1, xjust=1, xpd=NA)

dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

library(data.table)
library(readr)

hpc <- fread(file='household_power_consumption.txt')
hpc <- hpc[complete.cases(hpc),]

hpc <- hpc[, Date := as.Date(Date, format = "%d/%m/%Y")]
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

xl <- "Global Active Power (kW)"
hist(rhpc$Global_active_power, col = 'Red', main = 'Global Active Power', xlab=xl)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

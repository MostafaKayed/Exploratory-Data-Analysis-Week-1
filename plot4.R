household_power_consumption <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                                        stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date 
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Subset Data to date ranges "2007-02-01"  and "2007-02-02"
household_power_consumption_subset <-subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")


##Combine Date + Time into new column
household_power_consumption_subset$TS <- as.POSIXct(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time))


#plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(household_power_consumption_subset,plot(TS,Global_active_power,type = "l",xlab="", ylab="Global Active Power "))
with(household_power_consumption_subset,plot(TS,Voltage,type = "l",xlab="Datetime", ylab="Voltage"))

with(household_power_consumption_subset,plot(TS,Sub_metering_1,type = "l",xlab="", ylab="Energy sub metering"))
lines(household_power_consumption_subset[, "TS"],household_power_consumption_subset[, "Sub_metering_2"],col="red")
lines(household_power_consumption_subset[, "TS"],household_power_consumption_subset[, "Sub_metering_3"],col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),,lty=c(1,1), lwd=c(1,1))
with(household_power_consumption_subset,plot(TS,Global_reactive_power,type = "l",xlab="Datetime", ylab="Global_reactive_power"))

dev.off()


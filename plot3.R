household_power_consumption <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                                        stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date 
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Subset Data to date ranges "2007-02-01"  and "2007-02-02"
household_power_consumption_subset <-subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")


##Combine Date + Time into new column
household_power_consumption_subset$TS <- as.POSIXct(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time))

#plot 3
png("plot3.png", width=480, height=480)
with(household_power_consumption_subset,plot(TS,Sub_metering_1,type = "l",xlab="", ylab="Energy sub metering"))
lines(household_power_consumption_subset[, "TS"],household_power_consumption_subset[, "Sub_metering_2"],col="red")
lines(household_power_consumption_subset[, "TS"],household_power_consumption_subset[, "Sub_metering_3"],col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),,lty=c(1,1), lwd=c(1,1))
dev.off()

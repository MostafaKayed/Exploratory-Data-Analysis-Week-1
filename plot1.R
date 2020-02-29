household_power_consumption <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                                        stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date 
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Subset Data to date ranges "2007-02-01"  and "2007-02-02"
household_power_consumption_subset <-subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")


##Combine Date + Time into new column
household_power_consumption_subset$TS <- as.POSIXct(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time))
#Plot 1
png("plot1.png", width=480, height=480)
hist(household_power_consumption_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()

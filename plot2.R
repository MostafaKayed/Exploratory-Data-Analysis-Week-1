household_power_consumption <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                                        stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date 
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

##Subset Data to date ranges "2007-02-01"  and "2007-02-02"
household_power_consumption_subset <-subset(household_power_consumption, household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02")


##Combine Date + Time into new column
household_power_consumption_subset$TS <- as.POSIXct(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time))

#plot 2
png("plot2.png", width=480, height=480)
with(household_power_consumption_subset,plot(TS,Global_active_power,type = "l",xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

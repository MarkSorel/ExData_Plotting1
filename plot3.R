# Reading the Power Consumption Data
active_power <- read.table("household_power_consumption.txt", skip=1, sep=";")

# Naming the Power Consumption Data
names(active_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                         "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Create a subset of this data
subpower_date <- subset(active_power, active_power$Date=="1/2/2007" | active_power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower_date$Date <- as.Date(subpower_date$Date, format="%d/%m/%Y")
subpower_date$Time <- strptime(subpower_date$Time, format="%H:%M:%S")
subpower_date[1:1440,"Time"] <- format(subpower_date[1:1440,"Time"], "2007-02-01 %H:%M:%S")
subpower_date[1441:2880,"Time"] <- format(subpower_date[1441:2880,"Time"], "2007-02-02 %H:%M:%S")


# Plot the figure (just with y label)
plot(subpower_date$Time, subpower_date$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(subpower_date, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(subpower_date, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
with(subpower_date, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Title of graph
title(main="Energy sub-metering")

# The image is copied to png
dev.copy(png, filename="plot3.png")
dev.off()
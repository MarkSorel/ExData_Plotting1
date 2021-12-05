# Reading the Power Consumption Data
active_power <- read.table("household_power_consumption.txt", skip=1, sep=";")

# Naming the Power Consumption Data
names(active_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Create a subset of this data
subpower <- subset(active_power, active_power$Date=="1/2/2007" | active_power$Date =="2/2/2007")

# Histogram is created
hist(as.numeric(as.character(subpower$Global_active_power)), 
     col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

# The image is copied to png
dev.copy(png, filename="plot1.png")
dev.off()
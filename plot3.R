## This R program is to satisfy the requirement for the Coursers
## Exploratory Data Analysis class plot1.

## Read in the file from working directory
fileName <- "household_power_consumption.txt"
DT <- read.table(fileName, sep = ";", header = TRUE, na.strings = "?")

## Format the Date field to be able to use it for selecting
## the subset of data for the plot
DT$Date <- as.character(DT$Date)
DT$Date <- as.Date(DT$Date, "%d/%m/%Y")

## Subset the Data
dt_sub <- subset(DT, DT$Date == "2007-02-01" | DT$Date == "2007-02-02")

## Join the Date and Time fields
dt_sub$date <- paste(dt_sub$Date, dt_sub$Time)
dt_sub$date <- as.POSIXct(dt_sub$date)

## Open the png device
png(file = "plot3.png")
## Plot the data and the appropriate other items to meet the requirement
##  of having the plot look like the reference plot define by the instructors
with(dt_sub, plot(dt_sub$date,dt_sub$Sub_metering_1, type = "n",  xlab = "", ylab = "Energy sub metering"))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_1, col = "black" ))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_2, col = "red" ))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_3, col = "blue" ))## Close the file
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

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
png(file = "plot4.png")
par(mfrow= c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0), bg = "transparent")

## Plot the date and the appropriate other items to meet the requirement
##  of having the plot look like the reference plot define by the instructors

## Plot 1
plot(dt_sub$date, dt_sub$Global_active_power, xlab = "", ylab = "Global Active Power?bg", type = "l")
## Plot 2
plot(dt_sub$date, dt_sub$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
## Plot 3

## Plot the date and the appropriate other items to meet the requirement
##  of having the plot look like the reference plot define by the instructors

## Plot the data and the appropriate other items to meet the requirement
##  of having the plot look like the reference plot define by the instructors

## NOTE: This plot is different then the one for Plot 3 in that the legend 
##       does not have a box around it in the reference plot

with(dt_sub, plot(dt_sub$date,dt_sub$Sub_metering_1, type = "n",  xlab = "", ylab = "Energy sub metering"))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_1, col = "black" ))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_2, col = "red" ))
with(dt_sub, lines(dt_sub$date, dt_sub$Sub_metering_3, col = "blue" ))## Close the file
legend("topright", bty = "n",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dt_sub$date, dt_sub$Global_reactive_power, xlab = "datetime", type = "l")

dev.off()

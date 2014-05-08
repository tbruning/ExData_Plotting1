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
png(file = "plot2.png", bg = "transparent")
## Plot the date and the appropriate other items to meet the requirement
##  of having the plot look like the reference plot define by the instructors
plot(dt_sub$date, dt_sub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
## Close the file
dev.off()
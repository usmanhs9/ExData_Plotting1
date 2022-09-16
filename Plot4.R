library(tidyverse)
library(data.table)

raw_data <- fread("household_power_consumption.txt")

raw_data <- raw_data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = lubridate::dmy(Date))

plotting_data <- raw_data %>%
  mutate(date_time = as.POSIXct(paste(Date, Time)))

png("Plot4.png")

## Create 2x2 plots
par(mfrow=c(2,2))

##figure from plot 2
plot(plotting_data$date_time, plotting_data$Global_active_power,
     type = 'l',
     ylab = "Global Active Power (Kilowatts)",
     xlab="")

## New voltage figure
plot(plotting_data$date_time, plotting_data$Voltage,
     type = 'l',
     ylab = "Voltage",
     xlab="datetime")

##figure from plot 3
plot(plotting_data$date_time, plotting_data$Sub_metering_1,
     type = 'l',
     ylab = "Energy sub metering",
     xlab="")
lines(plotting_data$date_time, plotting_data$Sub_metering_2,
      col = 'red')
lines(plotting_data$date_time, plotting_data$Sub_metering_3,
      col = 'blue')
legend("topright" , legend = c("sub-metering 1", "sub-metering 2", "sub-metering 3"),
       col = c("black", "red", "blue"),
       lty=1,
       cex=0.5)

## New bar chart
plot(plotting_data$date_time, plotting_data$Global_reactive_power,
     type = 'l',
     ylab = "Global_reactive_power",
     xlab="datetime")

dev.off()

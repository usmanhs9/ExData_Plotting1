library(tidyverse)
library(data.table)

raw_data <- fread("household_power_consumption.txt")

raw_data <- raw_data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = lubridate::dmy(Date))

plotting_data <- raw_data %>%
  mutate(date_time = as.POSIXct(paste(Date, Time)))

png("Plot3.png")
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
       lty=1)
dev.off()
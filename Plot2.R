library(tidyverse)
library(data.table)

raw_data <- fread("household_power_consumption.txt")

raw_data <- raw_data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = lubridate::dmy(Date))

plotting_data <- raw_data %>%
  mutate(date_time = as.POSIXct(paste(Date, Time)))

png("Plot2.png")
plot(plotting_data$date_time, plotting_data$Global_active_power,
     type = 'l',
     ylab = "Global Active Power (Kilowatts)",
     xlab="")
dev.off()
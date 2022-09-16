library(tidyverse)
library(data.table)

raw_data <- fread("household_power_consumption.txt")

raw_data <- raw_data %>%
  filter(Date %in% c("1/2/2007", "2/2/2007"))%>%
  mutate(Date = lubridate::dmy(Date))

png("Plot1.png")
hist(as.numeric(raw_data$Global_active_power),
     col = 'red',
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)")
dev.off()

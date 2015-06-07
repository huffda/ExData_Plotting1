plot1 <- function() {
  library(data.table)
  library(dplyr)
  
  suppressWarnings(dt <- fread("./data/household_power_consumption.txt"))

  dt <- mutate(dt, Date2 = as.Date(Date, "%d/%m/%Y"))
  wdt <- dt[Date2 %between% c(as.Date("2007-02-01"), as.Date("2007-02-02"))] %>%
    mutate(Global_active_power = as.numeric(Global_active_power))

  png("plot1.png", width = 480, height = 480)
  hist(wdt$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}

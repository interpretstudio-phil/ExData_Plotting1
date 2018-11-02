## This script loads the household power consumption data and produces a line chart
## for global active power over the days 1st and 2nd February 2007.  The chart
## is saved into a PNG file with the dimensions 480 x 480.

cons <- read.table('household_power_consumption.txt',sep = ';', header=TRUE, stringsAsFactors = FALSE,
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')
cons$pDate <- as.Date(strptime(cons$Date,format='%d/%m/%Y'))
cons <- subset(cons, pDate == '2007-02-01' | pDate == '2007-02-02')
cons$pDateTime <- strptime(paste(cons$Date,cons$Time),format='%d/%m/%Y %X')
png('plot2.png',480,480)
with(cons,plot(pDateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()
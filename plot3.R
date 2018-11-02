## This script loads the household power consumption data and produces a line chart
## contains the 3 sub-meter variables over the days 1st and 2nd February 2007.  The chart
## is saved into a PNG file with the dimensions 480 x 480.

cons <- read.table('household_power_consumption.txt',sep = ';', header=TRUE, stringsAsFactors = FALSE,
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')
cons$pDate <- as.Date(strptime(cons$Date,format='%d/%m/%Y'))
cons <- subset(cons, pDate == '2007-02-01' | pDate == '2007-02-02')
cons$pDateTime <- strptime(paste(cons$Date,cons$Time),format='%d/%m/%Y %X')
png('plot3.png',480,480)
with(cons,plot(pDateTime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(cons,lines(pDateTime, Sub_metering_2, type='l', col='red'))
with(cons,lines(pDateTime, Sub_metering_3, type='l', col='blue'))
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd=c(2,2,2), col=c('black','red','blue'))
dev.off()
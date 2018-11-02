## This script loads the household power consumption data and produces a 4 line charts
## showing analysis over the days 1st and 2nd February 2007.  The 4 charts are saved 
## into a single PNG file with the dimensions 480 x 480.

cons <- read.table('household_power_consumption.txt',sep = ';', header=TRUE, stringsAsFactors = FALSE,
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')
cons$pDate <- as.Date(strptime(cons$Date,format='%d/%m/%Y'))
cons <- subset(cons, pDate == '2007-02-01' | pDate == '2007-02-02')
cons$datetime <- strptime(paste(cons$Date,cons$Time),format='%d/%m/%Y %X')

png('plot4.png',480,480)
par(mfrow=c(2,2))
# Chart 1
with(cons,plot(datetime, Global_active_power, type='l', xlab='', ylab='Global Active Power'))

# Chart2
with(cons,plot(datetime, Voltage, type='l'))

# Chart 3
with(cons,plot(datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(cons,lines(datetime, Sub_metering_2, type='l', col='red'))
with(cons,lines(datetime, Sub_metering_3, type='l', col='blue'))
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), inset=0.02, box.lty=0, lwd=c(1,1,1), col=c('black','red','blue'))

# Chart 4
with(cons,plot(datetime, Global_reactive_power, type='l'))

dev.off()
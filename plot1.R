## This script loads the household power consumption data and produces a histogram
## for global active power for the days 1st and 2nd February 2007.  The histogram
## is saved into a ONG file with the dimensions 480 x 480.

cons <- read.table('household_power_consumption.txt',sep = ';', header=TRUE, stringsAsFactors = FALSE,
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')
cons$pDate <- as.Date(strptime(cons$Date,format='%d/%m/%Y'))
cons <- subset(cons, pDate == '2007-02-01' | pDate == '2007-02-02')
png('plot1.png',480,480)
hist(cons$Global_active_power,xlab='Global Active Power (kilowatts)',main='Global Active Power',col='red')
dev.off()
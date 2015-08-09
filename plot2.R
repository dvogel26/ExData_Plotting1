# File: plot2.R
# Author: David Vogel
# Date: August 9, 2015
# Description: create and plot global active power time series to file plot2.png.
#   Data loaded, most variables set in plot1.R

outfile <- paste(outdir, "plot2.png", sep="/")

# create and plot global active power time series 
ts <- ts(df$Global_active_power)

png(filename=outfile, width=480, height=480)
plot(ts, 
     ylab="Global Active Power (kilowatts)", 
     xlab=NA, 
     xaxt="n"
)
axis(1, at=c(0, 2880, 1440), labels=c("Thu", "Sat", "Fri"))
dev.off()


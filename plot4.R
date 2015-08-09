# File: plot4.R
# Author: David Vogel
# Date: August 9, 2015
# Description: 4-plot written to file plot4.png.
#   Data loaded, most variables set in plot1.R

outfile <- paste(outdir, "plot4.png", sep="/")

png(filename=outfile, width=480, height=480)
par(mfrow=c(2,2))
# top left
ts <- ts(df$Global_active_power)
plot(ts, 
     ylab="Global Active Power (kilowatts)", 
     xlab=NA, 
     xaxt="n"
)
axis(1, at=c(0, 2880, 1440), labels=c("Thu", "Sat", "Fri"))

# top right
df$Datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))
plot(df$Datetime, 
     df$Voltage, 
     ylab="Voltage", 
     xlab="datetime", 
     type="l"
)

# lower left
plot(df$Sub_metering_1,
     ylab="Energy sub metering",
     xlab=NA,
     xaxt="n",
     type="l"
)
lines(df$Sub_metering_2, 
      type="l",
      col="red"
)
lines(df$Sub_metering_3, 
      type="l",
      col="blue"
)

legend("topright", 
       col=c("black", "red", "blue"), 
       lty=c(1,1,1),
       legend=paste("Sub_metering", 1:3, sep="_")
)

# lower right
plot(df$Datetime, 
     df$Global_reactive_power, 
     ylab="Global_reactive_power", 
     xlab="datetime", 
     type="l",
     yaxp=c(0.0, 0.5, 5)
)
dev.off()

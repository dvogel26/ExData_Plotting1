# File: plot3.R
# Author: David Vogel
# Date: August 9, 2015
# Description: sub metering plots
#   Data loaded, most variables set in plot1.R

outfile <- paste(outdir, "plot3.png", sep="/")

png(filename=outfile, width=480, height=480)
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
dev.off()

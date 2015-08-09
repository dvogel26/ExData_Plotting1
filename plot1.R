# File: plot1.R
# Author: David Vogel
# Date: August 9, 2015
# Description: create histogram plot in file plot1.png of Global active power usage.
#   This script is responsible for loading the data frame used by all plots.

install.packages("sqldf")
library(sqldf)

# set directories of input and output files
indir  <- "/Users/david/eda_coursera/data"
outdir <- "/Users/david/Documents/ExData_Plotting1"

infile  <- paste(indir, "household_power_consumption.txt", sep="/")
outfile <- paste(outdir, "plot1.png", sep="/")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
# Memory requirement:
#   60 * 24 = 1440 readings/day
#   object.size("1/2/2007") = 104 bytes
#   2880 * 7 numeric fields * 48 bytes    =   967,680 bytes
#   2880 * 2 character fields * 104 bytes =   599,040 bytes
#                                           ---------------
#                                   total   1,566,720 bytes

# load records from two days; date format = dd/mm/yyyy
file <- file(infile)
attr(file, "file.format") <- list(sep=";", header=TRUE)
df <- sqldf("SELECT * FROM file WHERE Date IN('1/2/2007', '2/2/2007')")

# omit NA values; for input file ? = NA
df <- df[df$Date != "?" |
         df$Time != "?" |
         df$Global_active_power != "?" |
         df$Global_reactive_power != "?" |
         df$Voltage != "?" |
         df$Global_intensity != "?" |
         df$Sub_metering_1 != "?" |
         df$Sub_metering_2 != "?" |
         df$Sub_metering_3 != "?"
         ,]

df$Global_active_power <- df$Global_active_power[df$Global_active_power != "?"]

png(filename=outfile, width=480, height=480)
hist(df$Global_active_power, 
     ylab="Frequency", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", 
     col="red",
)
dev.off()




### Get and prepare data (finl dataset is called temp2)
# read dataset
temp <- read.delim("household_power_consumption.txt",sep=";",na.strings="?")

#select relevant dates
temp2 <- temp[temp$Date=="1/2/2007"|temp$Date=="2/2/2007",]

#convert dates and time
temp2$DateTime <- paste(temp2$Date,temp2$Time)
temp2$DateTime <- strptime(temp2$DateTime,"%d/%m/%Y %H:%M:%S" )

### Plot1: histogram
# Select device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

# Plot 
with(temp2, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()


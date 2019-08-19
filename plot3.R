### Get and prepare data (finl dataset is called temp2)
# read dataset
temp <- read.delim("household_power_consumption.txt",sep=";",na.strings="?")

#select relevant dates
temp2 <- temp[temp$Date=="1/2/2007"|temp$Date=="2/2/2007",]

#convert dates and time
temp2$DateTime <- paste(temp2$Date,temp2$Time)
temp2$DateTime <- strptime(temp2$DateTime,"%d/%m/%Y %H:%M:%S" )

### Plot3: line plots overlay
# Select device

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

# Create plot
with(temp2, plot(DateTime,Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering"))
with(temp2, lines(DateTime,Sub_metering_2,col="red"))
with(temp2, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
dev.off()


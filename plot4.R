# Load data
source("hpcLoader.R")
data<-hpc.load.data()

# Open device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#Set base parameters
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(data, {
  
  #Make top left plot
  plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  
  #Make top right plot
  plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  #Make bottom left plot
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  
  cols <-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
  
  #Make bottom right plot
  plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
})    

# Turn off device
dev.off()
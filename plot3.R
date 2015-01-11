# Load data
source("hpcLoader.R")
data<-hpc.load.data()

# Open device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(data,{
  # Make first plot (type lines)
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  
  # Add line individually
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  
  #Add legend
  cols <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
})

# Turn off device
dev.off()
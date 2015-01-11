# Load data
source("hpcLoader.R")
data<-hpc.load.data()

# Open device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Make plot (type lines)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Turn off device
dev.off()



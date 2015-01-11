# Load data
source("hpcLoader.R")
data<-hpc.load.data()

# Open device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Make histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Turn off device
dev.off()




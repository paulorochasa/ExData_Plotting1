library(data.table)

hpc.load.data<- function(){
  ## (hpc - Household Power Consumption)
  hpc.tidy.file<-"household_power.csv"
  
  #Check if tidy CSV file exists
  if (!file.exists(hpc.tidy.file)) {
  
    
    #Download and unzip raw data file
    hpc.zip.file <- "rawdata.zip"
    hpc.raw.file <-"household_power_consumption.txt"
    
    if (!file.exists(hpc.zip.file)){
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=hpc.zip.file)
    }
    
    if (!file.exists(hpc.raw.file)){
      unzip(hpc.zip.file,hpc.raw.file )
    }
    
    hpc.classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
    ## Slowest solution to read a large file - load all data into memory
    #hpc.DT <- read.table(hpc.raw.file , header=TRUE,sep=";", na.strings="?",colClasses=hpc.classes)
    #hpc.data <- hpc.DT[(hpc.DT$Date == "1/2/2007") | (hpc.DT$Date == "2/2/2007"),]
    
    # One faster solution to read data - load only the necessary data
    hpc.raw.filter <- as.numeric(difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins"))
    hpc.data<-fread(hpc.raw.file , skip="1/2/2007", nrows = hpc.raw.filter, na.strings = c("?", ""),colClasses = hpc.classes )
    setnames(hpc.data, colnames(fread(hpc.raw.file, nrows=0)))
    hpc.data<-data.frame(hpc.data)
    
    #Write subset to CSV
    hpc.data$DateTime <- strptime(paste(hpc.data$Date, hpc.data$Time), "%d/%m/%Y %H:%M:%S")  
    write.csv(hpc.data, hpc.tidy.file)
    
  }else{
    hpc.data <- read.csv(hpc.tidy.file)
    hpc.data$DateTime <- strptime(hpc.data$DateTime, "%Y-%m-%d %H:%M:%S")
  }
  hpc.data
}





## Plot 2


fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./Household power consumption")){
  download.file(fileurl,'Household power consumption.zip', mode = 'wb')
  unzip("Household power consumption.zip", exdir = getwd())
}

PCon <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(PCon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subPCon <- subset(PCon, PCon$Date=="1/2/2007" | PCon$Date =="2/2/2007")

subPCon$Date <- as.Date(subPCon$Date, format="%d/%m/%Y")
subPCon$Time <- strptime(subPCon$Time, format="%H:%M:%S")
subPCon[1:1440,"Time"] <- format(subPCon[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subPCon[1441:2880,"Time"] <- format(subPCon[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subPCon$Time,as.numeric(as.character(subPCon$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

title(main="Global Active Power Vs Time")
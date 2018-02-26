## Plot 1


fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./Household power consumption")){
  download.file(fileurl,'Household power consumption.zip', mode = 'wb')
  unzip("Household power consumption.zip", exdir = getwd())
}

PCon <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(PCon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subPCon <- subset(PCon, PCon$Date=="1/2/2007" | PCon$Date =="2/2/2007")

hist(as.numeric(as.character(subPCon$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")
## Plot 3


fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./Household power consumption")){
  download.file(fileurl,'Household power consumption.zip', mode = 'wb')
  unzip("Household power consumption.zip", exdir = getwd())
}

PCon <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

PCon <- PCon %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

# create plot
with(PCon, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(PCon, points(V1,V7, col="black", type="l"))
with(PCon, points(V1,V8, col="red", type="l"))
with(PCon, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
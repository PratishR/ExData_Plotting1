alldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y") 

subsetdata <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(alldata) 

temp <- paste(as.Date(subsetdata$Date), subsetdata$Time) 
subsetdata$Datetime <- as.POSIXct(temp) 


plot(subsetdata$Global_active_power~subsetdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

dev.copy(png, file="./plot2.png", height=480, width=480) 
dev.off() 

data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
with(data, { 
        plot(Global_active_power~Datetime, type="l",  
        ylab="Global Active Power (kilowatts)", xlab="") 
        plot(Voltage~Datetime, type="l",  
        ylab="Voltage (volt)", xlab="") 
        plot(Sub_metering_1~Datetime, type="l",  
        ylab="Global Active Power (kilowatts)", xlab="") 
        lines(Sub_metering_2~Datetime,col='Red') 
        lines(Sub_metering_3~Datetime,col='Blue') 
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
        plot(Global_reactive_power~Datetime, type="l",  
                                      ylab="Global Rective Power (kilowatts)",xlab="") 
       }) 

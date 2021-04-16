#load data
energy_con_all <- read.table("./eda1/household_power_consumption.txt", header = TRUE, sep=";")

# transform Date column to a date
energy_con_all$Date <- as.Date(energy_con_all$Date, format="%d/%m/%Y") 

#Subset the required dates
energy_con_sub <- subset(energy_con_all, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
str(energy_con_sub)
dim(energy_con_sub)


#Create a new column for Datetime and concatenate the Date and Time columns
energy_con_sub$DateTime <- as.POSIXct(paste(energy_con_sub$Date, energy_con_sub$Time), format="%Y-%m-%d %H:%M:%S")


  
## Fourth Plot


par(mfrow=c(2,2))

plot(energy_con_sub$DateTime,as.numeric(energy_con_sub$Global_active_power),type="l",  xlab="",ylab="Global Active Power")

plot(energy_con_sub$DateTime,as.numeric(energy_con_sub$Voltage), type="l",xlab="datetime",ylab="Voltage")

plot(energy_con_sub$DateTime,energy_con_sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(energy_con_sub$DateTime,as.numeric(energy_con_sub$Sub_metering_1),col="black")
lines(energy_con_sub$DateTime,as.numeric(energy_con_sub$Sub_metering_2),col="red")
lines(energy_con_sub$DateTime,as.numeric(energy_con_sub$Sub_metering_3),col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

plot(energy_con_sub$DateTime,as.numeric(energy_con_sub$Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")


#copy to local
dev.copy(png, file="./eda1/Plot4.png")
dev.off()

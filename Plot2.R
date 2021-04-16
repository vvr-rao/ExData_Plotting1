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


  
##second Plot

plot(energy_con_sub$DateTime,as.numeric(energy_con_sub$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#copy Plot to a local .png
dev.copy(png, file="./eda1/Plot2.png", width=400, height=400)
dev.off()

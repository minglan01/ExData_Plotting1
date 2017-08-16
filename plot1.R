dat1<-read.table("household_power_consumption.txt",skip=66600,nrows = 3000, sep=";")
dat1 <- subset(dat1, V1=="1/2/2007"|V1=="2/2/2007")
colnames(dat1) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
                    "Voltage", "Global.intensity", "Sub.metering.1",
                    "Sub.metering.2", "Sub.metering.3")

tmp <- paste(dat1$Date, dat1$Time)
dat1$Dtclass <- strptime(tmp, format = "%d/%m/%Y %H:%M:%S")

hist(dat1[, "Global.active.power"], col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "~/Downloads/exp_assign1/ExData_Plotting1/plot1.png",
         width = 480, height = 480)
dev.off()
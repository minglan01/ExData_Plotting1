dat1<-read.table("household_power_consumption.txt",skip=66600,nrows = 3000, sep=";")
dat1 <- subset(dat1, V1=="1/2/2007"|V1=="2/2/2007")
colnames(dat1) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
                    "Voltage", "Global.intensity", "Sub.metering.1",
                    "Sub.metering.2", "Sub.metering.3")

tmp <- paste(dat1$Date, dat1$Time)
dat1$Dtclass <- strptime(tmp, format = "%d/%m/%Y %H:%M:%S")

plot(dat1$Dtclass, dat1$Sub.metering.1, type="l", 
     ylab = "Energy sub metering", xlab = "")
lines(dat1$Dtclass, dat1$Sub.metering.2, col="red")
lines(dat1$Dtclass, dat1$Sub.metering.3, col="blue")


legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
       col=c('black', "red", "blue"))

dev.copy(png, "~/Downloads/exp_assign1/ExData_Plotting1/plot3.png",
         width = 480, height = 480)
dev.off()
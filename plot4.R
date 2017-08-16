dat1<-read.table("household_power_consumption.txt",skip=66600,nrows = 3000, sep=";")
dat1 <- subset(dat1, V1=="1/2/2007"|V1=="2/2/2007")
colnames(dat1) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
                    "Voltage", "Global.intensity", "Sub.metering.1",
                    "Sub.metering.2", "Sub.metering.3")

tmp <- paste(dat1$Date, dat1$Time, sep= " ")
dat1$Dtclass <- strptime(tmp, format = "%d/%m/%Y %S:%M:%H")

par(mfrow=c(2,2))
plot(dat1$Global.active.power, type="l",   xaxt = "n", 
     ylab = "Global Active Power", xlab = "")
axis(1, at=c(1,nrow(dat1)/2, nrow(dat1)),labels = c('Thu','Fri','Sat'))

plot(dat1$Voltage, type="l",   xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, at=c(1,nrow(dat1)/2, nrow(dat1)),labels = c('Thu','Fri','Sat'))

plot(dat1$Sub.metering.1, type="l",   xaxt = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(dat1$Sub.metering.2, col="red")
lines(dat1$Sub.metering.3, col="blue")
axis(1, at=c(1,nrow(dat1)/2, nrow(dat1)),labels = c('Thu','Fri','Sat'))

plot(dat1$Global.reactive.power, type="l",   axes = FALSE, 
     ylab = "Global_reactive_power", xlab = "datetime")
axis(1, at=c(1,nrow(dat1)/2, nrow(dat1)),labels = c('Thu','Fri','Sat'))
axis(2, at=seq(0,0.5,0.1),labels = seq(0,0.5,0.1))

dev.copy(png, "~/Downloads/exp_assign1/ExData_Plotting1/plot4.png",
         width = 480, height = 480)
dev.off()
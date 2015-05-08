#Read the data and subset from it the two days first and second february 2007

Data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data1<-Data[(Data$Date=="1/2/2007")|(Data$Date=="2/2/2007"),]

#Change the class of the variables Global_active_power, Sub_metering_1, Sub_metering_2, Voltage and Global_reactive_power into numeric instead of 
#factor through character
#Convert the data and time variables into Date/Time classes

data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

data1$Timestamp <- strptime(paste(data1$Date,data1$Time),
                            format="%d/%m/%Y %H:%M:%S")
data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Voltage<-as.numeric(as.character(data1$Voltage))

data1$Global_reactive_power<-as.numeric(as.character(data1$Global_reactive_power))

#Create the png file as the graphics device
#Set the parameters to fit 4 plots
#call the plotting functions to make the required plots  
png(filename="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

#Plot 1
plot(data1$Timestamp,data1$Global_active_power,type="l",xlab="",
          ylab="Global Active Power (kilowatts)")

#Plot 2
plot(data1$Timestamp,data1$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot3
plot(data1$Timestamp,data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data1$Timestamp,data1$Sub_metering_2,col="red")
lines(data1$Timestamp,data1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
              "Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n",cex=0.5)
#Plot 4
plot(data1$Timestamp,data1$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

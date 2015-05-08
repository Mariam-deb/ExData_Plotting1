#Read the data and subset from it the two days first and second february 2007

Data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data1<-Data[(Data$Date=="1/2/2007")|(Data$Date=="2/2/2007"),]

#Change the class of the variables Global_active_power, Sub_metering_1 and Sub_metering_2 into numeric instead of 
#factor through character
#Convert the data and time variables into Date/Time classes

data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

data1$Timestamp <- strptime(paste(data1$Date,data1$Time),
                            format="%d/%m/%Y %H:%M:%S")
data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))

#Create the png file as the graphics device and call the plotting function plot() 
#to make the required plot and annotate the plot with the other 2 variables

png(filename="plot3.png",width=480,height=480)
plot(data1$Timestamp,data1$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data1$Timestamp,data1$Sub_metering_2,col="red")
lines(data1$Timestamp,data1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",
                           "Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
#Read the data and subset from it the two days first and second february 2007

Data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)

data1<-Data[(Data$Date=="1/2/2007")|(Data$Date=="2/2/2007"),]

#Change the class of the variable Global_active_power into numeric instead of 
#factor through character
#Convert the data and time variables into Date/Time classes
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

data1$Timestamp <- strptime(paste(data1$Date,data1$Time),
                                format="%d/%m/%Y %H:%M:%S")

#Create the png file as the graphics device and call the plotting function plot() 
#to make the required plot 
png(filename="plot2.png",width=480,height=480)

plot(data1$Timestamp,data1$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

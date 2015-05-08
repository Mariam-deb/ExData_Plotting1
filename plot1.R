#Read the data and subset from it the two days first and second february 2007

Data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data1<-Data[(Data$Date=="1/2/2007")|(Data$Date=="2/2/2007"),]

#Change the class of the variable Global_active_power into numeric instead of 
#factor through character

data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

#Create the png file as the graphics device and call the plotting function hist() 
#to make the required histogram 

png(filename="plot1.png",width=480,height=480)
hist(data1$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
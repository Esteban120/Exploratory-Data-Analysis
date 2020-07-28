#Reading the data
database<-read.csv("./household_power_consumption.txt", sep=";")
#Subsetting the database
database<-database[database$Date=="1/2/2007" | database$Date=="2/2/2007",]
#Changing Date and Time to date format
database$DateTime<-paste(database[,1],database[,2])
database$DateTime<-strptime(database$DateTime,format = "%d/%m/%Y %H:%M:%S")
#Coercing the data to numeric
database[,3]<-as.numeric(database[,3])
database[,4]<-as.numeric(database[,4])
database[,5]<-as.numeric(database[,5])
database[,7]<-as.numeric(database[,7])
database[,8]<-as.numeric(database[,8])
database[,9]<-as.numeric(database[,9])
#Creating the png file
png("Plot 4.png")
#Making the layout a 2x2 matrix
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
#Plot 1
with(database,plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
#Plot 2
with(database,plot(DateTime,Voltage,type = "l"))
#Plot 3
with(database, plot(DateTime,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = ""))
with(database,lines(DateTime,Sub_metering_2,col="red"))
with(database,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=1, cex = 0.7)
#Plot 4
with(database,plot(DateTime,Global_reactive_power,type = "l"))
#Closing the png file
dev.off()

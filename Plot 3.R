#Reading the data
database<-read.csv("./household_power_consumption.txt", sep=";")
#Subsetting the database
database<-database[database$Date=="1/2/2007" | database$Date=="2/2/2007",]
#Changing Date and Time to date format
database$DateTime<-paste(database[,1],database[,2])
database$DateTime<-strptime(database$DateTime,format = "%d/%m/%Y %H:%M:%S")
#Coercing sub_meltering to numeric
database[,7]<-as.numeric(database[,7])
database[,8]<-as.numeric(database[,8])
database[,9]<-as.numeric(database[,9])
#Creating the png file
png("Plot 3.png")
#Creating the plot
with(database, plot(DateTime,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = ""))
with(database,lines(DateTime,Sub_metering_2,col="red"))
with(database,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
#Closing the png file
dev.off()
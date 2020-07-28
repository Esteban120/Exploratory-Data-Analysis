#Reading the data
database<-read.csv("./household_power_consumption.txt", sep=";")
#Subsetting the database
database<-database[database$Date=="1/2/2007" | database$Date=="2/2/2007",]
#Changing Date to date format
database$DateTime<-paste(database[,1],database[,2])
database$DateTime<-strptime(database$DateTime,format = "%d/%m/%Y %H:%M:%S")
#Coercing to numeric
database[,3]<-as.numeric(database[,3])
#Creating the png file. Since 480x480 is already the default, there is no need to specify width or height.
png("Plot 2.png")
#Creating the plot
with(database,plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
#Closing the png file
dev.off()

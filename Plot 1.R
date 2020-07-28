#Reading the data
database<-read.csv("./household_power_consumption.txt", sep=";")
#Subsetting the database
database<-database[database$Date=="1/2/2007" | database$Date=="2/2/2007",]
#Changing Date to date format
database$Date<-as.Date(database$Date, format = "%d/%m/%Y")
#Coercing to numeric
database[,3]<-as.numeric(database[,3])
#Creating the png file. Since 480x480 is already the default, there is no need to specify width or height.
png("Plot 1.png")
#Creating the plot
hist(database$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#Closing the png file
dev.off

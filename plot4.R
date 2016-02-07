# retrieve column names
varname<-colnames(read.table(file="ExData_Plotting1/household_power_consumption.txt",nrows=1,sep=";",stringsAsFactors=FALSE,header=TRUE))

data.epc <- read.table(text = grep("^[1,2]/2/2007", readLines("ExData_Plotting1/household_power_consumption.txt"), value = TRUE), stringsAsFactors=FALSE, col.names =varname, sep = ";", header = TRUE)


date.time<-as.Date(data.epc[,1],format="%d/%M/%Y")
time.index<-strptime(paste(data.epc[,1],data.epc[,2]),format="%d/%m/%Y %H:%M:%S")

# plot4.R
# set a 2 x 2 palette to place the plot
par(mfrow=c(2,2))

# first plot 
plot(time.index,data.epc[,3],type="l",xlab="",ylab="Global Active Power")

# second plot
plot(time.index,data.epc[,5],type="l",xlab="datetime",ylab="Voltage")

# third plot
plot(time.index,data.epc[,7],type="l",xlab="",ylab="Global Active Power (kilowatts)",col="black")
lines(time.index,data.epc[,8],type="l",xlab="",ylab="Global Active Power (kilowatts)",col="red")
lines(time.index,data.epc[,9],type="l",xlab="",ylab="Global Active Power (kilowatts)",col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = colnames(data.epc[,7:9]))

# fourth plot
plot(time.index,data.epc[,4],type="l",xlab="datetime",ylab=colnames(data.epc)[4])

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


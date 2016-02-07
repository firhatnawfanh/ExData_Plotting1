# retrieve column names
varname<-colnames(read.table(file="ExData_Plotting1/household_power_consumption.txt",nrows=1,sep=";",stringsAsFactors=FALSE,header=TRUE))

data.epc <- read.table(text = grep("^[1,2]/2/2007", readLines("ExData_Plotting1/household_power_consumption.txt"), value = TRUE), stringsAsFactors=FALSE, col.names =varname, sep = ";", header = TRUE)


date.time<-as.Date(data.epc[,1],format="%d/%M/%Y")
time.index<-strptime(paste(data.epc[,1],data.epc[,2]),format="%d/%m/%Y %H:%M:%S")

# plot1.R
hist(data.epc[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()



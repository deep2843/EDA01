
## Setting the working directory

setwd("C:\\Users\\arorad\\Downloads\\Data")

##reading the file now

pwr_cons = read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F,
                      na.strings="?",check.names=F,comment.char="", quote='\"')

pwr_cons$Date <- as.Date(pwr_cons$Date,format="%d/%m/%Y")


head(pwr_cons)

##subsetting the data as we need date range only from 2007-02-01, 2007-02-02

pwr_cons_2 <- subset(pwr_cons,subset=(Date >="2007-02-01" & Date <= "2007-02-02"))
rm(pwr_cons)

##Concatenating date and time variable now

datetime <- paste(pwr_cons_2$Date,pwr_cons_2$Time)
pwr_cons_2$datetime <- as.POSIXct(datetime)

#plot2
with(pwr_cons_2,plot(Global_active_power~datetime,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

##Creating the png now
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()



## Setting the working directory

setwd("C:\\Users\\arorad\\Downloads\\Data")

##reading the file now

pwr_cons = read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F,
                      na.strings="?",check.names=F,comment.char="", quote='\"')

pwr_cons$Date <- as.Date(pwr_cons$Date,format="%d/%m/%Y")


##subsetting the data as we need date range only from 2007-02-01, 2007-02-02

pwr_cons_2 <- subset(pwr_cons,subset=(Date >="2007-02-01" & Date <= "2007-02-02"))
rm(pwr_cons)

##Concatenating date and time variable now

datetime <- paste(pwr_cons_2$Date,pwr_cons_2$Time)
pwr_cons_2$datetime <- as.POSIXct(datetime)



## plot4
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(pwr_cons_2,plot(Global_active_power~datetime,type="l",xlab="",ylab="Global Active Power"))

with(pwr_cons_2,plot(Voltage~datetime,type="l",xlab="datetime",ylab="Voltage"))

with(pwr_cons_2,
{plot(Sub_metering_1~datetime,type="l",xlab="",ylab="Energy Sub Metering")
 lines(Sub_metering_2~datetime,col="Red")
 lines(Sub_metering_3~datetime,col="Blue")})

##setting the legends now

legend("topright",col=c("black","Red","Blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

with(pwr_cons_2,plot(Global_reactive_power~datetime,type="l",xlab="datetime",ylab="Global_reactive_power"))



## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
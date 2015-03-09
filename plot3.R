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

#plot3

with(pwr_cons_2,
     {plot(Sub_metering_1~datetime,type="l",xlab="",ylab="Energy Sub Metering")
      lines(Sub_metering_2~datetime,col="Red")
      lines(Sub_metering_3~datetime,col="Blue")})

##setting the legends now

legend("topright",col=c("black","Red","Blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


##Copying to png file

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

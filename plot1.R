
### Loading the Electrice Power Consumption Data
##Checking the memory available to R and meomory used to read the data

round(memory.limit()/1048,2)
##7.72 GB of memory available

library(pryr)
mem_used()

##only 92.6MB Memory used

## Setting the working directory

setwd("C:\\Users\\arorad\\Downloads\\Data")

###reading the file now

pwr_cons = read.table("./household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F,
                      na.strings="?",check.names=F,comment.char="", quote='\"')

#convering the variable to data
pwr_cons$Date <- as.Date(pwr_cons$Date,format="%d/%m/%Y")
rm(pwr_cons)

head(pwr_cons)

##subsetting the data as we need date range only from 2007-02-01, 2007-02-02

pwr_cons_2 <- subset(pwr_cons,subset=(Date >="2007-02-01" & Date <= "2007-02-02"))




#plot1
with(pwr_cons_2,hist(Global_active_power,main="Global Active Power", 
                     xlab="Global Active Power(killowatts)", ylab="Frequency",col="Red"))

##Creating the png now
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()


     
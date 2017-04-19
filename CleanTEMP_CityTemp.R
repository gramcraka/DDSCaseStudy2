
setwd("./data")
library (lubridate)
#Clean TEMP.csv
tempRaw <- read.csv ("TEMP.csv", header=TRUE, sep=',')

class(tempRaw)
str(tempRaw)
head (tempRaw, 10)
tail (tempRaw, 10)

#Clean out blanks & dropping Montly.AverageTemp.Uncertainty
tempClean <- tempRaw [, -3]
tempClean <- na.omit(tempClean)

tempClean$Date <- as.Date (tempClean$Date)   #Changing Date to Date class.
tail(tempClean, 10)
#Clean up inconsistent date format by converting to character
tempClean$Date <- as.character(tempClean$Date)

tail(tempClean, 10)
#write.csv (tempClean, "outClean1.csv")

cat ("Change Date to character\n")


#####################################################
#Clean CityTemp.csv
CityRaw <- read.csv ("CityTemp.csv", header=TRUE, sep=',', row.names=FALSE)
   
class(CityRaw)
str(CityRaw)
head (CityRaw, 10)
tail (CityRaw, 10)

#Clean out blanks
CityClean <- CityRaw
CityClean <- na.omit(CityClean)

CityClean$Date <- as.character (CityClean$Date)
summary(CityClean)
cat ("Temp Data is clean from NA\n")

#Clean up formats -- date, City, Country, Latitude, Longitude were all read
#in as factors.  
#CityClean$Country <- as.character (CityClean$Country)

#CityClean$City <- as.character (CityClean$City)
#CityClean$Latitude <- as.character (CityClean$Latitude)
#CityClean$Longitude <- as.character (CityClean$Longitude)
#CityClean$Date <- as.Date (CityClean$Date)   #Changing Date to Date class.
class(CityClean$Date)
class(CityClean$Country)
class(CityClean$City)
class(CityClean$Latitude)

dim(CityClean)

   



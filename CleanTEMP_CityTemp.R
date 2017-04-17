
setwd("./data")

#Clean TEMP.csv
tempRaw <- read.csv ("TEMP.csv", header=TRUE, sep=',', row.names=FALSE)

class(tempRaw)
str(tempRaw)
head (tempRaw, 10)
tail (tempRaw, 10)

#Clean out blanks & dropping Montly.AverageTemp.Uncertainty
tempClean <- tempRaw [, -3]
tempClean <- na.omit(tempClean)

#tempClean$Date <- as.Date (tempClean$Date)   #Changing Date to Date class.
#tail(tempClean, 10)
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
CityClean[CityClean ==""] <- NA
CityClean <- na.omit(CityClean)

#Checking file to ensure no NA. Since such a large dataset we ran a 
#'is.na' function which returns TRUE if there is an NA.  This is outputted 
#to 'output.csv' in the current working directory.  To ensure no NA, open 
#output.csv and do an Excel 'Find=> TRUE'.  There are no TRUE so no NA data in the set.
#The data is cleran.
missingTemp <-is.na(CityClean) # returns TRUE of any tempClean is missing
write.table (missingTemp, file="outputCity.csv", sep=",")
#Summary stats on CityClean
dim(CityClean)
summary(CityClean)
cat ("Temp Data is clean from NA\n")

#Clean up formats -- date, City, Country, Latitude, Longitude were all read
#in as factors.  
#CityClean$Country <- as.character (CityClean$Country)
CityClean$Date <- as.character (CityClean$Date)
#CityClean$City <- as.character (CityClean$City)
#CityClean$Latitude <- as.character (CityClean$Latitude)
#CityClean$Longitude <- as.character (CityClean$Longitude)
#CityClean$Date <- as.Date (CityClean$Date)   #Changing Date to Date class.
class(CityClean$Date)
class(CityClean$Country)
class(CityClean$City)
class(CityClean$Latitude)

dim(CityClean)

   
# SUBSET OF DATA SET TO WORK WITH NOT INTENDED TO KEEP. Temp Data file
#Clean CityTemp.csv
CityRaw1 <- read.csv ("CityTemp1.csv", header=TRUE, sep=',', row.names=FALSE)

class(CityRaw1)
str(CityRaw1)
head (CityRaw1, 10)
tail (CityRaw1, 10)

#Clean out blanks
CityClean1 <- CityRaw1
CityClean1[CityClean1 ==""] <- NA
CityClean1 <- na.omit(CityClean1)
write.csv (CityClean1, file="outCityClean1.csv")

#Checking file to ensure no NA. Since such a large dataset we ran a 
#'is.na' function which returns TRUE if there is an NA.  This is outputted 
#to 'output.csv' in the current working directory.  To ensure no NA, open 
#output.csv and do an Excel 'Find=> TRUE'.  There are no TRUE so no NA data in the set.
#The data is cleran.
missingTemp1 <-is.na(CityClean1) # returns TRUE of any tempClean is missing
write.table (missingTemp1, file="outputCity1.csv", sep=",")
#Summary stats on CityClean
dim(CityClean1)
summary(CityClean1)
cat ("Temp Data is clean from NA\n")

#Clean up formats -- date, City, Country, Latitude, Longitude were all read
#in as factors.  
#CityClean$Country <- as.character (CityClean$Country)
CityClean1$Date <- as.character (CityClean1$Date)
#CityClean$City <- as.character (CityClean$City)
#CityClean$Latitude <- as.character (CityClean$Latitude)
#CityClean$Longitude <- as.character (CityClean$Longitude)
#CityClean$Date <- as.Date (CityClean$Date)   #Changing Date to Date class.
write.table (CityClean1, file="outCityClean1.csv", sep=",")

dim(CityClean1)






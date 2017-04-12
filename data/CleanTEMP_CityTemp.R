
setwd("./data")
#Clean TEMP.csv
tempRaw <- read.csv ("TEMP.csv", header=TRUE, sep=',')

class(tempRaw)
str(tempRaw)
head (tempRaw, 10)
tail (tempRaw, 10)

#Clean out blanks
tempClean <- tempRaw
tempClean[tempClean ==""] <- NA
tempClean <- tempClean[rowSums(is.na(tempClean)) == 0,]
#Checking file to ensure no NA. Since such a large dataset we ran a 
#'is.na' function which returns TRUE if there is an NA.  This is outputted 
#to 'output.csv' in the current working directory.  To ensure no NA, open 
#output.csv and do an Excel 'Find=> TRUE'.  There are no TRUE so no NA data in the set.
#The data is clean.
missingTemp <-is.na(tempClean) # returns TRUE of any tempClean is missing
write.table (missingTemp, file="outputTemp.csv", sep=",")
#Summary stats on tempClean
dim(tempClean)
summary(tempClean)
cat ("Temp Data is clean from NA\n")

#Clean up inconsistent date format and Country as a numeric. 
#Changing Date and Country to character for all entries.
#Then it is an option to change Date into class-Date or keep it as character.
#Chose to keep as Character to make comparison of Date >= "1900-01-01" easy.

tempClean$Country <- as.character (tempClean$Country)
tempClean$Date <- as.character (tempClean$Date)
#tempClean$Date <- as.Date (tempClean$Date)   #Changing Date to Date class.
class(tempClean$Date)
class(tempClean$Country)
cat ("Change Date & Country to character\n")


#####################################################
#Clean CityTemp.csv
CityRaw <- read.csv ("CityTemp.csv", header=TRUE, sep=',')
   
class(CityRaw)
str(CityRaw)
head (CityRaw, 10)
tail (CityRaw, 10)

#Clean out blanks
CityClean <- CityRaw
CityClean[CityClean ==""] <- NA
CityClean <- CityClean[rowSums(is.na(CityClean)) == 0,]
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
CityClean$Country <- as.character (CityClean$Country)
CityClean$Date <- as.character (CityClean$Date)
CityClean$City <- as.character (CityClean$City)
CityClean$Latitude <- as.character (CityClean$Latitude)
CityClean$Longitude <- as.character (CityClean$Longitude)
#CityClean$Date <- as.Date (CityClean$Date)   #Changing Date to Date class.
class(CityClean$Date)
class(CityClean$Country)
class(CityClean$City)
class(CityClean$Latitude)

dim(CityClean)

   
   


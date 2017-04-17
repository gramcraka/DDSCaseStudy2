setwd("./data")
#Clean temp1.csv
#temp.csv has about 500K observations.  You have a manually generated subset.
#The crux is there are multiple country entries and I need to get Monthly.AverageTemp
#max and min per country and plot the top 20.  
#I worked thru the mental exercise of nested 'for' loops. Came across Wickham's
#plyr package. Read his paper and figured ddplyr would split-apply-combine so I
#could plot.  Am I off on this assumption that plyr, specifically ddplyr is the 
#proper approach?
#Secondly, I am getting an error "Error in if (empty(.data)) return(.data) : 
#missing value where TRUE/FALSE needed".  I think this has to do with my
#.Country factor.  Either there is a hidden NA, which I can not find, or
#at the end of the factor something happens.  I was struggling with the
#debugger in the 'for' loops.  Setting a break in the function is not in my
#skill set yet.

tempRaw1 <- read.csv ("temp1.csv", header=TRUE, sep=',')

class(tempRaw1)
str(tempRaw1)
head (tempRaw1, 10)
tail (tempRaw1, 10)

#Clean out blanks & dropping Montly.AverageTemp.Uncertainty.
#Now down to some 250K observations
tempClean1 <- tempRaw1 [, -3]
tempClean1[tempClean1 ==""] <- NA
tempClean1 <- na.omit(tempClean1)
#tempClean <- tempClean1[rowSums(is.na(tempClean1)) == 0,]

#Checking file to ensure no NA. Since such a large dataset I ran a 
#'is.na' function which returns TRUE if there is an NA.  This is outputted 
#to 'output.csv' in the current working directory.  To ensure no NA, open 
#output.csv and do an Excel 'Find=> TRUE'.  There is no TRUE so no NA data in the set.
#...or so I think.  The data is clean. (?)
missingTemp <-is.na(tempClean1) # returns TRUE of any tempClean is missing
write.table (missingTemp, file="outputTemp1.csv", sep=",")

#Summary stats on tempClean
dim(tempClean1)
summary(tempClean1)
cat ("Temp Data is clean from NA\n")

#Clean up inconsistent date format 
#Chose to keep as Character to make comparison of Date >= "1900-01-01" easy.
tempClean1$Date <- as.character (tempClean1$Date)
#tempClean$Date <- as.Date (tempClean$Date)   #Changing Date to Date class.

cat ("Change Date to character\n")

#1.) Only take dates from 1900 and later. 
#Easier to write to a file and look to ensure I did this correctly.
temp1900a <- subset(x=tempClean1, tempClean1$Date >= "1900-01-01")
write.csv (temp1900a, file="OutTemp1900a.csv")
summary(temp1900a)
library(plyr)
#2.) Get max and min monthly average temps per country.  In older programming
#languages this would be nested 'for' loops. 

df_summarise <- ddply(temp1900a, .(Country), summarise,
                      temp_min = min(Monthly.AverageTemp), temp_max = max(Monthly.AverageTemp))
df_summarise$difference <- c(df_summarise$temp_max-df_summarise$temp_min)



#Then I get the error  "Error in if (empty(.data)) return(.data) : 
#missing value where TRUE/FALSE needed".  Reminds me of 'end of list' 
#indicator you would sometimes stick at the end and check for that marker
# in the 'for' loop to handle the exit....but I am stumped.  Help! Please!
#THANK YOU!


##########Extra code not used but afraid to delete just now....
#Create a list of unique country names
#countryList <- as.character (temp1900$Country)
#countryList<-unique(countryList)


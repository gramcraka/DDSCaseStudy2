#Find the difference between the maximum and the minimum monthly average 
#temperatures for each country and report/visualize top 20 countries 
#with the maximum differences for the period since 1900.

#Step 1. Build Data.Frame with rows from 1900-01-01 and greater.
temp1900 <- c(subset(x=tempClean, tempClean$Date >= "1900-01-01"))
summary(temp1900)
head(temp1900, 25)

#Step2. Build a Data.Frame for the max & min temps per country
#Date	Monthly.AverageTemp	Monthly.AverageTemp.Uncertainty	Country

#tempDF <- data.frame(Country=character()) 
#maxtemp=as.numeric(), 
#mintemp=as.numeric(),
#difference=as.numeric(),
#stringsAsFactors=FALSE) 

countryList <- as.character (temp1900$Country)
unique(countryList)
#initialize max and min temp holding variables
########################  Struggling on how to calculate max and min -- double loops
# or write a function? Does lapply work?  Out of my league a bit...

country_max <- function (Country, dataframe) {
  
}
max1=temp1900 %>% count(temp1900$Country, temp1900$Monthly.AverageTemp) %>% filter(n == max(n))
max2 = temp1900 %>% filter(temp1900$Country == countryList[i]) %>% count(temp1900$Country, temp1900$Monthly.AverageTemp)

i=1
j=1
for(i in 1:50)
{   
  maxtemp=0
  mintemp=0
  for (j in 1:temp1900)
    
    if (countryList[i] = temp1900$Country[j])
    {
      print(countryList[i])
      print(temp1900$Country[j])
      if (temp1900$Monthly.AverageTemp[i]>maxtemp)
        maxtemp=temp1900$Monthly.AverageTemp[i]
      print (maxtemp)
      else
        j = j+1
      ELSE EQU i = i+1
      
    }
  
}



# if temp1900$Monthly.AverageTemp[i] > maxtemp then 
#     maxtemp=temp1900$Monthly.AverageTemp[i] 
#if temp1900[i] < mintemp then mintemp=temp1900[i]

#elsif
print("hi")
#maxtemp = 0
#mintemp = 0
#endif
############################
#Select a subset of data called “UStemp” where US land temperatures from 
#01/01/1990 in Temp data. Use UStemp dataset to answer the followings.
#a)Create a new column to display the monthly average land temperatures 
#in Fahrenheit (°F). 
#b)Calculate average land temperature by year and plot it. 
#The original file has the average land temperature by month.  
#c)Calculate the one year difference of average land temperature 
#by year and provide the maximum difference (value) with corresponding two years.(for example, year 2000: add all 12 monthly averages and divide by 12 to get average temperature in 2000. You can do the same thing for all the available years. Then you can calculate the one year difference as 1991-1990, 1992-1991, etc) 
#############################
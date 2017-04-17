#Find the difference between the maximum and the minimum monthly average 
#temperatures for each country and report/visualize top 20 countries 
#with the maximum differences for the period since 1900.

#Step 1. Build Data.Frame with rows from 1900-01-01 and greater.
library(plyr)
temp1900 <- c(subset(x=tempClean, tempClean$Date >= "1900-01-01"))
write.csv (temp1900, file="OutTemp1900.csv")

#Create a list of unique country names
countryList <- as.character (temp1900$Country)
countryList<-unique(countryList)

#Start the plyr split-apply-combine with difference between country max and min
#Monthly.AverageTemp
summary(temp1900)

df_summarise <- ddply(temp1900, .(Country), summarise,
      (max(Monthly.AverageTemp) - min(Monthly.AverageTemp)))
#or
df_subset <- ddply(temp1900, .(Country), subset, (max(Monthly.AverageTemp) - min(Monthly.AverageTemp)))




#plot
R> plotpattern <- function(df) {
  + qplot(cyear, rbi / ab, data = df, geom = "line",
          + xlim = xlim, ylim = ylim)
  + }
R> pdf("paths.pdf", width = 8, height = 4)
R> d_ply(baseball, .(reorder(id, rbi / ab)), failwith(NA, plotpattern),
         + .print = TRUE)

R> coef_limits <- range(coefs_df$value)
R> coef_mid <- mean(coefs_df$value)
R> monthsurface <- function(mon) {
  + df <- subset(coefs_df, month == mon)
  + qplot(long, lat, data = df, fill = value, geom="tile") +
    + scale_fill_gradient(limits = coef_limits,
                          + low = brightblue, high = "yellow") +
    + map + opts(aspect.ratio = 1)
  + }
R> pdf("ozone-animation.pdf", width = 8, height = 8)
R> l_ply(month.abbr, monthsurface, .print = TRUE)
R> dev.off()
R> failed <- laply(models, function(x) !x$converged)


#for (i in 1:length(countryList)){
     
#max = 0
#min = 5000
#i=1
#j=1

#for (i in 1:length(countryList)){
#  for (j in 1:length(temp1900$Country)){
#       if (countryList[i] == temp1900$Country[j]) {
 #         if (temp1900$Monthly.AverageTemp[j] > max) {max = temp1900$Monthly.AverageTemp[j]}
 #        
 #         else if (temp1900$Monthly.AverageTemp[j] < min) {min = temp1900$Monthly.AverageTemp[j]}
 #       else {print (max)
 #         print (min)
 #         j = j+ 1
 #         print (j)} 
 #      }
    
 # }
 # print (temp1900$Country[j])
 # tempDF[nrow(tempDF)+ 1, ]<- c(temp1900$Country[j], max, min, max-min)
 # max = 0
 # min = 0
 # i = i+ 1 #rith?
#}      
 
    
head(tempDF, 25)
#max1=temp1900 %>% count(temp1900$Country, temp1900$Monthly.AverageTemp) %>% filter(n == max(n))
#max2 = temp1900 %>% filter(temp1900$Country == countryList[i]) %>% count(temp1900$Country, temp1900$Monthly.AverageTemp)

############################
#Select a subset of data called “UStemp” where US land temperatures from 
#01/01/1990 in Temp data. 
#UStemp$Date <- as.Date.POSIXct (UStemp$Date, "%Y-%m-%d")

UStemp <- subset(x=tempClean, Country == "United States")
UStemp <- na.omit(UStemp)
#UStemp <- subset(UStemp, as.character(UStemp$Date) >= as.character("1990-01-01"))
write.csv (UStemp, file="OutUS1.csv")
UStemp$Date <- as.Date.default(UStemp$Date, "%Y-%m-%d")

#Use UStemp dataset to answer the followings.
#a)Create a new column to display the monthly average land temperatures 
#in Fahrenheit (°F). 

UStemp$Monthly.AverageTemp.Land <- apply(UStemp[])

#b)Calculate average land temperature by year and plot it. 

#The original file has the average land temperature by month.  
#c)Calculate the one year difference of average land temperature 
#by year and provide the maximum difference (value) with 
#corresponding two years.
#(for example, year 2000: add all 12 monthly averages and 
#divide by 12 to get average temperature in 2000. 
#You can do the same thing for all the available years. 
#Then you can calculate the one year difference as 1991-1990, 1992-1991, etc) 
#############################
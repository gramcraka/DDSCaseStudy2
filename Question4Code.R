#Find the difference between the maximum and the minimum monthly average 
#temperatures for each country and report/visualize top 20 countries 
#with the maximum differences for the period since 1900.

#Step 1. Build Data.Frame with rows from 1900-01-01 and greater.
library(plyr)
library(ggplot2)

temp1900 <- subset(x=tempClean, tempClean$Date >= "1900-01-01")

#Start the plyr split-apply-combine with difference between country max and min
#Monthly.AverageTemp. Compute the difference between maximum & minimum temperature
#and order the result.

df_summarise <- ddply(temp1900, .(Country), summarise,
                      temp_min = min(Monthly.AverageTemp), temp_max = max(Monthly.AverageTemp))
df_summarise$difference <- c(df_summarise$temp_max-df_summarise$temp_min)

#Order the output and display it
df_ordered <- df_summarise[order(-df_summarise$difference),]
head(df_ordered, 20)
#Skinny down data frame to only what needs to be plotted
df_skinny<- df_ordered[1:20,c(1,4)]
df_skinny
complete.cases(df_skinny)
df_skinny



#plot

ggplot(data=df_skinny, aes(x=Country, y=difference, fill=factor(difference))) +
     geom_bar(position="dodge",stat="identity") +
     geom_col(position = "stack", show.legend = FALSE, inherit.aes = TRUE) +
     coord_flip() +
     ylab("Scale for Difference in Max - Min\n Monthly Average Temp") +
     xlab("Countries") +
     ggtitle("Swing in Monthly Average Temperatures\nTop 20 Countries") +
     scale_fill_grey() +
     theme(aspect.ratio = 2/1) +
     theme(legend.position="none")
    




############################
#Select a subset of data called “UStemp” where US land temperatures from 
#01/01/1990 in Temp data. 


UStemp <- subset(x=tempClean, Country == "United States")
UStemp$Date <- as.Date(UStemp$Date)
UStemp$Date <- format.Date(UStemp$Date, format="%Y-%m-%d")
UStemp <- subset(x=tempClean, Date = "1990-01-01")
UStemp <- na.omit(UStemp)
write.csv (UStemp, file="OutUS.csv")

#UStemp <- UStemp[UStemp$Date >= as.Date=("1990-01-01"),]


#Use UStemp dataset to answer the followings.
#a)Create a new column to display the monthly average land temperatures 
#in Fahrenheit (°F). 

UStemp["MonthlyLand"] <- NA
UStemp$MonthlyLand <- c((UStemp$Monthly.AverageTemp * 1.8) + 32)
#UStemp[,-"Monthly.AverageTemp.Land"]
row.names(UStemp) <- NULL
write.csv (UStemp, "OutUS2.csv")
UStemp$Date <- factor(UStemp$Date)
#b)Calculate average land temperature by year and plot it.
UStemp <-tapply(UStemp, as.Date(UStemp$Date, format="%Y-%m-%d"), FUN=mean(UStemp$MonthlyLand))
UStempTS <- ts(UStemp, start=c(1990,1))
UStemp <- na.omit(UStemp)
UStempTS <- na.omit(UStempTS)
UStempTSdecomp <- decompose(UStempTS)
plot.ts(UStempTS)

YearLandTemp <- ddply (UStemp, .(Date), summarise, mean(UStemp$MonthlyLand))
#The original file has the average land temperature by month.  
#c)Calculate the one year difference of average land temperature 
#by year and provide the maximum difference (value) with 
#corresponding two years.
#(for example, year 2000: add all 12 monthly averages and 
#divide by 12 to get average temperature in 2000. 
#You can do the same thing for all the available years. 
#Then you can calculate the one year difference as 1991-1990, 1992-1991, etc) 
#############################
temp1900TS <- ts(temp1900, start=c(1900,1))
write.csv (temp1900TS, file="OutTemp1900.csv")
#So if I make tep1900TS a time series, can I apply plyr or do I do a time series manipulation?

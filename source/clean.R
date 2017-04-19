##### TEMP #####
df <- read.csv(file.path('data', "TEMP.csv"), header=TRUE, sep=',')

# remove unneeded fields
df <- df[, -3]

# rename the rows
names(df) <- c('Date', 'Temperature', 'Country')

# remove nan rows
df <- na.omit(df)

# convert 'Temperature' column to numeric tyope
df$Temperature = as.numeric(df$Temperature)

# convert Date field to type Date
df$Date = as.character(df$Date)
# work on rows with '-' in date
dash_rows = grep('-', df$Date)
df$Date[dash_rows] = as.character(as.Date(df$Date[dash_rows], "%Y-%m-%d"))
# work on rows with '/' in date
slash_rows = grep('/', df$Date)
df$Date[slash_rows] = as.character(as.Date(df$Date[slash_rows], "%d/%m/%Y"))
# convert to type Date
df$Date = as.Date(df$Date)

write.table(df, file.path('data', "TEMP_clean.csv"), row.names = FALSE, sep=',')
cat("Temp.csv was cleaned into TEMP_clean.csv successfully!\n")

##### CityTemp #######################
dfCity <- read.csv(file.path('data', "CityTemp.csv"), header=TRUE, sep=',', stringsAsFactors = FALSE)

# keep only needed columns
# do we only need those 3?
dfCity <- dfCity[, c(1,2,5,4)]

# remove nan rows
dfCity <- na.omit(dfCity)
tail(dfCity)
# rename the rows
names(dfCity) <- c('Date', 'Temperature', 'Country', 'City')

# leave Date as character in order to get search to align.
dfCity$Date = as.character(dfCity$Date)
# convert 'Temperature' column to numeric tyope
dfCity$Temperature = as.numeric(dfCity$Temperature)

write.table(dfCity, file.path('data', "CityTemp_clean.csv"), row.names = FALSE, sep=',')

cat("CityTemp.csv was cleaned into CityTemp_clean.csv successfully!\n")


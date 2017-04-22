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
dfCity <- dfCity[, c(1,2,5,4)]

# rename the rows
names(dfCity) <- c('Date', 'Temperature', 'Country', 'City')

# convert to date
# convert Date field to type Date
dfCity$Date = as.character(dfCity$Date)
# work on rows with '-' in date
dash_rows = grep('-', dfCity$Date)
dfCity$Date[dash_rows] = as.character(as.Date(dfCity$Date[dash_rows], "%Y-%m-%d"))
# work on rows with '/' in date
slash_rows = grep('/', dfCity$Date)
dfCity$Date[slash_rows] = as.character(as.Date(dfCity$Date[slash_rows], "%d/%m/%Y"))
# convert to type Date
dfCity$Date = as.Date(dfCity$Date)

# convert 'Temperature' column to numeric tyope
dfCity$Temperature = as.numeric(dfCity$Temperature)

# remove nan rows
dfCity <- na.omit(dfCity)

write.table(dfCity, file.path('data', "CityTemp_clean.csv"), row.names = FALSE, sep=',')

cat("CityTemp.csv was cleaned into CityTemp_clean.csv successfully!\n")


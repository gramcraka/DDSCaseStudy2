##### TEMP #####
df <- read.csv(file.path('data', "TEMP.csv"), header=TRUE, sep=',')

# remove unneeded fields
df <- df[, -3]

# rename the rows
names(df) <- c('Date', 'Temperature', 'Country')
# Do we have to do this?
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

write.table(df, file.path('data', "TEMP_clean.csv"), row.names = FALSE)
cat("Temp.csv was cleaned into TEMP_clean.csv successfully!\n")

##### CityTemp #####
df <- read.csv(file.path('data', "CityTemp.csv"), header=TRUE, sep=',')

# keep only needed columns
# do we only need those 3?
df <- df[, c(1,2,5,4)]

# rename the rows
names(df) <- c('Date', 'Temperature', 'Country', 'City')

# convert Date field to type Date
df$Date = as.Date(df$Date, "%Y-%m-%d")

# convert 'Temperature' column to numeric tyope
df$Temperature = as.numeric(df$Temperature)

write.table(df, file.path('data', "CityTemp_clean.csv"), row.names = TRUE)

cat("CityTemp.csv was cleaned into CityTemp_clean.csv successfully!\n")

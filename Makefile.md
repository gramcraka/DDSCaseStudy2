# Makefile
Ivelin Angelov, Laura Bishop, Ethan Graham, Scott Gozdzialski  
# This is the project's Makefile.
This file will execute the tasks: dependencies, download, clean, merge and render
All tasks are in separate cells and represent steps towards the final data analysis of the "Case Study 1" prject.
In order to keep the project modular and easy to maintain, we keep the code for all tasks into separate R files.

#### <font color='red'>In order to Knit this file you need to have R Working Directory set to the root of the project.</font>

## Dependencies
Before we start, we make sure all packages needed for the project are installed.

```r
needed_packages = c('downloader', 'ggplot2', 'scales', 'Hmisc', 'lattice', 'htmlTable', 'plyr')
for (needed_package in needed_packages) {
  if(needed_package %in% rownames(installed.packages()) == FALSE) {
    install.packages(needed_package, repos = structure(c(CRAN = "http://cran.r-project.org")))
  }
}
```

## Download
This task is used for downloading of all necessary data for the project in  .csv format.
The files are downloaded from their original locations as given by the assignment.

```r
source(file.path("source", "download.R"), verbose=FALSE)
```

```
## Data was downloaded successfully!
## Data was downloaded successfully!
```

```r
# For details see source/download.R
```
## Tidy
This section tidys up the data

```r
# Cleans TEMP-rature data: 
#   TEMP.csv -> TEMP_clean.csv
#   CityTemp.csv -> CityTemp_clean.csv
source(file.path("source", "clean.R"), verbose=FALSE)
```

```
## Temp.csv was cleaned into TEMP_clean.csv successfully!
## CityTemp.csv was cleaned into CityTemp_clean.csv successfully!
```

```r
# For details see source/clean.R
```

## This file is used for downloading of all necessary for the project csv data files.
# In order to run this file you need to have R Working Directory set to the root of the project.
# Authors: Ivelin Angelov, Laura Bishop, Ethan Graham, Scott Gozdzialski

# Attempt to install downloader only in case not installed
if("downloader" %in% rownames(installed.packages()) == FALSE){
  install.packages("downloader", repos = structure(c(CRAN="http://cran.r-project.org")))
}
# Load package "downloader"
require(downloader)

# Download data to file data/TEMP.csv
url = 'https://smu.box.com/shared/static/vb641paqi7pemsv8ive17bimtjn3x7rj.csv'
download.file(url = url, destfile = file.path("data", "TEMP.csv"))
cat("Data was downloaded successfully!\n")

url = 'https://smu.box.com/shared/static/gx8ve1kgttetg79jbuzv4px49mcff8tq.csv'
download.file(url = url, destfile = file.path("data", "CityTemp.csv"))
cat("Data was downloaded successfully!\n")

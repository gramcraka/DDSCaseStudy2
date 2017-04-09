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
url = 'https://smu.box.com/shared/static/qx5akwtmmv7x7qhtdmqxqy636cq7ff2d.csv'
download.file(url = url, destfile = file.path("data", "TEMP.csv"))
cat("Data was downloaded successfully!\n")

# Download data to file data/CityTemp.csv
url = 'https://smu.box.com/shared/static/yah71zw7zxp87ebofxb6h5hs6crv7jvz.csv'
download.file(url = url, destfile = file.path("data", "CityTemp.csv"))
cat("Data was downloaded successfully!\n")

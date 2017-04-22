# Makefile
Ivelin Angelov, Laura Bishop, Ethan Graham, Scott Gozdzialski  
# This is the project's Makefile.
This file will execute the tasks: dependencies, download, clean and render
All tasks are in separate cells and represent steps towards the final data analysis of the "Case Study 2" prject.
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
This taks is used for downloading of all data files, in this case happen to be in .csv format.
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
This cell will tidy the data files.
After execution, two files will be created: data/TEMP_clean.csv and data/CityTemp_clean.csv

```r
# Cleans gdp data: 
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
## Render
This taks will render the Analysis into a HTML file. 
Analysis.Rmd contains all the data analysis for the project.

```r
rmarkdown::render("Analysis.Rmd")
```

```
## 
  |                                                                       
  |                                                                 |   0%
  |                                                                       
  |...                                                              |   5%
##   ordinary text without R code
## 
## 
  |                                                                       
  |.......                                                          |  11%
## label: unnamed-chunk-1
## 
  |                                                                       
  |..........                                                       |  16%
##   ordinary text without R code
## 
## 
  |                                                                       
  |..............                                                   |  21%
## label: unnamed-chunk-2
```

```
## 
  |                                                                       
  |.................                                                |  26%
##   ordinary text without R code
## 
## 
  |                                                                       
  |.....................                                            |  32%
## label: unnamed-chunk-3
```

```
## 
  |                                                                       
  |........................                                         |  37%
##   ordinary text without R code
## 
## 
  |                                                                       
  |...........................                                      |  42%
## label: unnamed-chunk-4
## 
  |                                                                       
  |...............................                                  |  47%
##   ordinary text without R code
## 
## 
  |                                                                       
  |..................................                               |  53%
## label: unnamed-chunk-5
## 
  |                                                                       
  |......................................                           |  58%
##   ordinary text without R code
## 
## 
  |                                                                       
  |.........................................                        |  63%
## label: unnamed-chunk-6
```

```
## 
  |                                                                       
  |............................................                     |  68%
##   ordinary text without R code
## 
## 
  |                                                                       
  |................................................                 |  74%
## label: unnamed-chunk-7
## 
  |                                                                       
  |...................................................              |  79%
##   ordinary text without R code
## 
## 
  |                                                                       
  |.......................................................          |  84%
## label: unnamed-chunk-8
## 
  |                                                                       
  |..........................................................       |  89%
##   ordinary text without R code
## 
## 
  |                                                                       
  |..............................................................   |  95%
## label: unnamed-chunk-9 (with options) 
## List of 5
##  $ echo      : logi FALSE
##  $ fig.height: num 5
##  $ fig.width : num 4
##  $ fig.show  : chr "hold"
##  $ out.extra : chr "style=\"float:left\""
```

```
## 
  |                                                                       
  |.................................................................| 100%
##   ordinary text without R code
## 
## 
## /Applications/RStudio.app/Contents/MacOS/pandoc/pandoc +RTS -K512m -RTS Analysis.utf8.md --to html --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output Analysis.html --smart --email-obfuscation none --self-contained --standalone --section-divs --template /Library/Frameworks/R.framework/Versions/3.3/Resources/library/rmarkdown/rmd/h/default.html --no-highlight --variable highlightjs=1 --variable 'theme:bootstrap' --include-in-header /var/folders/df/2w6dv0r11pb69jhk8lzjjb_m0000gn/T//RtmpUJhxBR/rmarkdown-str3f087f8e984f.html --mathjax --variable 'mathjax-url:https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
```

```r
# For details see Analysis.Rmd
```

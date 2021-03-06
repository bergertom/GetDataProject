##############################################################################################################################
# This script prepares the dataset for wearable computing
#
# all the real work is done in CodeBook.Rmd which
# - creates the tidy data-set
# - and at the same time renders the codebook
##############################################################################################################################
#setwd("~/GitHub/GetDataProject")
#source("run_analysis.R")
require(rmarkdown)
require(data.table)
library(dplyr)

# check if the ZIP file is downloaded, it not then download it
file <- "getdata-projectfiles-UCI HAR Dataset.zip"
if (!file.exists(file)) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    message(sprintf("start downloaded from '%s'", url))
    download.file(url, file.path(getwd(), file))
    message(sprintf("downloaded '%s' from '%s'", file, url))
}

# I'm using the name of the expanded ZIP file as is (without moving files around)
datadir <- "UCI HAR Dataset" 
if (!dir.exists(datadir))
    stop(sprintf("'%s' folder not found in working directory", datadir))

render("CodeBook.Rmd", "md_document", encoding="UTF-8")

# that's all folks!

#
#   Description: Setting up the environment before demo
#                Run this script first
#   Date: 2016, August 15
#   Copyright (C) 2016 Paula Andrea Martinez
#


# To run the demo some packages need to be previously installed.
# Check installed packages before intalling new packages.
list.of.packages <- c("sqldf", "dplyr", "plyr", "RSQLite")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Setting up folder structure
if (! file.exists("data")) dir.create("data")
if (! file.exists("rawdata")) dir.create("rawdata")
if (! file.exists("plots")) dir.create("plots")
if (! file.exists("scripts")) dir.create("scripts")

# Downloading Data from gapminder
if (!file.exists("rawdata/gapminder-SWC.csv")) {
  download.file("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv",
                "rawdata/gapminder-SWC.csv")
}
if (!file.exists("rawdata/gapminder-internetusers.csv")) {
  download.file("https://spreadsheets.google.com/pub?key=0AkBd6lyS3EmpdGwzSGV5OE9FOGhURlhTdEQtMW1TNkE&output=csv",
                "rawdata/gapminder-internetusers.csv")
}


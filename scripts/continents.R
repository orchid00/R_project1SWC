#!/usr/bin/env Rscript
# Title: creates my continents plot
# Author: Paula Andrea Martinez
# Date: Sept 29th, 2015
# Version: 0.01

#we are adding this script to git!

#assume you have the ggplot2 package installed already 
#call ggplot2 using library
#for later add an if condition to test if the package is there
library("ggplot2")

#assume you have the gapminder.RData into the data folder
#load your data
#for later add an if condition to test if the RData is there
load("data/gapminder.RData")

#create a function that draws the plots per continent
#It is a multifigure plot
draw_dots_continents <- function(gapminder){
  p<-
    ggplot(data= gapminder, aes(x=year, y=lifeExp, color=country)) +
    geom_point(aes(color=continent)) +
    facet_grid(. ~ continent) +
    theme(legend.position="none",
          axis.text.x = element_text(angle = 90))
  print(p)
}

#make a function to save your plot as png
make_pngplot <- function(name){
  png(filename=paste(name,".png",sep=""))
  draw_dots_continents(gapminder) 
  dev.off()
}

#How to receive arguments from the comand line
args <- commandArgs(TRUE)
try(make_pngplot(args[1]))

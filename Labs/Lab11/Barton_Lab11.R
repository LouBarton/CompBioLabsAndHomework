# Lab 11: Data filtering, subsetting, summarizing, and plotting 
# order(), arrange() and summarise() in dplyr, and ggplot 
# Louise Barton 
# 5 April 2019 

#install.packages("tidyverse")
library(tidyverse)

# -------------- read in and clean data ------------------ #
data <- read.csv(("GlobalWoodDensityDatabase.csv"), stringsAsFactors=F)

#rename density column 
    colnames(data)[colnames(data)=="Wood.density..g.cm.3...oven.dry.mass.fresh.volume"] <- "Wood.desity"

#Find(whichrow) and remove NA(entire row) in Wood.density column 
which(is.na(data$Wood.desity)) #line 12150 
    #data$Wood.desity[12151] 
data <- data[complete.cases(data),]
    #data$Wood.desity[12151] 


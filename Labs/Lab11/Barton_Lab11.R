# Louise Barton 
# 5 April 2019 
# Lab 11: Data filtering, subsetting, summarizing, and plotting 
# order(), arrange() and summarise() in dplyr, and ggplot 

#install.packages("tidyverse")
library(tidyverse)

# [Problems 1:4] -------------- read in and clean data ------------------ #
data <- read.csv(("GlobalWoodDensityDatabase.csv"), stringsAsFactors=F)

#rename density column 
colnames(data)[colnames(data)=="Wood.density..g.cm.3...oven.dry.mass.fresh.volume"] <- "Wood.density"

#Find(whichrow) and remove NA(entire row) in Wood.density column 
which(is.na(data$Wood.density)) #line 12150 
    #data$Wood.desity[12151] 
data <- data[complete.cases(data),]
    #data$Wood.desity[12151] 

# [Problem 5] -------------- Combine to eliminate psedo-replication ------------------ #
#**this took me FOREVER to figure out.. because i initially saved Wood.density as "Wood.desity"
#create new data frame with each species listed once, with Family and Binomial info 
#for each species, and with the mean of thh density msmnts for each species 
cat(names(data)) #names of variables in data frame
length(unique(data$Binomial)) #8412
newdf <- summarize(group_by(data, Binomial, Family), MeanDensity=mean(Wood.density))
length(newdf$MeanDensity) #8412 checks out 


# [Problem 6] -------------- Contrasting most and least dense families ------------------ #

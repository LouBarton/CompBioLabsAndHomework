# Louise Barton 
# 5 April 2019 
# Lab 11: Data filtering, subsetting, summarizing, and plotting 
# order(), arrange() and summarise() in dplyr, and ggplot 

install.packages("tidyverse")
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
#which families of trees have the greatest and least densities. 
#new data frame with average density for each family 
family_df <- summarize(group_by(data, Family), MeanDensity=mean(Wood.density))
family_df
length(family_df$MeanDensity) #191 checks out 

#sort families by density 
fam_dfSorted <- family_df[order(family_df$MeanDensity), c(1,2)]

#8 families with highest average densities
top <- head(fam_dfSorted, 8)
top$Family

#8 families with lowest average densities 
low <- tail(fam_dfSorted, 8)
low$Family

#------# WEEK TWO START #-------#

#[Problem 7] Plotting desities of most and least dense families with facets 
#Densities of individual species from the families with the highest average densities

#subset data if family == family in top 
topData <- newdf[newdf$Family %in% top$Family,]
head(topData)

#graph densities of species in top 8 families 
ggplot(data=topData, mapping=aes(y=MeanDensity)) + 
    geom_boxplot() + facet_wrap( ~Family, scales="free")

#Densities of individual species from families with the lowest average densities 
lowData <- newdf[newdf$Family %in% low$Family,]
head(lowData)

#graph densities of species in lowest 8 families 
ggplot(data=lowData, mapping=aes(y=MeanDensity)) + 
    geom_boxplot() + facet_wrap( ~Family, scales="free")

#[Problem 8] Facilitating comparisions with graphics 
#merge plots from former problem and flip coordinates 
ggplot(topData) + geom_boxplot(aes(y=MeanDensity, x=Family)) + coord_flip()
ggplot(lowData) + geom_boxplot(aes(y=MeanDensity, x=Family)) + coord_flip()

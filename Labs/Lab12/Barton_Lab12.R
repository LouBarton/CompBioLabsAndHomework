# Louise Barton 
# 12 April 2019 
# Lab 12: Choose your own adventure with ggplot()

#PROBLEM 1: make plot with x=Species, y=count from Cusack et al. data
data <- read.csv("trail_cam.csv")

#make variable for count of each species 
SpeciesCount <- data %>% count(Species)
head(SpeciesCount)

#plot counts 
ggplot(data=SpeciesCount, aes(x=Species, y=n)) + geom_bar(stat="identity")

#PROBLEM 2: turn x labels 90 degeres 
ggplot(data=SpeciesCount, aes(x=Species, y=n)) + geom_bar(stat="identity") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

#PROBLEM 3: flip axes, sort speces from least to most abundant, and 
#transofmr count axis to be logarithmic to see smaller counts easier.
SpeciesCount$Species <- factor(SpeciesCount$Species, 
    levels = SpeciesCount$Species[order(SpeciesCount$n)])

ggplot(data=SpeciesCount, aes(x=Species, y=n)) + geom_bar(stat="identity") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + coord_flip() + 
    scale_y_log10()

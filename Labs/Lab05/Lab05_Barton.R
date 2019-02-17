#Louise Barton | February 15th 
#Lab 05:Loops and Conditions 

#Set working directory 
setwd('/Users/kristinbarton/Desktop/Compbio/CompBioLabsAndHomework/Labs/Lab05')

#1: If else loop to determine if value is larger or smaller than 5 
    x <- 9 
    if ( x > 5 ) {
        print( "larger than 5" )
    } else {
        print( "smaller than 5" )
    }

#2: Import "Vector1.csv" file and look at data
    data <- read.csv( "Vector1.csv" )
    head(data)

#2a: for() loop to replace any negative values with NA 
    for ( i in 1:nrow(data) ) {
        if ( data$x[i] < 1 ) {
            data$x[i] <- NA
        }
    }

#2b: vectorized code to replace NA with NaN 
    data$x[is.na(data$x)] <- "NaN"

#2c: which() statement to replace NaN values with zero 
    vector <- which(data$x == "NaN")
    data$x[vector] <- "0"
    
#2d and 2e:determines how many values in data fall between 50 and 100 
values <- (data$x)
values <- as.numeric(values)

FiftyToOneHundredindex<- which( values >= 50 & values <= 100 ) 
FiftyToOneHundred<- values[FiftyToOneHundredindex]
FiftyToOneHundred
length(FiftyToOneHundred) #498 

#2f: write vector to new .csv file 
write.csv( x = FiftyToOneHundred, file = "FiftyToOneHundred.csv" )

#3 
emissionsdata <- read.csv('CO2_data_cut_paste.csv', 
                    colClasses=c( 'integer', rep('numeric', 7) ) )
str(emissionsdata)

#3a:emissions was non zero in year.. 
which(emissionsdata$Gas > 0) #135

#3b:years total emissions was between 200 and 300 
yearsTotal <- which(emissionsdata$Total >= 200 & emissionsdata$Total <= 300)
yearsTotal <- emissionsdata$Year[yearsTotal]
yearsTotal # 1879-1887 

## PART TWO: Loops and conidtionals + biology 

totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators
Gens <- seq(1:totalGenerations)
n <- rep(initPrey, totalGenerations)
p <- rep(initPred, totalGenerations)

#for loop to implement calculations of abundance of prey and 
#predators over generations (n[i], p[i] respectfully); replace negative numbers with zero

for( i in 2:totalGenerations) {
    n[i] <- n[i-1] + ( r * n[i-1] ) - ( a * n[i-1] * p[i-1] )
    p[i] <- p[i-1] + ( k * a * n[i-1] * p[i-1] ) - ( m * p[i-1] )
    if (n[i] < 0) {
        n[i] <- 0
    }
    if (p[i] < 0) {
        p[i] <- 0
    }
}

#plot abundances of prey and predators over time 
plot( n ~ Gens, pch = 16, col = "lightgreen", cex = .6,
     ylab = "abundance", xlab= "generations" )
lines(Gens, p)
legend( "topright", legend=c("predator", "prey"), 
       col = c("black", "lightgreen"), lty = 1:2, box.lty = 0 )

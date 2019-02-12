#Louise Barton | Feb 08 2019 
#Lab04: For loops and combining them with data collection via array indexing 

##----------------------------------------------------------------------------------##

#Part1: Practice writing "for loops"

#Q1: Loop that prints hi 10x
for (i in seq(1:10) ) {
    print ("Hi") 
}

#Q2: Loop that prints weekely savings over 8 weeks when initially starting with 10$. 
#Tim recieves 5$/week allowance and spends (1.34$*2)/week on gum 
savings <- 10
allowance <- 5
weeklyspend <- 2 * 1.34
weeks <- 8 

for (i in seq(1:weeks) ) {
    savings <- savings + allowance - weeklyspend
    print(savings)
}
    
#Q3: Loop that prints predicted yearly population size for the next 7 years 
#Population size starts at 2000 and shrinks by 5% each year

shrinkrate <- .05
population <-2000
years <- 7 
for (i in seq(1:years) ) {
    population <- population - (population * shrinkrate)
    print(population)
}

#Q4: Loop that prints predicted population abundance over 12 time stamps 
#Loop uses discrete-time logistic growth equation n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

K <- 10000 #carying capacity 
r<- 0.8 #instristic growth rate 
time <- 12 #time stamps
iAbund <- 2500 #inital abundance 
n <- rep(iAbund,time) #create vector with initial abundance 

#Method which creates vector of predicted population abundances 
for (i in 2:time ) {
    n[i] <- n[i-1] + ( r * n[i-1] * ( K - n[i-1] ) / K )
    print(n[i])
}

#Alternative method: does not create vector 
abundance <- 2500 #initial abundance

for (i in 1:time ){
    abundance <- abundance + ( r * abundance * (K-abundance) / K )
    print(abundance)
}

##------------------------------------------------------------------------------------##

#Part II: practicing writing "for loops" 
#AND practice storing the data produced by your loops in arrays 

#Q5: Practicing basics of array indexing using loops
    #Q5a: create vector of 18 zeros 
    vector <- rep(0,18) 

    #Q5b:loop with 18 iterations that stores 3 times the ith value of
    #the iterator variable (i) in the ith spot of the vector crated in 5a
    for ( i in seq(1,18) ) {  
        vector[i] <- 3 * i
        print(vector[i])
    }

    #Q5c:vector of zeros where first element has value of 1 
    vectornew <- rep(0,18)
    vectornew[1] <- 1
    vectornew

    for(i in seq(2,18) ) {
        vectornew[i] <- ( 1 + 2 * vectornew[i-1] )
        print(vectornew[i])
    }

#Q6:loop that calculates the first 20 Fibonacci #s
#in the Fibonacci sequence, every # after ther first 2 is the sum of the two preceeding #s
    
fibonacci <- rep(1,20) #create vector of ones because first 2 #s are 1 
length <-20

for(i in seq(3,length) ) {
    fibonacci[i] <- fibonacci[i-1] + fibonacci[i-2]
    print(fibonacci[i-2])
}

#Q7: comment noted in question 4, see above 

##-------------------------------------------------------------------------------------##

#Part III (Q8): for 'funsies' 

#emissions expressed in mill metric tons of C. 
#To convert to units of CO2 multiple x 3.67 
#per capita emissions est are expressed in metric tons of C 

#Set working directory and read in CO2 data 
setwd('/Users/kristinbarton/Desktop/Compbio/CompBioLabsAndHomework/Labs/Lab04')
data <-read.csv('CO2_data_cut_paste.csv')
head(data) #examine structure of data 
str(data) #check class of columns- all integer except PerCapita

#convert columns 2-8 to be "numeric" rather than "integer" 
    #...using read.csv()
    data <- read.csv('CO2_data_cut_paste.csv', 
            colClasses=c('integer', rep('numeric',7) ) )
    str(data) #check class- all numeric except year 

    #...using for loop 
    for (i in 2:8) {
        data[,i] <- as.numeric(data[,i])
        str(data)
    }

#Caculate percent change for columns 2-8 from year to year and store 
#...using element-by-element operations 
    
    #duplicate data frame and correct classes: this one will be manipulated with calculations 
    PCdata1 <- read.csv( 'CO2_data_cut_paste.csv', colClasses=c('integer', rep('numeric',7) ) )
    
    install.packages(dplyr)
    library(dplyr)
    
    #this is wrong (calculates change from start..)
    transform(PCdata1,Solids= ((Solids - Solids[1] ) / Solids[1] ) * 100)


#Caculate percent change for columns 2-8 from year to year and store 
#...using for loop
    
    #duplicate data frame and correct classes: this one will be manipulated with calculations 
    PCdata <- read.csv( 'CO2_data_cut_paste.csv', colClasses=c('integer', rep('numeric',7) ) )

    #Create funciton to apply is.nan to data frame 
    is.nan.data.frame <- function(x)
    do.call(cbind, lapply (x, is.nan) )
    
    #for loop to calculate yearly percent change across columns 2:8 and replace NaNs/Na with O
    for (i in 2:nrow(PCdata) ) {
        PCdata[i,2:8] <- ( ( ( PCdata[i+1,2:8] - PCdata[i,2:8] ) / PCdata[i,2:8] ) * 100 )
        PCdata[is.nan(PCdata)] <- 0
        PCdata[is.na(PCdata)] <- 0
    }

#Compare results between methods 

#save calculations from above to new csv file 
    
#Calculate precent change for columns 2-8 from first year for which 
#there is non-zero data and save calculations to new csv file 


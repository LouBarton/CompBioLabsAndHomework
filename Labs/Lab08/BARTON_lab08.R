#Louise Barton | March 07 2019 
#Lab08: Documentation and Metadata

##----------------------------------------------------------------------------------##

#Loop that prints predicted population abundance over 12 time stamps 
#Using discrete-time logistic growth equation n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

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

#function to print predicted population abundance over time in vector and graph
#uses discrete-time logistic growth equation n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
#takes r, K, time, iAbund as arguments 
#r=intrinsic growth rate, K=carrying capacity, and iAbund=initial abundance 

#specify how much time (i.e how many time steps to iterate with model)
    DTLogGrowth <- function (r,K,time,iAbund) {
        n <- rep(iAbund, time)
        for (i in 2:time ) {
            n[i] <- n[i-1] + ( r * n[i-1] * ( K - n[i-1] ) / K )
        }
        plotGrowth <- plot(n ~ c(1:time), pch = 16, cex = .6,
                           ylab = "abundance", xlab= "generations" )
        print(plotGrowth)
        return(n)
        
    }

#Assign variables 
r <- 0.8
K <- 10000
time <- 12 
iAbund <- 2500

#Call function
abundance <- DTLogGrowth(r, K, time, iAbund)

#Write dataset to file with two columns: generations and abundance
PopAbund <- data.frame((1:time), (abundance))
colnames(PopAbund) <- c("Generations", "Abundance")
write.csv(x = PopAbund, file = "PopAbund.csv")


#Louise Barton | Lab07 | 27 February 2019 

#Problem I: Area of a triangle when given base and height 
#Function definition 
triangleArea<- function(base, height) {
    #two sides, base and height must be given 
    #area equals base * height divided by 2
    triangleArea <-  (base * height) / 2 
    return( triangleArea )
}
#Demonstration of usage 
triangleArea(2,4) #Area is 4 

#-----------------------------------------------------------------------# 

#Problem II: Abosolute values  
#Function definition 
myAbs <- function(x) {
    #mutiply value x times -1 or 1 to get abs(x) 
    #if positive v>0 is true and will = 1 
    #if negative v<0 is true and will = -1
    myAbs <- x * ( (x > 0) - (x < 0) )
    return(myAbs)
}
#Demonstration of usage 
    #with number 5 
    myAbs(5)
    #with number -2.3 
    myAbs(-2.3)
    #with vector c(1.1, 2, 0, -4.3, 9, -12)
    myAbs(c(NA, 2, 0, -4.3, 9, -12))
#-----------------------------------------------------------------------# 

#Problem III: First n Fibonacci numbers, where n is any integer >=3 
#Function definition

Fibonacci <- function(n,start) {
    #n is how many numbers of Fibonnaci sequence to return 
    #start is if sequence should start at 1 or 0
    if(n < 3) { 
        return("Enter number > 3")
    } else {
        x <- c(start, 1)
        while (length(x) < n) {
            position <- length(x)
            new <- x[position] + x[position - 1]
            x <- c(x,new)

        }
        return(x)
    }
}

#Demonstration of usage 
Fibonacci(4,0)
Fibonacci(4,1)
Fibonacci(2,1)

#BONUSa: make function work for n=1 and n=2 

Fibonacci <- function(n,start) {
    if (n == 1) {
        return(start)
    } else { 
        x <- c(start, 1)
        while (length(x) < n) {
            position <- n
            new <- x[position] + x[position - 1]
            x <- c(x,new)
        }
        return(x)
    }
}

#Demonstration of usage
Fibonacci(2,0)
Fibonacci(1,1)
Fibonacci(1,0)

#BONUSb: make function check user input (i.e no zeros, negative, or noninteger #s)
install.packages("tester")
library(tester)

Fibonacci <- function(n,start) {
    if(n < 1 | ( is_integer(n)==FALSE ) ) {  
        return("Enter a number > 1 that is also an integer")
    } else if (n==1) {
        return(start)
    } else {
        x <- c(start, 1)
        while (length(x) < n) {
            position <- length(x)
            new <- x[position] + x[position-1]
            x <- c(x,new)
        }
        return(x)
        }
}

#Demonstration of usage
Fibonacci(5,1)
Fibonacci(5.1,1)
Fibonacci(0,1)
Fibonacci(-1,1)
Fibonacci(1,0)
#-----------------------------------------------------------------------# 

#Problem IVa: Square difference of two numbers 
#Function definition 
SqDiff <- function(x,y) {
    SqDiff <- (( x - y ) ^ 2)
    return(SqDiff)
}

#Demonstration of usage 
#with numbers 3 and 5 
SqDiff(3,5)
#with vector c(2,4,6) and 4 
x <- c(2,4,6)
SqDiff(x,4)

#-----------------------------------------------------------------------# 

#Problem IVb: Average of vector of numbers without using mean()
#Function definition 
AvgVect <- function(vector) {
    AvgVect <- ( sum(vector) / length(vector) )
    return(AvgVect)
}
#Demonstration of usage 
    #with vector c(5,15,10)
AvgVect(c(5,15,10))
    #with data in "DataForLab07.csv" file 
data <- read.csv("DataForLab07.csv")
AvgVect(data$x)
    
#-----------------------------------------------------------------------# 

#Problem IVc: Sum of Squares 
#Function definition (using functions from IVa&b)
#Demonstration of usage with data in "DataForLab07.csv" file 
SumSq <- function(x) {
    SumSq <- (sum ( SqDiff (data$x, AvgVect(data$x) ) ) )
    return(SumSq)
}

SumSq(data$x)

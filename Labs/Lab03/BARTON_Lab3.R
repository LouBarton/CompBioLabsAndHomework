#Lab3_Barton_32Jan2019

#Step 3: assign variables for count of chip bags and guests 
chips <- 5 
guests <- 8 

#Step 5: assign variable for #of bags of chips expected for each guest to consume 
chipsPG <- 0.4 

#expected amount of leftover chips with 9 total guests (including yourself)
leftover <- (5 - ((guests + 1) * 0.4))
leftover #1.4 bags

#Step 8: create 5 vectors containing each person's ranking (1-7)
Self <- c(7,6,5,1,2,3,4)
Penny <- c(5,7,6,3,1,2,4)
Jenny <- c(4,3,2,7,6,5,1)
Lenny <- c(1,7,3,4,6,5,2)
Stewie <- c(6,7,5,4,3,1,2)

#Step 9: store Lenny's and Penny's ranking for Episode IV as new variables 
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Step 10: Combine all vectors 
ranks1 <- cbind(Self, Penny, Jenny, Lenny, Stewie)

#Step 11: inspect structure 
str(ranks1) #5 rows, 7 columns 
str(Penny) #1 row, 7 columns 
str(PennyIV) #1 number

#Step 12: make data frame of all vectors 
ranks <- data.frame(ranks1)  
as.data.frame(ranks) #alt way 

#Step 13: expore differences between step 10 and 12 
dim(ranks1) 
dim(ranks) # both with 7 columns and 5 rows = dimensions 
str(ranks1)
str(ranks) # presented as actual data frame 
typeof(ranks1) #double 
typeof(ranks) #list 
#using the data.frame command creates a data frame rather than a matrix. 
#data frames are 2D lists that can hold multiple types of data 

#Steps 14 & 15: create vectors of episode names and assign row names to matrix and dframe
episodes <- c("I", "II", "III", "IV", "V", "VI", "VII")
row.names(ranks) <- episodes
row.names(ranks1) <- episodes

#Accessing elements of matrices & data frames [row, column]
ranks1[3, ] #3rd from from step10s matrix 
ranks[ ,4] #4th column from step12s data frame
ranks[2,"Penny"] #Penny's ranking for EII
ranks[4:6,] #everyones rankings for IV-VI
ranks[c(2,5,7),] #everyones for II, V, and VII)
ranks[c(4,6), c("Penny", "Jenny")] #Penny, Jenny, and Stewie episodes IV and VI 

#Step 23: Switch Lenny's ranking for EII and V
Lenny_EII <- ranks[2,"Lenny"] #7
ranks[2,"Lenny"] <- ranks[5,"Lenny"]
ranks[5, "Lenny"] <- Lenny_EII

#Step 24: matrix vs. data frame, both work 
ranks1["III", "Penny"] 
ranks["III", "Penny"] 

#Step 25: undo step 23
ranks["V","Lenny"] <- ranks["II","Lenny"] 
ranks["II", "Lenny"] <- Lenny_EII

#Step 26: redo switch in 23 using $ to select column
ranks$Lenny[2] <- ranks$Lenny[5]
ranks$Lenny[5] <- Lenny_EII 


#Lab09: Parsing dates and times from a real data file 

#import camera trap data file 
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
str(camData)
camData$DateTime

# -------------- PROBLEM 1 ------------------ #
#convert dates and times from character strings into objects that represent time. 
camData$DateTime <- strptime(camData$DateTime, format="%d/%m/%Y %H:%M") 
camData$DateTime
camData$DateTime <- as.Date(camData$DateTime) #remove time 
camData$DateTime

# -------------- PROBLEM 2 ------------------ #
#determine which dates did not convert correctly 
NoCentury <- which(camData$DateTime < "2000-01-01") #498-952, 1953-14604
NoCentury

# -------------- PROBLEM 3 ------------------ #
#import dates correctly 
#fresh import 
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
head(camData$DateTime)
strptime(camData$DateTime[NoCentury], format="%d/%m/%y %H:%M") #dont know how to assign back 
nrow(camData)

for ( i in 1:nrow(camData) ) {
    if ( camData$DateTime[i] < "01/01/2000 01:00") {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%y %H:%M")
    } else {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%Y %H:%M") 
    }
}

warnings()
#check it out 
camData$DateTime


nrow(camData)
for ( i in 1:(nrow(camData)) ) {
    if ( camData$DateTime[i] < "01/01/2000 01:00") {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%y %H:%M")
    } else {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%Y %H:%M") 
    }
}


#workish
ok <- camData$DateTime[1:497 && 953:nrow(camData)] 
noCent <- camData$DateTime[498:952]
    
camData$DateTime[1:497 && 953:nrow(camData)] <- strptime(ok, format="%d/%m/%Y %H:%M")


for ( i in 1:nrow(camData) ) {
    if ( camData$DateTime[NoCentury] {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%y %H:%M")
    } else {
        camData$DateTime[i] <- strptime(camData$DateTime[i], format="%d/%m/%Y %H:%M") 
    }
    }

strptime(camData$DateTime[1:497], format="%d/%m/%Y %H:%M")
camData$DateTime[498:952] <- strptime(camData$DateTime[498:952], format="%d/%m/%y %H:%M")
camData$DateTime[953:nrow(camData)] <- strptime(camData$DateTime[953:nrow(camData)], format="%d/%m/%Y %H:%M")
camData[camData$DateTime < "2000-01-01",]


adjustCentury(camData$DateTime[498])

m < 
camData$DateTime[498]
camData$DateTime[1]
strptime(camData$DateTime[498], format="%d/%m/20%Y %H:%M") 

format(camData$DateTime[498], format="20%Y-%m-%d") 

strptime(camData$DateTime[498], format="20%Y-%m-%d") 
camData$DateTime
camData$DateTime[498]
# -------------- PROBLEM 4 ------------------ #
#find average time between oberservation for a given combination of 'Season', 'Station', and 'Species'
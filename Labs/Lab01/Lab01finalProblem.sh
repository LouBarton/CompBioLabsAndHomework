#remove first column and save as new data file 
cut -f 2-4 -d , PredPreyData.csv > PredPreyData_3col.csv

#view last 10 lines of output 
tail -10 PredPreyData_3col.csv

#make new file with columns 2-4, header, and last 10 lines of data 
head -n 1 PredPreyData_3col.csv  > PredPreyData_3colLast10.csv
tail -n 10 PredPreyData_3col.csv >> PredPreyData_3colLast10.csv

#check yo self 
less PredPreyData_3colLast10.csv

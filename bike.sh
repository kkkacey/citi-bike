#!bin/bash

for i in 1 2 3 4 5 6 7 8 9;do
wget "http://witestlab.poly.edu/bikes/20160$i-citibike-tripdata.zip"
unzip  "20160$i-citibike-tripdata.zip"
awk -F "\"*,\"*" '{print $5}' "20160$i-citibike-tripdata.csv" > stations.csv
awk -F "\"*,\"*" '{print $9}' "20160$i-citibike-tripdata.csv" >> stations.csv
echo "month $i counting completed"
done

sort stations.csv | uniq -c | sort -n -r > result.csv 

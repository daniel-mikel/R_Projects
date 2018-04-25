#!/bin/bash

while true; 

do 
	#Run!
Rscript yosemite_prod.R

rando=`echo $((1 + RANDOM % 1000))`
echo "$rando"
time=`echo "$rando+3600" | bc -l `
echo $time
sleep $time

done

mail -s "hello" "dmikel2010@gmail.com" <<EOF
you got camp!
EOF

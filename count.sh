#!/bin/bash

log_path="/apps/myBHN/logs"

cd $log_path

count1=`cat api.log | grep "Login service response got from zendo. Time taken"  | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 >= 0 && $2 <= 10000' | wc -l`
count2=`cat api.log | grep "Login service response got from zendo. Time taken"  | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 >= 10001 && $2 <= 30000' | wc -l`
count3=`cat api.log | grep "Login service response got from zendo. Time taken"  | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 >= 30001 && $2 <= 60000' | wc -l`
count4=`cat api.log | grep "Login service response got from zendo. Time taken"  | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 >= 60000' | wc -l`

echo "Requests between 0-10000=$count1";
echo "Requests between 10001-30000=$count2";
echo "Requests between 30001-60000=$count3";
echo "Requests above 60001=$count4";

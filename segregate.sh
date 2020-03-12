#!/bin/bash

cat devicetokens_main.csv | grep ",IOS," > devicetokens_ios.csv
cat devicetokens_main.csv | grep ",ANDROID," > devicetokens_and.csv

IOS_Count=`cat devicetokens_ios.csv | wc -l`
Android_Count=`cat devicetokens_and.csv | wc -l`

echo "Total no. of IOS users : $IOS_Count"
echo "Total no. of Android users : $Android_Count"

####Segrehate IOS users into 25000 batch###

awk 'NR%25000==1{x="devicetokens_ios_"++i;}{print > x}' devicetokens_ios.csv

####Segrehate Android users into 1000 batch###

awk 'NR%1000==1{x="devicetokens_android_"++i;}{print > x}' devicetokens_and.csv

echo "All IOS and Andorid devices segregated successfully"

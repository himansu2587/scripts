#!/bin/bash

log_path="/apps/myBHN/logs"

cd $log_path
Current_hour=`date | sed 's/:/: /g' | tr -s "\t" " " | cut -d" " -f3,4`
count=`cat api.log | grep "$Current_hour" | grep "Login service response got from zendo. Time taken" | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 > 60000' | wc -l`
cat api.log | grep "$Current_hour" | grep "Login service response got from zendo. Time taken" | sed -e 's/:/# /g' -e 's/]/#/g' |cut -d"#" -f10,12 | sed 's/#//g' | awk '$2 > 60000' > /apps/myBHN/logs/vinod/login.txt

if [ $count -ge 20 ]
then
Date=`date`

###Alert Mail####

echo "Team," > /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
Subject="Zendo server login is taking time more than 60 seconds for Care_API-1 as of $Date"
cat /apps/myBHN/logs/vinod/login.txt | head -20 >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo "Please take needed action.Thanks!" >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo " " >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo "Regards,"  >> /apps/myBHN/logs/vinod/Mail_Format.txt
echo "Broadsoft Support." >> /apps/myBHN/logs/vinod/Mail_Format.txt

cat /apps/myBHN/logs/vinod/Mail_Format.txt | /opt/aws/bin/ses-send-email.pl -k /home/xymon/.aws/ses/aws-credentials -s "${Subject}" -f BD_SupportTeam@broadsoft.com BD_SupportTeam@broadsoft.com

else
echo "No Latency issue in Care_API Prod1 as of ${Date}" >> /apps/myBHN/logs/vinod/No_Exception.txt
fi

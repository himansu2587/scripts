#!/bin/bash

mysql -h softphonestage.cf4gw8bb8bxg.us-east-1.rds.amazonaws.com -u softphoneuser -pStageSoft123 phone2gostage -e  "SELECT CLIENT_DEVICE_ID FROM DEVICE;" > /tmp/himu/device_id
cd /tmp/himu/
cat device_id | sed '1d' > Device_id
input="/tmp/himu/Device_id"

while read var
do
cd /apps/cdm/logs/connect/accesslog/internal/twc/
result=`cat access.log* | grep "$var" | wc -l`
cd /apps/cdm/logs/connect/accesslog/internal/twc/archive
result1=`gunzip -c access2016*.tar.gz | grep -a "$var" | wc -l`
if [ $result -eq 0 ] && [ $result1 -eq 0 ]
then
echo "$var" >> /tmp/himu/test.txt
fi
done < $input

output="/tmp/himu/test1"
while read line
do
mysql -h softphonestage.cf4gw8bb8bxg.us-east-1.rds.amazonaws.com -u softphoneuser -pStageSoft123 phone2gostage -e  "UPDATE DEVICE SET TOKEN_ID=NULL  WHERE CLIENT_DEVICE_ID='${line}';"
done < $output
echo "All records are updated successfully";

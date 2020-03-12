#!/bin/bash
#Author: Himansu S Rout
#Version : 1.1

mysql -h softphonestage.cf4gw8bb8bxg.us-east-1.rds.amazonaws.com -u softphoneuser -pStageSoft123 phone2gostage -e  "SELECT CLIENT_DEVICE_ID FROM DEVICE WHERE (CHAR_LENGTH(TOKEN_ID) > 1);" > /media/ephemeral0/himansu/device_id
cd /media/ephemeral0/himansu/
cat device_id | sed '1d' > Device_id_DB

date1=`date +'%Y'`
cd /apps/cdm/logs/connect/accesslog/internal/twc/
cat access.log* | cut -d"," -f9 | sed '/^$/d' > /media/ephemeral0/himansu/devid.txt
cd /apps/cdm/logs/connect/accesslog/internal/twc/archive
gunzip -c access"$date1"*.tar.gz | cut -d"," -f9 | sed '/^$/d' >> /media/ephemeral0/himansu/devid.txt
cat /media/ephemeral0/himansu/devid.txt | sort | uniq > /media/ephemeral0/himansu/uniq_device_id_server

input="/media/ephemeral0/himansu/Device_id_DB"

while read var
do
result=`cat /media/ephemeral0/himansu/uniq_device_id_server | grep "$var" | wc -l`
if [ $result -eq 0 ]
then
echo $var >> /media/ephemeral0/himansu/output
fi
done < $input

new="/media/ephemeral0/himansu/output"
while read line
count=1
do
mysql -h softphonestage.cf4gw8bb8bxg.us-east-1.rds.amazonaws.com -u softphoneuser -pStageSoft123 phone2gostage -e  "UPDATE DEVICE_50000 SET TOKEN_ID=NULL WHERE CLIENT_DEVICE_ID='${line}';"
count=`expr $count + 1`
if [ $count -eq 5000 ]
then
sleep 30
count=0
fi

done < $new
echo "All records are updated successfully";

#!/bin/bash

arg1='$1'


while read var
do
result=`cat /media/ephemeral0/himansu/uniq_device_id_server | grep "$var" | wc -l`
if [ $result -eq 0 ]
then
echo $var >> /media/ephemeral0/himansu/output
fi
done < $input




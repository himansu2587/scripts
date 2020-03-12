#!/bin/bash

DESTINATION_IP=$(10.193.185.17)

#Commented all the enterprise name in file "spEntList.txt"

sed -i -e 's/^/#/' /export/home/bwadmin/Migration_Demo_19Jun2019/exportTool/conf/spEntList.txt

#Add the required enterprise name in file "spEntList.txt"

for enterprise_names in "$@"; do
    echo "$enterprise_names" >> /export/home/bwadmin/Migration_Demo_19Jun2019/exportTool/conf/spEntList.txt
done

#Run export tool for exporting the data
./export/home/bwadmin/Migration_Demo_19Jun2019/exportTool/exportTool.sh -gather

#Check the output folder for the newly created file as present date
NEW_DIR=$(ls -Art | tail -n 1 | cut -d"/" -f1)

echo "=========================================================="
echo "$NEW_DIR is ready for copying to the destination server"
echo "=========================================================="

#Copy the new exported file to destination instance

sshpass -p 'bwadmin' scp -r "/export/home/bwadmin/Migration_Demo_19Jun2019/exportTool/output/$NEW_DIR" bwadmin@"$DESTINATION_IP":/export/home/bwadmin/Migration_Demo_19Jun2019/playbackTool/output/



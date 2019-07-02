#!/bin/bash

DATE=`date +"%d-%m-%Y"`
# Run the Shell Script to scan all the S3 buckets

python3 /home/ansible/s3-scan/s3inspector-twc.py | grep Bucket | sed 's/://g' | awk -F' '  'BEGIN { printf "%-1s %-50s %10s\n" , "Serial-No", "Bucket-Name", "Bucket-Permission" } { printf "%-2d %-65s %10s\n", NR, $2, $3 }' | tr -s ' ' ' '|sed 's/\x1b\[[0-9;]*m//g' > /home/ansible/s3-scan/output.txt


# Run the python file to remove the color coding

#python /home/ansible/s3-scan/conversion.py /home/ansible/s3-scan/output.txt > /home/ansible/s3-scan/output-modified.csv

INPUT="/home/ansible/s3-scan/output.txt"
TMPFILE="/home/ansible/s3-scan/tmpfile.html"
NTMPFILE="/home/ansible/s3-scan/ntmpfile.html"


echo 'Content-Type: text/html; charset="us-ascii" ' > "$TMPFILE"
echo "Subject: S3 Bucket Permission Details $DATE" >> "$TMPFILE"
echo "<html><head><meta charset="UTF-8"/></head>" >> "$TMPFILE"
echo "<body><p>Hi All,</p>" >> "$TMPFILE"
echo "<body><p>     </p>" >> "$TMPFILE"
echo "<body><p>Below is the weekly report for S3 buckets permission status.</p>" >> "$TMPFILE"
echo "<body><p>      </p>" >> "$TMPFILE"
echo "<body><p>      </p>" >> "$TMPFILE"
awk 'BEGIN{print "<html><body><table border=1>"} {print "<tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table></body></html>"}' "$INPUT" >> "$TMPFILE"
sed -i 's/<td>Not-public<\/td>/<td><font color="green">Not-public<\/font><\/td>/g' $TMPFILE
echo "<body><p>      </p>" >> "$TMPFILE"
echo "<body><p>Thanks & Regards,</p>" >> "$TMPFILE"
echo "<body><p>Ops Team</p>" >> "$TMPFILE"

count=`cat /home/ansible/s3-scan/tmpfile.html | grep -w PUBLIC! | wc -l`

if [[ $count -gt 0 ]]
then
sed -i 's/<td>PUBLIC!<\/td>/<td><font color="red">PUBLIC!<\/font><\/td>/g' $TMPFILE

sudo /usr/sbin/sendmail -f BD_supportteam@broadsoft.com bd_operations@cisco.com manjits3@cisco.com jagrai@cisco.com agingade@cisco.com < "$TMPFILE"

else
echo "Everything looks safe on $DATE" >> /home/ansible/s3-scan/safe.txt
fi


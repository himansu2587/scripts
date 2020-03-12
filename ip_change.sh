#!/bin/bash

#New IPs are taken to a file
nslookup www.spectrum.net | grep Address | cut -d" " -f2 | tail -3 > /opt/apps/cds_boot/new_ips

Date=`date`

#Assign variable for each new IPs
NEW_IP1=`cat /opt/apps/cds_boot/current_ips | head -1`
NEW_IP2=`cat /opt/apps/cds_boot/current_ips | head -2 | tail -1`
NEW_IP3=`cat /opt/apps/cds_boot/current_ips | head -3 | tail -1`

#Checking in running iptable rules whether the new IPs are availbale or not
STATUS_IP1=`iptables -L | grep "NEW_IP1" | wc -l`
STATUS_IP2=`iptables -L | grep "NEW_IP1" | wc -l`
STATUS_IP3=`iptables -L | grep "NEW_IP1" | wc -l`

#If IPs are not availbale in the list then it will flush and re-enable the rules
if [ $STATUS_IP1 -eq 0 -o $STATUS_IP2 -eq 0 -o $STATUS_IP3 -eq 0 ]
then
#flush the iptables
iptables -F
echo "IPTABLE flushed at $Date" >> /opt/apps/cds_boot/logs.txt
#enable the iptables
sh /opt/apps/cds_boot/IPTABLE.sh 2>> /opt/apps/cds_boot/exception.log
echo "IPTABLE enabled successfully at $Date" >> /opt/apps/cds_boot/logs.txt

Alert Mail#
echo "Team," > /opt/apps/cds_boot/mail_format.txt
echo " " >> /opt/apps/cds_boot/mail_format.txt
Subject="IPTABLE rules flushed & re-enabled in BillPay servers" >> /opt/apps/cds_boot/mail_format.txt
echo "The IPTABLE rules flushed & re-enabled due to New IPs are not matched" >> /opt/apps/cds_boot/mail_format.txt >> /opt/apps/cds_boot/mail_format.txt
echo "The old IPs are replaced by these new IPs for spectrum.net are $NEW_IP1,$NEW_IP2 & $NEW_IP3" >> /opt/apps/cds_boot/mail_format.txt
echo " " >> /opt/apps/cds_boot/mail_format.txt
echo " " >> /opt/apps/cds_boot/mail_format.txt
echo " " >> /opt/apps/cds_boot/mail_format.txt
echo " " >> /opt/apps/cds_boot/mail_format.txt
echo "Regards" >> /opt/apps/cds_boot/mail_format.txt
echo "Broadsoft CloudOps" >> /opt/apps/cds_boot/mail_format.txt

cat /opt/apps/cds_boot/mail_format.txt | /opt/aws/bin/ses-send-email.pl -k /home/xymon/.aws/ses/aws-credentials -s "${Subject}" -f cloud_blr@broadsoft.com cloud_blr@broadsoft.com
else
echo "The IPs are updated as of ${Date}" >> /opt/apps/cds_boot/ip_match.txt
fi

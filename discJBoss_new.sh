#! /bin/bash

aa=`date -d "last day" '+%Y-%m-%d'`
log_path="/apps/cdm/cdm-deploy/v600/jboss4/server/discovery/log/access_log"

echo "Script started at `date`" > $log_path/chikku/discjbossza.txt

###Android Script:
cat $log_path/discovery_access_log.$aa.log |grep -v "ELB-HealthChecker"|grep -v "8585683488"|grep  "POST /sds/menu?_req=27"|sed 's/&_mwType=.*accType=mwc&/ /g'|cut -d ' ' -f1,2,3,5,6 --complement |sed 's/\[//g' | sed 's/\/sds\/menu?_req=//g' | sed 's/&_cType=ott//g' | sed 's/&_pwd=.*_mdn:/ '"'"'/g' | sed 's/&fwVersion.*_mdn:/ '"'"'/g' | sed 's/&_userId=/ /g' | sed 's/&_username=/ /g' | sed 's/_username=/ /g' | sed 's/HTTP.*_mdn:/'"'"'/g'|sed 's/_esn://g'|sed 's/User-Agent://g'| cut -d" " -f8,9 --complement > $log_path/chikku/1p.txt

#####iOS Script:
cat $log_path/discovery_access_log.$aa.log |egrep -v "ELB-HealthChecker|8585683488"|grep "/sds/menu?_widgetId"|sed 's/"POST \/sds.*_mdn:/'"'"'/g'|cut -d " " -f1,2,3,5 --complement|sed -e 's/\[//g' -e 's/_esn://g' -e 's/Username://g' -e 's/UserId://g' -e 's/User-Agent://g'| sed 's/'"'"'//5'|sed 's/'"'"'//5'|sed 's/'"'"'//5'|sed 's/'"'"'//5'| awk '{print $1,"-",$5,$4,$2,$3,$6,$7,$8,$9,$10,$11,$12,$13,$14}' >> $log_path/chikku/1p.txt

cat $log_path/chikku/1p.txt | awk '{ x=substr($1,0,2);y=substr($1,4,3);z=substr($1,8,4);rest=substr($1,13,8);if(y=="Jan"){mon="01"};if(y=="Feb"){mon="02"};if(y=="Mar"){mon="03"};if(y=="Apr"){mon="04"};if(y=="May"){mon="05"};if(y=="Jun"){mon="06"};if(y=="Jul"){mon="07"};if(y=="Aug"){mon="08"};if(y=="Sep"){mon="09"};if(y=="Oct"){mon="10"};if(y=="Nov"){mon="11"};if(y=="Dec"){mon="12"};printf "%s-%s-%s:%s ", z,mon,x,rest;for(i=2;i<=NF;i++){printf "%s ", $i}; printf "\n"}' > $log_path/chikku/2p.txt


mysql -h preprodcdsdb.ctiukoclxr9h.us-east-1.rds.amazonaws.com -u twcbiusernew -ptwcbomobile TWC-BI -e "LOAD DATA LOCAL INFILE '/apps/cdm/cdm-deploy/v600/jboss4/server/discovery/log/access_log/chikku/2p.txt' INTO TABLE DISC_JBOSS_NEW_JUNE_2017 FIELDS TERMINATED BY ' ' ENCLOSED BY '\''  "

echo "and ended at `date` in Zone A" >> $log_path/chikku/discjbosszd.txt

s3cmd put --recursive $log_path/chikku/discjbosszd.txt s3://wggtest/BI/

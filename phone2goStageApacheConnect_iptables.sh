#!/bin/bash
PHONE2GO_APACHE_CONNECT_STAGE_EIP=54.196.179.12

elb_stage=dualstack.stage-apache-connect-elb-1020854437.us-east-1.elb.amazonaws.com

AWSREPO=repo.us-east-1.amazonaws.com 
XYMON=xymon.mp-internal.com
SES=email.us-east-1.amazonaws.com
BangaloreOffice_IP1=202.191.210.194/32
BangaloreOffice_IP2=182.76.176.194/32


#22 PORT PHONE2GO_APACHE_CONNECT_STAGE_EIP
/sbin/iptables -A OUTPUT -p tcp --dport 22 -d ${PHONE2GO_APACHE_CONNECT_STAGE_EIP} -j ACCEPT


##LDAP Access and DNS Names
/sbin/iptables -A OUTPUT -p tcp --dport 389 -j ACCEPT
/sbin/iptables -A OUTPUT -p udp --dport 389 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
/sbin/iptables -A OUTPUT -p udp -o eth0 --dport 53 -j ACCEPT


#Enabling the IPTABLES for PHONE2GO URLs
/sbin/iptables -A OUTPUT -p tcp --dport 443 -d wayfarer.timewarnercable.com -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 443 -d ids.rr.com -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 443 -d sps.timewarnercable.com -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 443 -d services.timewarnercable.com -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 80 -d ccs.ims.rr.com -j ACCEPT

#Bangalore Office IPs and PHONE2GO EIP
/sbin/iptables -A OUTPUT  -m state --state NEW,ESTABLISHED -d ${PHONE2GO_APACHE_CONNECT_STAGE_EIP} -j ACCEPT
/sbin/iptables -A OUTPUT  -m state --state NEW,ESTABLISHED -d ${BangaloreOffice_IP1} -j ACCEPT
/sbin/iptables -A OUTPUT  -m state --state NEW,ESTABLISHED -d ${BangaloreOffice_IP2} -j ACCEPT


#ELB Access (OUTPUT)
/sbin/iptables -A OUTPUT  -m state --state NEW,ESTABLISHED -d ${elb_stage} -j ACCEPT


#XYMON Access
/sbin/iptables -A OUTPUT -p TCP --dport 1984 -m state --state NEW,ESTABLISHED -d ${XYMON} -j ACCEPT
/sbin/iptables -A OUTPUT -p TCP --dport 80 -m state --state NEW,ESTABLISHED -d ${XYMON} -j ACCEPT


#ELB PORTS To be opened
/sbin/iptables -A OUTPUT -p tcp --sport 8080 -m state --state ESTABLISHED -j ACCEPT

#NTP Server and EMAIL
/sbin/iptables -A OUTPUT -p tcp --sport 1024:65535 --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 443 -d ${SES} -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -p udp --dport 123 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


#AMAZON
/sbin/iptables -A OUTPUT -p tcp --dport 80 -d ${AWSREPO} -j ACCEPT

### block crypto scripts
iptables -A INPUT -s xmr.crypto-pool.fr -j DROP
iptables -A OUTPUT -d xmr.crypto-pool.fr -j DROP

#Looping
/sbin/iptables -A OUTPUT -o lo -j ACCEPT
/sbin/iptables -A OUTPUT -j DROP

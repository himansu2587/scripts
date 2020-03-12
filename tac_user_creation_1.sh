#######################satyas#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called satyas"
useradd satyas
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/satyas
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/satyas/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/satyas/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAw1HpcKU0ESE88N3WjJBxGGT18LhUnqd20Yv+gFozqgIqzbzcaFtJeKY+GgTo79KVDXNzaTZkQq63GQbmJlG1UCWoTVgnRxRKcVbtE2RIXoZMdFRMNDk6g1MSp4Jl4H92rp99wdFV2qas97Xli69nq0W3RMk6BznVrBErTZJBWefS1d0Dn1XZUSoL8+x+pw0XZh1RfFoK8UCi13VY0UmQ4Bs3qBb5S42t5W1K8eBTUKDhfes55KH7a3V+9Dzsit10qWu8eRBr/XvOIAq0nbVoLvHWbLlOff5VI1x+x5YG4q1+oiuG94cl06MuRArbQMHtp1a2OpcIkdMN+VhKZWVXvQ== satyas
EOF
#Change permissions stuff
chmod 600 /home/satyas/.ssh/authorized_keys
chown -R satyas:satyas /home/satyas/
echo "satyas ALL= NOPASSWD: /bin/su cds_admin" >> /etc/sudoers
#Add to sudoers
#######################################################################
#echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#######################################################################
echo 'completed successfully for satyas'

#######################nrupen_b#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called sashiv"
useradd sashiv
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/sashiv
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/sashiv/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/sashiv/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkGqsVsHPrivLwPICPia8J+Z+S4BwGbt6iIJTK7zjPZN4ZB6pq3DXYWqBUvnfzm1UzAN7MAKzPtigtOWeTEvFD11/Vwc3foecCWJRinEdutztnE5uN2nrs5F2MSvFypUKrCvZKrhxJivuRKwsXzBsS/fs71/1ohTQZ6YJ66RzwemGBHUlY364BSRnAyVK6V1baUbRNoyMxNdVztllYy0mO0KephQJXk44x6GNuFSljiuiT1uXGiBUw/DMhl8MflR+OVmbqNabn2y00IJNJWQxGop+O5gME2PJTn+sGlh0am2H92/a8BCV/d5pWvCznMUfHXTMJ58ZVnCUQQz5cLjLqw== sashiv
EOF
#Change permissions stuff
chmod 600 /home/sashiv/.ssh/authorized_keys
chown -R sashiv:sashiv /home/sashiv/
echo "sashiv ALL= NOPASSWD: /bin/su cds_admin" >> /etc/sudoers
#Add to sudoers
#######################################################################
#echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#######################################################################
echo 'completed successfully for sashiv'

#######################smrutic#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called smrutic"
useradd smrutic
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/smrutic
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/smrutic/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/smrutic/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwJuTcVGMcVl8pPjym85snxOisLWkRSpBCjwq5WX9H2BroFaqNu+zslN8T9rgp/Q96R1nF0okCcgbOJwhwWL5sPDSor4lEOdXQ6EU6c+xmxwiEMrOGjK0PpWAbDODDTPcct+sDIz1IFBG/bSipPvIHhJlZearQq5AZTaVnUNXJGuauXAAVdtTEt0nc5FfVV4lUxyXGXPXRnZYgLqpEngHiPSM5AuBR/9JCE61qeyJeUqSXXBKAcncLs3navMWSmCLO+bFpDotaK00VXqyNQU116s9y+wX8R3rNWI3x56cm+BePf4qEWGoOzhRm7bGfFEtXbyaq9+oPuPp3cMYcxEPVw== smrutic
EOF
#Change permissions stuff
chmod 600 /home/smrutic/.ssh/authorized_keys
chown -R smrutic:smrutic /home/smrutic/
echo "smrutic ALL= NOPASSWD: /bin/su cds_admin" >> /etc/sudoers
#Add to sudoers
#######################################################################
#echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#######################################################################
echo 'completed successfully for smrutic'


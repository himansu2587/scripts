########################schandan_b#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called schandan_b"
useradd schandan_b
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/schandan_b
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/schandan_b/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/schandan_b/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkru9AVG1usZvyJK7mg5fVSzoIrpbR1iu9JcuLOXLx13+rXzyoOa/REyGj5okjo4HJF/3DclLtb1LYh5dtNKkoIZzV3HObu9lOHC/Lll/N/CuwrcU2V6MHdDKbQXcmcxLTufFkCEiluGaSsrOKDjGh7FO5xzwebDVW058tCtzy+MgMg9oH2Owtyinw6f/mK2cW8HtlSgZ9IPFZiPdFYBnMT/A1gU+Gb0sYZ1lu7a7r9CSQzmmvgVUuJXgPYriOyoF85GwsASpqN71NnKZMAFsxBDx8W9J+vrCVFQ4csDYGE/mGZQ1WIyJ8YSTwOAVPi7k3sulSj/CXQ4iCpKm6+7UbQ== smruti_bhn
EOF
#Change permissions stuff
chmod 600 /home/schandan_b/.ssh/authorized_keys
chown -R schandan_b:schandan_b /home/schandan_b/
echo "schandan_b ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
#######################################################################
#echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#######################################################################
echo 'completed successfully for schandan_b'

########################satya_b#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called satya_b"
useradd satya_b
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/satya_b
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/satya_b/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/satya_b/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiLCcIMNiVqJhAT+82WkRu162owZsTGE/F9ewWwwGU5KSjg4YhDEDa44bMTF1Za5PpQVuOReX0ngtzi6XTV/2bM48NhE6o1ZyWW1NqSKWardLFnW07NXe+0l/fEg+UCBU+Y4L7el5FX3+ixJh3+rHkBoXDhm64nuWcARuO2PWQgGhaZ1rKACmeANLoWVfjiux1F1tCQ17yay81zzrTtwxZ5dqk4wzDA5Y91jlHNhT4faREINb+9ielBwSSDiH0gG3D5Qi8CupwZqiPLIUysQXsQfRs2P0qLcMeovnaEtdhkpoIV9tEJI4vC7s5/HCE3ndHW2qe1KPpFS96N1DO06Jvw== satya_bhn
EOF
#Change permissions stuff
chmod 600 /home/satya_b/.ssh/authorized_keys
chown -R satya_b:satya_b /home/satya_b/
echo "satya_b ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
#######################################################################
#echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#######################################################################
echo 'completed successfully for satya_b'
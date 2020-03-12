########################himansur#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called himansur"
useradd himansur
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/himansur
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/himansur/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/himansur/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA7rkfvoIGg32xJ0+cQ28XZZtmeRqhMT0xups7fYp9+HJqCjTcppIbOwSqYMHBIVzsdsh4MQmGj6EReN+gk4vy+SXctnERxvClsarDtXAtrMOwNLK0dANIXMrLxpwSctDvBbzCAXj7LJNzl6uBfq8myL/tv8I/8rrd/UclwQVWmDruaOWOg7qEWMczyCczzegYg9SDq4/FltXBSMJsLQUPrUmRCDrC04Bjy/zH1Ffkd427L2YjxA0Cqg+dPeIKwKB5IycMt1T+QdlusI29yTzdbb+YXKzL1oK/CfCHkDWJi7wYXhXXP7IUvFtXMmoXhLDAoasIz48550xZ7TsPPAkxyw== himansur
EOF
#Change permissions stuff
chmod 600 /home/himansur/.ssh/authorized_keys
chown -R himansur:himansur /home/himansur/
echo "himansur ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
echo "himansur ALL= NOPASSWD: ALL" >> /etc/sudoers
#######################################################################
echo 'completed successfully for himansur'

########################pankajk#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called pankajk"
useradd pankajk
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/pankajk
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/pankajk/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/pankajk/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAipsXsVWfMQYjxm42j/ZkRcoK9uih7Yv2iC/sj9hvkDnOqe8i9FehgOok2sjN2Y2J5iLDxEmLE8m8ohfOB/pxOq7XtBCnrBc05T72qWxT4xC8hTTpQ71QBQCOEtcGJFBUlOHqrIm4TzhS0QzHAGFpuQ3fMMKlFQyJQ8VqvmAMDpVgxTPcGdLevORxvZenehZxPjsaLU5EfZeW8Wy5y8AMseha6OWtwZW1qk3MqCW7XNztep69UeVSvn08c2JcoG0Sx/BourQFcpmrTAFzqCX+cI+E2bD5yOXv90gXtfM6WxhsqmMK9R5mQAyvrynhjMmVqTBoBRL7p7hXm2udnpEgzQ== pankajk
EOF
#Change permissions stuff
chmod 600 /home/pankajk/.ssh/authorized_keys
chown -R pankajk:pankajk /home/pankajk/
echo "pankajk ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
echo "pankajk ALL= NOPASSWD: ALL" >> /etc/sudoers
#######################################################################
echo 'completed successfully for pankajk'

########################chikku_b#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called chikku_b"
useradd chikku_b
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/chikku_b
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/chikku_b/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/chikku_b/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAh1NAJggg5/PeFgcTlLpfQ+/3xgtP5KTzEEGcLehJKrtykhV4hVMmO+dOncqJJTwNkioZpKfCPkAXuFy08d5HwCpB+5IhbF0wOenZ0U1p7QRvSE0vNwMTjmcN+WjC4YfnDZdemYqKjWZjWzE4FlElbnkCKS7VYLj9kSlmGdCq9l0rtLZQmOzgUB42qYJrY454QMo7X1K5PCQFwbweGCFQ7oMvfDzgIrhN5gXpDb5bpPeaxssmeCM52WysTKYGZhdHpuiGPyw+7TEyeTEP1OzCicYHBOeQ+mmzxrrVko6kQQYdpmXUeJQ81f/AJZN/nSnFizZgZA4+eOGPMYzzx37PJw== chikkur
EOF
#Change permissions stuff
chmod 600 /home/chikku_b/.ssh/authorized_keys
chown -R chikku_b:chikku_b /home/chikku_b/
echo "chikku_b ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
echo "chikku_b ALL= NOPASSWD: ALL" >> /etc/sudoers
#######################################################################
echo 'completed successfully for chikku_b'

########################bikramd#####################################

#!/bin/bash
#Create a user called Ansible
echo "creating a user called bikramd"
useradd bikramd
#Make directory under for the ansible user
#mkdir ~ansible
cd /home/bikramd
#Make .ssh directory under /home/ansible/
mkdir .ssh
#Set the directory permissions to be 700
chmod 700 /home/bikramd/.ssh
#Create the file ~ansible/.ssh/authorized_keys
cd .ssh/
touch authorized_keys
#Insert the following contents into ~ansible/.ssh/authorized_keys
cat > /home/bikramd/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAj4McUUrtGQsBPWX7ycNGt34K44YH4EsIBjgrE8HvfI42f+WInVqN9Gp5zFSJIl4BKHpNSSUfnloC3+8TzdyD/0ly7A1yXXRk8+H/0WSRxW8TsjKY5e7ECCtOnyCzIQxyonl759FLIirAFtWamgXeSDlkb7qBh/6dpoi0pksxAMGUKg112XgKcT94nckcIAKHj321xl5hiclKhDIK4TZacJu38lB6366atRtwPp1RT7aCriVmadEqxMxOIiJAN/D0TyI2CEtmAeNUz4BW1txFSiduyP4Ab7AquoCcwgwdhpNulpPL6eo7huFM1zMDZXpPWij+n0ZcyRR+buAHHOKvIQ== bikramd
EOF
#Change permissions stuff
chmod 600 /home/bikramd/.ssh/authorized_keys
chown -R bikramd:bikramd /home/bikramd/
echo "bikramd ALL= NOPASSWD: /bin/su staguser" >> /etc/sudoers
#Add to sudoers
echo "bikramd ALL= NOPASSWD: ALL" >> /etc/sudoers
#######################################################################
echo 'completed successfully for bikramd'


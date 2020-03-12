########################Root#####################################

#!/bin/bash
date1=`date | cut -d" " -f2,3,6 | sed 's/ /_/g'`
#Go to root directory
cd /root/.ssh
#Taking backup of old root authorized_keys file 
mv authorized_keys authorized_keys_$date1
#Create a new file as name authorized_keys
touch authorized_keys
#Insert the following contents into /root/.ssh/authorized_keys
cat > /root/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAk+lyTsDS3Q2ZemTucorxf5ZlrQSggQ6/u48VRBp/IAZ+im8EH0tpprsGkXzCUVsixtRohbCoKZID3WVqUbcT+0S9jY9ek3YL3OlsJ1ZDatehmSTdF6OADbZzrmowwkLDTayfa4Z3nXvw1ANdOHCWzADcUpXGKKYY03z6bW7EkIQwrJFZwi6725ubf2C8qn5KI5lgrpo3m5QLVyTjOoIXmJ/lJAwe4YqUAVChTJwo5QdHp6uk8i2R18ySXl+mxrkN+II/7pUJOyfePU+FiX4R0ePF7wWavTg6j5PWwcNFR2NSEJjA85vidQJLPyZ5LLHg9BxDMXOVsKPfwSBqv1X5+Q== rootnov2017
EOF
#######################################################################
echo "The password has been changed for root user successfully"+
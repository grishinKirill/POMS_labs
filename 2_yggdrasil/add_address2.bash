#!/bin/bash
match='Peers: ['
insert='New Inserted Line'
file='file.txt'

echo -n "do you want to add peers? y/n:"
read answer
if [ "$answer" = "y" ]; then 
#echo "adding:"
#echo $insert
sudo sed -i 's/Peers: \[/Peers: \[ \
tcp:\/\/194.177.21.156:5066 /' /etc/yggdrasil.conf
echo "done"
#sed -i "/$match\n$insert/" $file
elif [ "$answer" = "n" ]; then echo "ko"
else echo "wrong parametr"
fi


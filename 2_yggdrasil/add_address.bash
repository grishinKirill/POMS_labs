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
	tcp:\/\/88.201.129.205:8777 \
	tcp:\/\/[2a05:3580:d900:1b13:e2d5:5eff:fed8:8b86]:8777 \
	tls:\/\/88.201.129.205:8778 \
	tls:\/\/[2a05:3580:d900:1b13:e2d5:5eff:fed8:8b86]:8778 /' /etc/yggdrasil.conf
echo "done"
#sed -i "/$match\n$insert/" $file
elif [ "$answer" = "n" ]; then echo "ko"
else echo "wrong parametr"
fi


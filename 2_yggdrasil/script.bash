#!/bin/bash
sudo apt-get update
sudo apt-get install git
#used for raspberry and others...
sudo apt-get install dirmngr
#add repo to install yggdrasil with apt-get
gpg --fetch-keys https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt
gpg --export 569130E8CA20FBC4CB3FDE555898470A764B32C9 | sudo apt-key add -
echo 'deb http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/ debian yggdrasil' | sudo tee /etc/apt/sources.list.d/yggdrasil.list
sudo apt-get update
sudo apt-get install yggdrasil
sudo systemctl enable yggdrasil
sudo systemctl start yggdrasil
#mkdir "tmp"
#cloning my repo to use local .conf file
#git clone https://github.com/grishinKirill/POMS_labs.git tmp
#yggdrasil -useconffile ./tmp/2_yggdrasil/yggdrasil.conf
#check peers for spb or for moscow
#vim /etc/yggdrasil.conf
#restart with new .conf file
sudo ./add_address.bash
sudo systemctl reload yggdrasil
sudo systemctl start yggdrasil #--autoconf
#git clone 
# change config file
#rm
#cp
#systemctl restart yggdrasil


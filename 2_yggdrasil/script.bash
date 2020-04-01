#!/bin/bash
sudo apt-get install git
sudo apt-get install dirmngr
#add repo to install yggdrasil with apt-get
gpg --fetch-keys https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt
gpg --export 569130E8CA20FBC4CB3FDE555898470A764B32C9 | sudo apt-key add -
echo 'deb http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/ debian yggdrasil' | sudo tee /etc/apt/sources.list.d/yggdrasil.list
sudo apt-get update
sudo apt-get install yggdrasil

sudo systemctl enable yggdrasil
sudo systemctl start yggdrasil
#git clone 
# change config file
#rm
#cp
#systemctl restart yggdrasil


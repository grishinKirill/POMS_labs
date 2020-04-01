#!/bin/bash
#Pv6 needs to be enabled in order for Yggdrasil to work - IPv6 is usually enabled by default, but if not, enable using
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
#Pv6 needs to be enabled in order for Yggdrasil to work - IPv6 is usually enabled by default, but if not, enable using
sudo sysctl -w net.ipv4.tcp_congestion_control=bbr
#install git
sudo apt-get install git
#check
sudo apt-get install dirmngr
gpg --fetch-keys https://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/key.txt
gpg --export 569130E8CA20FBC4CB3FDE555898470A764B32C9 | sudo apt-key add -
echo 'deb http://neilalexander.s3.dualstack.eu-west-2.amazonaws.com/deb/ debian yggdrasil' | sudo tee /etc/apt/sources.list.d/yggdrasil.list
sudo apt-get update

sudo apt-get install yggdrasil

sudo systemctl enable yggdrasil
sudo systemctl start yggdrasil


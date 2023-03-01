#!/bin/bash

echo "* Adding host to /etc/hosts ..."
echo "192.168.99.100 jenkins.do1.lab jenkins" >> /etc/hosts

#echo "Either disable the firewall ..."
#systemctl disable --now firewalld

echo "* Firewall - open ports 80,8080,9070 ..."
sudo firewall-cmd --add-port=80/tcp --permanent
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --add-port=9070/tcp --permanent
sudo firewall-cmd --reload
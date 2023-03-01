#!/bin/bash

echo "* Installing Jenkins"
sudo wget https://pkg.jenkins.io/redhat/jenkins.repo -O /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo dnf makecache
sudo dnf install jenkins -y

echo "* Adding jenkins user to sudoers ..."
echo 'jenkins ALL=(ALL)    NOPASSWD:ALL' | sudo tee -a /etc/sudoers

echo "* Edit Jenkins Service timeout for slower machines..."
sudo grep -q "^TimeoutStartSec=" /lib/systemd/system/jenkins.service && echo "TimeoutStartSec is set" || sudo sed -i '/\[Service\]/a TimeoutStartSec=600' /lib/systemd/system/jenkins.service 

echo "* Jenkins user settings configuration ..."
sudo usermod -s /bin/bash jenkins
jenkinspwd="Password1"
echo -e "$jenkinspwd\n$jenkinspwd" | sudo passwd jenkins
sudo su - jenkins
ssh-keygen -t ecdsa -b 521 -m PEM -N ""
ssh-copy-id jenkins@localhost

echo "* Start and enable Jenkins ..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

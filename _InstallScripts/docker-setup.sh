#!/bin/bash

echo "* Adding Docker repository ..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "* Installing Docker ..."
dnf install -y docker-ce docker-ce-cli containerd.io

echo "* Enable and start Docker ..."
systemctl enable docker
systemctl start docker

echo "* Adding vagrant user to docker group ..."
usermod -aG docker vagrant
usermod -aG docker jenkins

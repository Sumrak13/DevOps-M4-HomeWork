#!/bin/bash

echo "* Installing Java17..."
sudo dnf install java-17-openjdk -y

echo "* Installing Additional Packages ..."
dnf install -y jq tree
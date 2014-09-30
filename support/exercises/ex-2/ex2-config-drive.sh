#!/bin/bash

echo " ===> Configuring ACNG" >> /root/cloud-init.log
echo "Acquire::http { Proxy \"http://acng-yyc.cloud.cybera.ca:3142\"; };"  > /etc/apt/apt.conf.d/01-acng

echo " ===> Updating apt" >> /root/cloud-init.log
apt-get update

echo " ===> Installing base packages" >> /root/cloud-init.log
apt-get install -y curl wget git tmux

echo " ===> Installing Apache" >> /root/cloud-init.log
apt-get install -y apache2

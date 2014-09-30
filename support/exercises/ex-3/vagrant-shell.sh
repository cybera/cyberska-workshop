#!/bin/bash

echo " ===> Configuring ACNG"
echo "Acquire::http { Proxy \"http://acng-yyc.cloud.cybera.ca:3142\"; };"  > /etc/apt/apt.conf.d/01-acng

echo " ===> Updating apt"
apt-get update

echo " ===> Install Puppet"
apt-get install -y puppet

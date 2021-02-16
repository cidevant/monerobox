#!/bin/bash

# This script is used to create the base OS image for monerobox.
# It requires a clean  Armbian_5.69_Rock64_Ubuntu_bionic_default_4.4.167 releases installed
# and a user "rock64" with sudo permission

if [ "$EUID" -ne 0 ] ; then
  echo "Please run as root or with sudo"
  exit
fi

# update apt repo
apt update
apt upgrade -y

# setup zero-conf network
echo "monerobox" > /etc/hostname
apt install -y avahi-daemon

# install docker
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# apt install -y docker-ce docker-ce-cli containerd.io
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
sudo usermod -aG docker pi

# install docker-compose
apt install -y python-pip python-setuptools python-dev libltdl7 libffi-dev
pip install docker-compose==1.24.0


# add user rock64 to docker group
usermod -aG docker pi

# reboot
echo "System will reboot it 10 seconds."
sleep 10
reboot


#!/bin/bash

apt update 
apt install ansible git htop -y
timedatectl set-timezone Europe/Moscow
useradd -m -p  -s /bin/bash ansible
mkdir /home/ansible/.ssh
echo "" >> /home/ansible/.ssh/authorized_keys
sudo echo "ansible ALL=(ALL) ALL" >> /etc/sudoers
#!/usr/bin/env bash

echo "--------------------------------ZORIN-OS-PRO-------------------------------"
echo "-------------------------------------BY PEAKY-------------------------"

sudo rm -r /etc/apt/sources.list.d/zorin.list

sudo cp ./zorin.list /etc/apt/sources.list.d

sudo cp ./99zorin-os-premium-user-agent /etc/apt/apt.conf.d/

cd /etc/apt/apt.conf.d/ 

sudo apt install ca-certificates

sudo apt update

sudo apt install zorin-appearance-layouts-shell-premium

sudo apt install zorin-os-pro-wallpapers

sudo reboot

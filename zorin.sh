#!/usr/bin/env bash

echo "███████╗ ██████╗ ██████╗ ██╗███╗   ██╗     ██████╗ ███████╗    ██████╗ ██████╗  ██████╗ "
echo "╚══███╔╝██╔═══██╗██╔══██╗██║████╗  ██║    ██╔═══██╗██╔════╝    ██╔══██╗██╔══██╗██╔═══██╗"
echo "  ███╔╝ ██║   ██║██████╔╝██║██╔██╗ ██║    ██║   ██║███████╗    ██████╔╝██████╔╝██║   ██║"
echo " ███╔╝  ██║   ██║██╔══██╗██║██║╚██╗██║    ██║   ██║╚════██║    ██╔═══╝ ██╔══██╗██║   ██║"
echo "███████╗╚██████╔╝██║  ██║██║██║ ╚████║    ╚██████╔╝███████║    ██║     ██║  ██║╚██████╔╝"
echo "╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ "
echo "|ZORIN-OS-PRO| |Script v1.0.0| |ʙʏ ᴘᴇᴀᴋʏᴄᴏᴍᴍᴀɴᴅ|"
sleep 1

#delete zorin.list defaut
sudo rm -r /etc/apt/sources.list.d/zorin.list

echo "Changing the defaut server list..."

sleep 1

#copy zorin.list mod
sudo cp ./zorin.list /etc/apt/sources.list.d

#introduces premium user agent
sudo cp ./99zorin-os-premium-user-agent /etc/apt/apt.conf.d/

echo "adding premium subscription..."

sleep 1

#enter the folder
cd /etc/apt/apt.conf.d/

echo "preparing to install dependencies..."
sleep 1
#install ca-certificates
sudo apt install ca-certificates -y

#update packages
sudo apt update -y

#install pro  layouts
sudo apt install zorin-appearance-layouts-shell-premium -y

#install pro  wallpapers
sudo apt install zorin-os-pro-wallpapers -y

echo "all done!! "
echo "Your Zorin Os will restart in 5 seconds.. "
sleep 5

#reboot 
sudo reboot

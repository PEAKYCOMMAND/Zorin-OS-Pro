#!/usr/bin/env bash

echo "███████╗ ██████╗ ██████╗ ██╗███╗   ██╗     ██████╗ ███████╗    ██████╗ ██████╗  ██████╗ "
echo "╚══███╔╝██╔═══██╗██╔══██╗██║████╗  ██║    ██╔═══██╗██╔════╝    ██╔══██╗██╔══██╗██╔═══██╗"
echo "  ███╔╝ ██║   ██║██████╔╝██║██╔██╗ ██║    ██║   ██║███████╗    ██████╔╝██████╔╝██║   ██║"
echo " ███╔╝  ██║   ██║██╔══██╗██║██║╚██╗██║    ██║   ██║╚════██║    ██╔═══╝ ██╔══██╗██║   ██║"
echo "███████╗╚██████╔╝██║  ██║██║██║ ╚████║    ╚██████╔╝███████║    ██║     ██║  ██║╚██████╔╝"
echo "╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ "
echo "|ZORIN-OS-PRO| |Script v1.0.1| |BY PEAKYCOMMAND|"
echo ""
echo "(Please note this ONLY works on Zorin 16)"
sleep 5


# # Delete zorin.list defaut
# sudo rm -r /etc/apt/sources.list.d/zorin.list

echo "Updating the defaut source.list for Zorin's custom resources..."

# Copy zorin.list mod
sudo cp -f ./zorin.list /etc/apt/sources.list.d

echo "Adding premium identity file..."

# Introduces premium user agent
sudo cp ./99zorin-os-premium-user-agent /etc/apt/apt.conf.d/

sleep 1

# # Enter the folder
# cd /etc/apt/apt.conf.d/

echo "Preparing to install other dependencies..."

# Install ca-certificates
sudo apt install ca-certificates -y

# Update packages
sudo apt update -y


echo "Adding premium content..."

# Install pro content
sudo apt install zorin-appearance-layouts-shell-premium zorin-os-pro-wallpapers -y

# # Install pro wallpapers
# sudo apt install zorin-os-pro-wallpapers -y

echo "All done!"
echo "Your Zorin OS instance will now restart in 10 seconds..."
echo "(Press CTRL+C to cancel if you have unsaved work!)"
sleep 10

# Reboot 
sudo reboot

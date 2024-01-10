#!/usr/bin/env bash

echo "███████╗ ██████╗ ██████╗ ██╗███╗   ██╗     ██████╗ ███████╗    ██████╗ ██████╗  ██████╗ "
echo "╚══███╔╝██╔═══██╗██╔══██╗██║████╗  ██║    ██╔═══██╗██╔════╝    ██╔══██╗██╔══██╗██╔═══██╗"
echo "  ███╔╝ ██║   ██║██████╔╝██║██╔██╗ ██║    ██║   ██║███████╗    ██████╔╝██████╔╝██║   ██║"
echo " ███╔╝  ██║   ██║██╔══██╗██║██║╚██╗██║    ██║   ██║╚════██║    ██╔═══╝ ██╔══██╗██║   ██║"
echo "███████╗╚██████╔╝██║  ██║██║██║ ╚████║    ╚██████╔╝███████║    ██║     ██║  ██║╚██████╔╝"
echo "╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚══════╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ "
echo "|ZORIN-OS-PRO| |Script v3.0.0| |Made By PEAKYCOMMAND| |Overhauled By NamelessNanasi/CortezJEL|"
echo ""
echo "(Please note this version ONLY works on Zorin 17 and 16)"
echo "(to use this script on Zorin 16 add the -6 flag or -7 to manually override to zorin 17 although that should be redundant)"
sleep 10

# Prompt user
echo "Please Enter your sudo password!"

# Sudo echo so it always propts here
sudo echo > /dev/null

# Parse command line arguments for flag
while getopts "67" opt; do
  case $opt in
    6)
        sixteen="true"
    ;;
    7)
        sixteen="false"
    ;;
    esac
done

echo "Preparing to install dependencies..."

# Install ca-certificates
sudo apt install ca-certificates aptitude

sleep 2

echo "Updating the defaut source.list for Zorin's custom resources..."

if [ "$sixteen" = "true" ]; then   
            # Copy zorin16.list mod
            sudo cp -f ./zorin16.list /etc/apt/sources.list.d/zorin.list
            # Add the required apt-key to be safe
            curl -sS https://packages.zorinos.com/zorin_os_key.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/Zorin.gpg
        else
            # Copy zorin17.list mod
            sudo cp -f ./zorin17.list /etc/apt/sources.list.d/zorin.list
            # Add the required apt-key to be safe
            curl -sS https://packages.zorinos.com/zorin_os_key.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/Zorin.gpg
fi

sleep 2

echo "adding premium flags..."

# introduces premium user agent
sudo cp -f ./99zorin-os-premium-user-agent /etc/apt/apt.conf.d/

sleep 2

echo "Adding premium content..."

# update packages
sudo aptitude update

if [ "$sixteen" = "true" ]; then   
            # install 16 pro content
            sudo aptitude install zorin-os-pro zorin-os-pro-creative-suite zorin-os-pro-productivity-apps zorin-os-pro-wallpapers zorin-os-pro-wallpapers-16
        else
            # install 17 pro content
            sudo aptitude install zorin-os-pro zorin-os-pro-creative-suite zorin-os-pro-productivity-apps zorin-os-pro-wallpapers zorin-os-pro-wallpapers-17
fi

echo "All done!"
echo 'Please Reboot your Zorin Instance... you can do so with "sudo reboot"'

#!/bin/bash

echo Hello there, this script will update your installed packages.
echo 
echo Some packages might not update due to having an unknown version or it updates directly from the app.
echo 

# Check if Yay is installed on the system
if command -v yay &> /dev/null; then
    # Yay is installed, use it to update the packages
    read -p "Do you want to update packages using Yay? [y/N] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Updating packages using Yay..."
        yay -Syyu --noconfirm
    else
        # Yay is installed, but the user chose not to use it, use default package manager instead
        read -p "Do you want to update packages using the default package manager? [y/N] " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "Updating packages using default package manager..."
            sudo pacman -Syu
        fi
    fi
else
    # Yay is not installed, use default package manager to update the packages
    read -p "Do you want to update packages using the default package manager? [y/N] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Updating packages using default package manager..."
        sudo pacman -Syu
    fi
fi

#!/bin/bash

echo "This script will update your installed packages using Pacman. Do you want to proceed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            # Update package list
            echo "Updating package list..."
            sudo pacman -Syyu --noconfirm

            # Ask user if they want to restart
            read -p "Packages have been updated. Do you want to restart your computer now? [y/n] " restart
            if [ "$restart" == "y" ]; then
                sudo shutdown -r now
            fi
            break;;
        No ) 
            echo "Update cancelled."
            exit;;
    esac
done

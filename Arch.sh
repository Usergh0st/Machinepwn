#!/bin/bash

# Installer script the hacker enviroment, machinepwn by (Usergh0st).
# Only arch linux avaliable installacion no others distros. 
# This script required root user passworld.

# Author: Enríque González aka (Usergh0st)
# repository: https://github.com/Usergh0st/Machinepwn
# Reachme: phoneghost88@gmail.com

# Colors in the installer.
Cyan="\e[1;36m"
White="\e[1;37m"
Blue="\e[1;34m"

# Variables in the script
user=$(whoami)

# The banner of the installer.
Installer_banner () {
    echo -e ""
    echo -e "${Cyan}  _______              __     __                                    "
    echo -e "${Cyan} |   |   |.---.-.----.|  |--.|__|.-----.-----.-----.--.--.--.-----. "
    echo -e "${Cyan} |       ||  _  |  __||     ||  ||     |  -__|  _  |  |  |  |     | "
    echo -e "${Cyan} |__|_|__||___._|____||__|__||__||__|__|_____|   __|________|__|__| "
    echo -e "${Cyan}                                             |__|                   "
    echo -e ""
    echo -e "${White} | BSPWM  | Hacker environment atomation script for arch linux." ; sleep 1.2
    echo -e "${White} | AUHORT | Enríque González (Aka. Usergh0st) https://github.com/Usergh0st" ; sleep  1.2
    echo -e "${White} | INSTALL | Installation will begin soon... please wait ${Cyan}${user} " ; sleep 5
    echo ""
}

# First steps for installation.
First_steps () {
    echo -e ""
}

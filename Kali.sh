#!/usr/bin/env bash

#  __  __         __ __      _____   __
# |  |/  |.---.-.|  |__|    |     |_|__|.-----.--.--.--.--.
# |     < |  _  ||  |  |    |       |  ||     |  |  |_   _|
# |__|\__||___._||__|__|    |_______|__||__|__|_____|__.__|

#  _______               __          __ __
# |_     _|.-----.-----.|  |_.---.-.|  |  |.-----.----.
#  _|   |_ |     |__ --||   _|  _  ||  |  ||  -__|   _|
# |_______||__|__|_____||____|___._||__|__||_____|__|

# The installer script for machinepwn, for kali linux and debian based.
# Only kali linux/debian! avaliable installacion no others distros.
# This script required root user passworld.

# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Mail: usergh0stmail@proton.me
# Last Update: 19.10.2025 9:37 AM

# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license

# The gloval variables for the script.
Backup_folder=~/Machinepwn-backup
Error_log=~/Machinepwn.log

USER=$(whoami)
CURRENT_DIRECTORY=$(pwd)

# Colors use this script.
Cyan="\e[1;36m"
White="\e[1;37m"
Blue="\e[1;34m"
Reset="\e[0m"
Green="\e[1;32m"
LightRed="\e[1;31m"

Usergh0st_logo () {
    echo -e "${Cyan}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠄⠀⠰⡐⠀⠀⠀⠀⠀⠀⢀⣄⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⣿⡆⠀⠀⠀⠄⠀⠈⢀⣤⣤⣬⣥⣤⣀⡀⠀⠀⠀⠂⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠂⠀⠀⠑⠀⠀⠙⠃⠵⠀⢀⣴⣿⡿⠿⠿⠿⠿⠿⠿⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⢰⣶⠀⠱⣆⠐⢦⡀⣠⣿⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣆⡀⠸⠇⣀⠀⣐⢔⠈⠰⠰⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠁⠰⠀⡾⠷⣴⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⡀⠀⠉⠀⠛⠂⢀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⣔⢄⠘⢄⡀⠉⠀⠀⢠⣾⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣷⡄⠀⠟⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀
    ⢀⠀⠀⠉⡈⠀⣀⠑⣤⢾⡆⢸⣿⣿⠀⠀⠀⣀⣀⣀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⣿⣿⣧⠰⠃⡀⠀⣤⠒⠊⠁⠀⠀⠀⠀
    ⠀⠑⢤⣤⣄⠀⠉⠢⠀⠠⠓⢊⣿⣿⠀⠀⣾⣿⣿⣿⣷⠀⠀⢰⣿⣿⣿⣷⠀⠀⣿⣿⣿⠀⣀⠀⠤⠀⠀⠐⠀⠀⠠⠀⠀
    ⠀⠀⠈⡉⠯⠃⠸⠗⠠⣀⡻⢶⣽⣿⡀⠀⠻⣿⣿⣿⡟⠀⡀⠸⣿⣿⣿⡟⠀⢀⣿⣿⣿⠀⠙⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀
    ⠐⠤⠄⠀⠀⢀⠀⢄⡠⡍⠛⠻⣿⣿⣧⡀⠀⠉⠉⠉⠀⣾⣷⡄⠈⠉⠉⠀⣠⣾⣿⣿⡇⠀⠀⢈⣠⣶⠆⠀⠀⠀⠀⠂⠀
    ⠀⠀⠀⠔⣄⢤⡀⠈⠀⠀⣠⣾⣿⣿⡿⣿⣶⣶⠂⠀⠀⠁⠈⠁⠀⠐⣶⣾⣿⡿⣩⣿⣿⣦⡄⠸⠝⠀⠀⠀⠀⠆⢐⠀⠀
    ⠀⠈⠦⡀⠀⠀⠑⡄⢀⣼⣿⣿⣹⣿⣿⣷⣿⣿⣀⠸⡀⢠⡆⢠⡇⢀⣿⣿⠏⣴⣿⣿⢿⢋⣾⣄⠀⠀⠀⠀⠀⡀⠉⠀⠀
    ⠈⣀⡀⠈⠃⡀⠈⢹⣟⢯⡿⣿⣏⠻⣯⣿⣎⡻⢿⣶⣷⣼⣧⣼⣷⣿⠟⠁⣴⣿⣿⠋⣸⣾⣿⣿⣦⠒⠒⠊⠉⢀⠐⠁⠀
    ⠠⠛⠃⠠⠄⡀⡀⣾⣻⣿⣿⢟⣿⣦⡈⠙⡿⣿⣭⣍⣹⢿⣿⣿⡿⠁⠀⣾⣿⡟⣯⡾⣿⣯⡿⢛⣡⡇⠀⣠⠔⠁⠠⠀⠀
    ⠄⠀⡀⠀⠀⠃⣬⡛⣛⠛⠾⣯⣟⢾⡅⠀⠀⠙⢻⠎⢻⠆⠙⡏⠁⠀⠰⡿⠛⣵⡿⠛⠉⣉⣵⣾⣿⣿⡏⠁⠀⠀⢀⠀⠀
    ⢈⡆⠀⢴⣆⣠⣿⣿⡿⣷⣆⠈⠉⢡⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⠒⡄⠀⠾⣟⣯⣿⣿⣿⡅⠀⢤⠀⡀⠀⠀
    ⠀⠑⢄⠀⠉⢸⣷⣖⣛⣋⠙⠿⠄⢸⠀⣷⣿⣷⣶⣿⣿⣶⣷⣷⣾⣿⣶⣷⣾⡆⡇⠀⠻⠟⣱⣿⣭⣾⣇⠍⠁⠀⠠⠀⠀
    ⢀⠀⠀⠶⠀⣿⣿⠿⣿⣿⣷⠦⠀⢸⠀⣿⣿⣿⣿⣿⡟⠉⠈⢿⣿⣿⣿⣿⣿⡇⡇⠀⢠⢾⠿⠶⣶⣿⣿⡄⢀⠀⠀⠀⠀
    ⠀⠀⠄⠀⠀⣿⣷⡏⠀⠀⠀⣰⡀⢻⠀⣿⣿⣿⣿⣿⣷⣄⣰⣿⣿⣿⣿⣿⣿⡇⡿⠀⣰⡀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠻⣿⣷⣀⣠⣴⣿⡿⢾⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡷⠾⣿⣿⣶⣶⣿⣿⡿⠃⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠗⠉⠉⠉⠉⠉⠉⠀         ${Reset}"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
}

Welcome () {
	reset ; Usergh0st_logo ; sleep 1.2 ; echo -e ""

	echo -e " ${White}Welcome ${Blue}${USER} ${White}to script installer... ${Reset}" ; sleep 1.2
	echo -e " ${White}Script created by Enríque González Aka ${Blue}(Usergh0st)${White}... ${Reset}" ; sleep 1.2 ; echo -e ""

	echo -e " ${Cyan}This script will install the desktop environment machinepwn on your kali linux ${Reset}"
	echo -e " ${Cyan}This script will do the following operations and actions on your machine ${Reset}" 
}

#  _______ _______ _______ _______      ______ _______ _______
# |   |   |   _   |_     _|    |  |    |   __ \   |   |    |  |
# |       |       |_|   |_|       |    |      <   |   |       |
# |__|_|__|___|___|_______|__|____|    |___|__|_______|__|____|

Welcome

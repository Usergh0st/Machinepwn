#!/usr/bin/env sh
# ===========================================================================
#  __  __         __ __      _____   __
# |  |/  |.---.-.|  |__|    |     |_|__|.-----.--.--.--.--.
# |     < |  _  ||  |  |    |       |  ||     |  |  |_   _|
# |__|\__||___._||__|__|    |_______|__||__|__|_____|__.__|
#  _______               __          __ __
# |_     _|.-----.-----.|  |_.---.-.|  |  |.-----.----.
#  _|   |_ |     |__ --||   _|  _  ||  |  ||  -__|   _|
# |_______||__|__|_____||____|___._||__|__||_____|__|

# Description: Kali Linux installer script for machinepwn desktop environment.
# 	       The installer script for machinepwn, for kali linux and debian based.
# 	       Only kali linux/debian! avaliable installacion no others distros.
# 	       This script required root user passworld.

# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Mail: usergh0stmail@proton.me
# Last Update: 21.12.2025 8:54 AM
# Description: Kali Linux installer script.

# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# ==========================================================================

# Colors use this script. | Colores en el script.
Cyan="\e[1;36m"
White="\e[1;37m"
Blue="\e[1;34m"
Reset="\e[0m"
Green="\e[1;32m"
LightRed="\e[1;31m"

# Utils variables. | variables de utilidades.
bspwm="https://github.com/baskerville/bspwm.git"
sxhkd="https://github.com/baskerville/sxhkd.git"
picom="https://github.com/yshui/picom.git"
myrepo="https://github.com/Usergh0st/Machinepwn.git"

# List of packages to install | lista de paquetes a instalar.
libs="libxcb-xkb-dev libxkbcommon-dev librsvg2-common build-essential libxcb1-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-keysyms1-dev \
      libxcb-xinerama0-dev libxcb-shape0-dev libxcb-cursor-dev pkg-config"

xorg="xserver-xorg-core xserver-xorg-video-fbdev xserver-xorg-input-all x11-xserver-utils xinit xinput"

pkgs="polybar rofi alacritty nitrogen zsh git wget curl net-tools xdotool pulseaudio-utils pulseaudio pavucontrol \
     fastfetch papirus-icon-theme awaita-icon-theme"

# Logo function | Funcion del logo.
logo () {
echo -e "${LightRed}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
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
   ⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠗⠉⠉⠉⠉⠉⠉⠀  ⠀⠀ ${Reset}\n"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
}

trap ctrl_c INT

function ctrl_c () {
	echo -e "${LightRed} Exiting the script goodbye! ${Reset}\n"
	exit 1
}

# Check if the script is run as root | Comprobar si el script se ejecuta como root.
initial_checks () {

	# Get root temporary permissions | obtener permisos temporales de root.
	reset ; logo ; sudo -v

	# Check if the script is run from HOME directory | comprobar si el script se ejecuta desde el directorio home.	
	if [ "${PWD}" != "${HOME}" ]; then

		clear ; logo

		echo -e "${White}The script must be executed from home directory.${Reset}"
		echo -e "${White}Please move the script to your home directory and run it again.${Reset}"
		echo -e "${White}Current directory: ${LightRed}${PWD}${Reset}"
		echo -e ""
		exit 1
	fi

	# Check linux distro avalible kali linux/debian) | comprobar distro de linux valido kali o debian.
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		if [ "$ID" != "kali" ] && [ "$ID" != "debian" ]; then

			clear ; logo

			echo -e "${White}This installer is only for kali Linux or debian based distros.${Reset}"
			echo -e "${White}Your current distro is not supported.${Reset}"
			echo -e "${White}Your current distro is: ${LightRed}${NAME}${Reset}"
			echo -e ""
			exit 1
		fi
	fi
}

# Welcome function | funcion de bienvenida.
welcome () {

	clear ; logo

	echo -e "${Cyan}This script will install my desktop environment and this is what it will do:${Reset}\n"
	echo -e "${White}Download my desktop environment in: ${Green}${HOME}/Machinepwn${Reset}"
	echo -e "${White}Install required packages and necessary dependencies.${Reset}"
	echo -e "${White}Backup of possible existing configurations like ${Green}(bspwm, polybar, etc...)${Reset}"
	echo -e "${White}Install and setup the desktop environment ${Green}(Machinepwn)${Reset}"
	echo -e "${White}Enabling some service and change your shell to zsh shell.${Reset}\n"
	echo -ne "${Cyan}Press ${Green}return${Cyan} to start the installation or ${LightRed}(ctrl+c)${Cyan} to exit.${Reset} "
	read
}

install_dependencies () {

	# Install required packages and dependencies | instalar paquetes y dependencias necesarias.
	echo -e ""
	echo -e "${White}Updating and installing required packages and dependencies...${Reset}\n"
	sudo apt update ; sudo apt full-upgrade -y ; sudo apt install -y ${libs} ${xorg} ${pkgs} --no-install-recommends
	echo -e ""
}

install_bspwm_sxhkd_and_others () {

	# Clone repositories | clonar repositorios.
	echo -e "${White}Cloning repositories in the current working folder...${Reset}\n"
	mkdir -p cloning ; cd cloning ; git clone ${bspwm} ; git clone ${sxhkd} ; git clone ${picom} ; git clone ${myrepo}

	# Install bspwm with repository | instalar bspwm con el repositorio.
	echo -e "${White}Installing bspwm...${Reset}\n"
	cd bspwm ; make ; sudo make install ; cd ..

	# Install sxhkd with repository | instalar sxhkd con el repositorio.
	echo -e "${White}Installing sxhkd...${Reset}\n"
	cd sxhkd ; make ; sudo make install ; cd ..

	# Install picom with repository | instalar picom con el repositorio.
	# echo -e "${White}Installing picom...${Reset}\n"
	# cd picom ; make ; sudo make install ; cd ..

	# Cloning my repo | clonando mi repo nachinepwn.
	echo -e "${White}Cloning Machinepwn repository...${Reset}\n"
	git clone ${myrepo} ; cd Machinepwn
}

# Main routine | rutina principal.
initial_checks
welcome
install_dependencies

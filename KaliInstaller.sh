#!/usr/bin/env bash
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
      libxcb-xinerama0-dev libxcb-shape0-dev libxcb-cursor-dev pkg-config libxcb-icccm4-dev"

xorg="xserver-xorg-core xserver-xorg-video-fbdev xserver-xorg-input-all x11-xserver-utils xinit xinput"

pkgs="polybar rofi alacritty nitrogen zsh git wget curl net-tools xdotool pulseaudio-utils pulseaudio pavucontrol \
     fastfetch papirus-icon-theme adwaita-icon-theme"

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

# Initial checks function | funcion de comprobaciones iniciales.
initial_checks () {

	# Get root temporary permissions | obtener permisos temporales de root.
	reset ; logo ; sudo -v

	# Check if the script is run from home directory | comprobar si el script se ejecuta desde el directorio home.
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
	echo -e "${White}Download my desktop environment in: ${Green}${HOME}/cloning/Machinepwn${Reset}"
	echo -e "${White}Install required packages and necessary dependencies.${Reset}"
	echo -e "${White}Backup of possible existing configurations like ${Green}(bspwm, polybar, etc...)${Reset}"
	echo -e "${White}Install and setup the desktop environment ${Green}(Machinepwn)${Reset}"
	echo -e "${White}Enabling some service and change your shell to zsh shell.${Reset}\n"
	echo -ne "${Cyan}Press ${Green}return${Cyan} to start the installation or ${LightRed}(ctrl+c)${Cyan} to exit.${Reset} "
	read
}

install_dependencies () {

	# Install required packages and dependencies | instalar paquetes y dependencias necesarias.
	
	clear ; logo

	echo -e "${White}Updating and installing required packages and dependencies...${Reset}"
	sudo apt update &>/dev/null ; sudo apt full-upgrade -y &>/dev/null ; sudo apt install -y ${libs} ${xorg} ${pkgs} --no-install-recommends &>/dev/null
	echo -e "${Green}Once done the system was updated and the necessary dependencies were installed.${Reset}\n"
}

install_bspwm_sxhkd_and_others () {

	# Clone repositories | clonar repositorios.
	echo -e "${White}Cloning repositories in the current working folder...${Reset}\n"

		# Checks folder exist or no | comprobar si la carpeta existe o no.
		if [ -f "${HOME}/cloning" ]; then
			echo -e "${White}The folder ${LightRed}(cloning)${White} already exists in your home directory.${Reset}\n"
			rm -rf "${HOME}/cloning"
		fi

	mkdir -p cloning ; cd cloning ; git clone ${bspwm} &>/dev/null ; git clone ${sxhkd} &>/dev/null ; git clone ${picom} &>/dev/null ; git clone ${myrepo} &>/dev/null

	# Install bspwm with repository | instalar bspwm con el repositorio.
	echo -e "${White}Installing bspwm with the repository...${Reset}"
	cd bspwm ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
	echo -e "${Green}bspwm was installed.${Reset}\n" ; sleep 1.1

	# Install sxhkd with repository | instalar sxhkd con el repositorio.
	echo -e "${White}Installing sxhkd with the repository...${Reset}"
	cd sxhkd ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
	echo -e "${Green}sxhkd was installed.${Reset}\n" ; sleep 1.1

	# Install picom with repository | instalar picom con el repositorio.
	# echo -e "${White}Installing picom...${Reset}\n"
	# cd picom ; make ; sudo make install ; cd ..
}

Backup_old_configurations () {
	# Backup old configurations | hacer backup de las configuraciones antiguas.
	echo -e "${White}Backing up old configurations...${Reset}\n"

	cd "${HOME}" ; mkdir -p "Backup" ; cd Backup

	if [ -d "${HOME}/.config/bspwm" ]; then
		mv "${HOME}/.config/bspwm" "${HOME}/Backup/bspwm.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}bspwm configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing bspwm configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/sxhkd" ]; then
		mv "${HOME}/.config/sxhkd" "${HOME}/Backup/sxhkd.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}sxhkd configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing sxhkd configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/polybar" ]; then
		mv "${HOME}/.config/polybar" "${HOME}/Backup/polybar.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}polybar configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing polybar configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/alacritty" ]; then
		mv "${HOME}/.config/alacritty" "${HOME}/Backup/alacritty.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}alacritty configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing alacritty configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/picom" ]; then
		mv "${HOME}/.config/picom" "${HOME}/Backup/picom.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}picom configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing picom configuration found skipping backup.${Reset}" ; sleep 1.1
	fi
}

# Main routine | rutina principal.
initial_checks
welcome
install_dependencies
install_bspwm_sxhkd_and_others
Backup_old_configurations

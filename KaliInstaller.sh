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
# The installer script for machinepwn, for kali linux and debian based.
# Only kali linux/debian avaliable installacion no others distros.
# This script required root user passworld.

# Author: Enríque González Aka (Usergh0st)
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Mail: usergh0stmail@proton.me
# Last Update: 17.01.2026 06:48 PM
# Script Version: 1.3
# Coutings atempt: 24

# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2026-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# ==========================================================================

# Colors use this script | colores en el script
Cyan="\e[1;36m"
White="\e[1;37m"
Blue="\e[1;34m"
Reset="\e[0m"
Green="\e[1;32m"
LightRed="\e[1;31m"
Bold="\e[1m"

# Utils variables | variables de utilidades
bspwm="https://github.com/baskerville/bspwm.git"
sxhkd="https://github.com/baskerville/sxhkd.git"
picom="https://github.com/yshui/picom.git"
repo_url="https://github.com/Usergh0st/Machinepwn.git"
powerlevel10k="https://github.com/romkatv/powerlevel10k.git"
fzftabgit="https://github.com/Aloxaf/fzf-tab.git"
zsh_sudo="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/refs/heads/master/plugins/sudo/sudo.plugin.zsh"

# List of packages to install | lista de paquetes a instalar
libs="libxcb-xkb-dev libxkbcommon-dev librsvg2-common build-essential libxcb1-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-keysyms1-dev \
      libxcb-xinerama0-dev libxcb-shape0-dev libxcb-cursor-dev pkg-config libxcb-icccm4-dev"

xorg="xserver-xorg-core xserver-xorg-video-fbdev xserver-xorg-input-all x11-xserver-utils xinit xinput"

pkgs="polybar rofi alacritty zsh git wget curl net-tools xdotool pulseaudio-utils pulseaudio pavucontrol fzf psmisc \
     fastfetch papirus-icon-theme adwaita-icon-theme bat firefox-esr openvpn bleachbit mousepad feh eza"

# Logo function | funcion del logo
logo () {
  export LC_ALL="${LC_ALL:-C.UTF-8}"
  export LANG="${LANG:-C.UTF-8}"

  printf '%b' "${Bold}${LightRed}"
  cat <<'LOGO'
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
   ⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠹⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠗⠉⠉⠉⠉⠉⠉⠀  ⠀⠀
LOGO
  printf '%b\n' "${Reset}"
}

# Fetch or traps ctrl_c | function para traquear el ctrl_c y salir.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
trap ctrl_c INT
function ctrl_c () {
	echo -e "${LightRed} Exiting the script goodbye! ${Reset}\n"
	exit 1
}

# Initial checks function | funcion de comprobaciones iniciales
initial_checks () {

	# Get root temporary permissions | obtener permisos temporales de root
	reset ; logo ; sudo -v

	# Check if the script is run from home directory | comprobar si el script se ejecuta desde el directorio home
	if [ "${PWD}" != "${HOME}" ]; then

		clear ; logo

		echo -e "${White}The script must be executed from home directory.${Reset}"
		echo -e "${White}Please move the script to your home directory and run it again.${Reset}"
		echo -e "${White}Current directory: ${LightRed}${PWD}${Reset}"
		echo -e ""
		exit 1
	fi

	# Check linux distro avalible (kali linux/debian) | comprobar distro de linux valido kali o debian
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

# Welcome function | funcion de bienvenida
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

# Install dependencies function | funcion de instalacion de dependencias
install_dependencies () {

	# Install required packages and dependencies | instalar paquetes y dependencias necesarias
	
	clear ; logo

	echo -e "${White}Updating and installing required packages and dependencies...${Reset}\n" ; sleep 2
	sudo apt update ; sudo apt full-upgrade -y ; sudo apt install -y ${libs} ${xorg} ${pkgs} --no-install-recommends

	clear ; logo

	echo -e "${Green}Once done the system was updated and the necessary dependencies were installed.${Reset}"
}

# Install bspwm, sxhkd and others function | funcion de instalacion de bspwm, sxhkd y otros
install_bspwm_sxhkd_and_others () {

	# Clone repositories | clonar repositorios
	echo -e "${White}Cloning repositories in the current working folder...${Reset}\n"

		# Checks folder exist or no | comprobar si la carpeta existe o no.
		if [ -d "${HOME}/cloning" ]; then
			echo -e "${White}The folder ${LightRed}(cloning)${White} already exists in your home directory.${Reset}\n"
			rm -rf "${HOME}/cloning"
		fi

	mkdir -p cloning ; cd "cloning" ; git clone --depth 1 --no-tags ${bspwm} &>/dev/null ; git clone --depth 1 --no-tags ${sxhkd} &>/dev/null ; git clone --depth 1 --no-tags ${picom} &>/dev/null ; git clone --depth 1 --no-tags ${repo_url} &>/dev/null

	sudo git clone --depth 1 --no-tags ${powerlevel10k} /usr/share/zsh-theme-powerlevel10k &>/dev/null ; sudo git clone --depth 1 --no-tags ${fzftabgit} /usr/share/fzf-tab-git &>/dev/null

	if command -v bspwm &>/dev/null; then
		echo -e "${Green}The bspwm is already installed on your system.${Reset}"
	else
		# Install bspwm with repository | instalar bspwm con el repositorio
		echo -e "${White}Installing bspwm with the repository...${Reset}"
		cd bspwm ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
		echo -e "${Green}bspwm was installed.${Reset}\n" ; sleep 1.1
	fi

	if command -v sxhkd &>/dev/null; then
		echo -e "${Green}The sxhkd is already installed on your system.${Reset}"
	else
		# Install sxhkd with repository | instalar sxhkd con el repositorio
		echo -e "${White}Installing sxhkd with the repository...${Reset}"
		cd sxhkd ; make &>/dev/null ; sudo make install &>/dev/null ; cd ..
		echo -e "${Green}sxhkd was installed.${Reset}\n" ; sleep 1.1
	fi

	#if command -v picom; then
	#echo -e "${White}The picom compositor is already installed on your system."
	#else
		# Install picom with repository | instalar picom con el repositorio.
		# echo -e "${White}Installing picom...${Reset}\n"
		# cd picom ; make ; sudo make install ; cd ..
	#fi
}

# Backup old configurations function | funcion de backup de configuraciones antiguas
Backup_old_configurations () {

	clear ; logo

	# Backup old configurations | hacer backup de las configuraciones antiguas
	echo -e "${White}Backing up old configurations...${Reset}\n"

	cd "${HOME}" ; mkdir -p "backup" ; cd "backup"

	if [ -d "${HOME}/.config/bspwm" ]; then
		mv "${HOME}/.config/bspwm" "${HOME}/backup/bspwm.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}bspwm folder configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing bspwm configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/sxhkd" ]; then
		mv "${HOME}/.config/sxhkd" "${HOME}/backup/sxhkd.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}sxhkd folder configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing sxhkd configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/polybar" ]; then
		mv "${HOME}/.config/polybar" "${HOME}/backup/polybar.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}polybar folder configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing polybar configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/alacritty" ]; then
		mv "${HOME}/.config/alacritty" "${HOME}/backup/alacritty.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}alacritty folder configuration backed up.${Reset}" ; sleep 1.1
	else
		echo -e "${White}No existing alacritty configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -d "${HOME}/.config/picom" ]; then
		mv "${HOME}/.config/picom" "${HOME}/backup/picom.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}picom folder configuration backed up.${Reset}\n" ; sleep 1.1
	else
		echo -e "${White}No existing picom configuration found skipping backup.${Reset}" ; sleep 1.1
	fi

	if [ -f "${HOME}/.zshrc" ]; then
		mv "${HOME}/.zshrc" "${HOME}/backup/zshrc.bak_$(date +%Y%m%d%H%M%S)"
		echo -e "${Green}.zshrc file configuration backed up.${Reset}\n" ; sleep 1.1
	else
		echo -e "${White}No existing .zshrc file configuration found skipping backup.${Reset}\n" ; sleep 1.1
	fi
}

# Change the default shell to zsh | cambiar la shell por defecto a zsh
machinepwn_change_default_shell () {

	clear ; logo

	who_user=$(whoami)
	zsh_path=$(command -v zsh)
	echo -e "${White}Changing the shell to zsh for the user ${LightRed}${who_user}...${Reset}" ; sleep 2

    	if [ -z "${zsh_path}" ]; then
        	echo -e "${LightRed}The shell zsh is not installed cannot change shell.${Reset}" ; sleep 2
    	fi

	if [ "${SHELL}" != "${zsh_path}" ]; then

        	echo -e "${White}Changing your shell to zsh please wait${Reset}\n" ; sleep 1.1

		if chsh -s "${zsh_path}"; then
			echo -e "${Green}Okay it switched to zsh by default.${Reset}" ; sleep 1.1
		else
			echo -e "${LightRed}Errors occurred while switching shells.${Reset}" ; sleep 1.1
		fi

	else
		echo -e "${Green}Zsh is already your default shell.${Reset}" ; sleep 2
	fi
}

# Install machinepwn configuration files function | funcion de instalacion de archivos de configuracion de machinepwn
install_machinepwn_configurations () {

	reset ; clear ; logo

	# Copying directories also add permissions | copiando directorios y agregando permisos
	echo -e "${White}Installing machinepwn configuration please wait...${Reset}"
	cd "${HOME}/cloning/Machinepwn/home/.config" ; cp -r * "${HOME}/.config"

	# Add permissions files | agregando permisos a los archivos
	cd "${HOME}/.config/bspwm/" ; chmod +x bspwmrc ; chmod +x sxhkdrc
	cd "${HOME}/.config/bspwm/src" ; chmod +x *
	cd "${HOME}/.config/bspwm/polybar/barpwn" ; chmod +x launch.sh
	cd "${HOME}/.config/bspwm/polybar/homebar" ; chmod +x launch.sh
	
	# Copying zsh files and others | copiando archivos zsh y otras cosas
	cd "${HOME}/cloning/Machinepwn/home/"
	cp .xinitrc .zprofile .zshrc .p10k.zsh "${HOME}"

	# Check if the destination folders exist | check if the destination folders exist
	if [ -d "${HOME}/.local/share" ]; then

		# Installing the fonts | instalar las fuentes
		cd "${HOME}/cloning/Machinepwn/home/"
		cp -r fonts "${HOME}/.local/share/fonts" ; fc-cache -fv &>/dev/null
	else

		# Installing the fonts | instalar las fuentes
		mkdir -p "${HOME}/.local/share" ; cd "${HOME}/cloning/Machinepwn/home/"
		cp -r fonts "${HOME}/.local/share/fonts" ; fc-cache -fv &>/dev/null
	fi

	# Installing others thins | instalar otras cosas
	folder="bin" ; mkdir -p "~/.local/${folder}"
	cd "${HOME}/cloning/Machinepwn/misc" ; cp * "${HOME}/.local/${folder}"
	chmod +x * "${HOME}/.local/${folder}"

	# Temporary text for modules updates | texto temporal para el modulo updates
	sudo mkdir -p "/var/cache/machinepwn"
	sudo "echo '0' > /var/cache/machinepwn/updates.txt" &>/dev/null
	sudo chmod o+wr "/var/cache/machinepwn/updates.txt"

	# Installing zsh sudo plugin | instalar el plugin sudo zshrc
	sudo mkdir -p "/usr/share/zsh-sudo" ; cd "/usr/share/zsh-sudo"

	if command -v wget &>/dev/null; then
		sudo wget ${zsh_sudo} &>/dev/null
	elif command -v curl &>/dev/null; then
		sudo curl -LO ${zsh_sudo} &>/dev/null
	else
		echo -e "${LightRed}Error: Curl or wget binaries not found.${Reset}" ; sleep 3
	fi

	echo -e "${Green}Machinepwn configuration installed correctly.${Reset}\n" ; sleep 3
}


# Configure and enable some services | confugurando y habilitando algunos servicios
machinepwn_configure_services () {

	clear ; logo

	echo -e "${White}Configure and enable some services...${Reset}" ; sleep 2

	# Open directory services | Abriendo el directorio de servicios
	cd ${HOME}/.config/systemd/user

	# Enable user services update polybar hook | Habilitando el servicio que actualiza el hook en la polybar
	systemctl --user daemon-reload ; systemctl --user enable --now polybar-update.path &>/dev/null ; systemctl --user enable --now polybar-update.service &>/dev/null

	# Copying services kali update to /etc/systemd/system/ and enable | Copiando servicios de kali updates a /etc/systemd/system/
	sudo cp "KaliUpdates.service" "KaliUpdates.timer" "/etc/systemd/system/" ; cd "/etc/systemd/system/"
	sudo systemctl daemon-reexec ; sudo systemctl daemon-reload ; sudo systemctl enable --now KaliUpdates.timer &>/dev/null ; sudo systemctl enable --now KaliUpdates.service &>/dev/null
	
	# Copying the script in the working directory | Copiando el script en el directorio de trabajo
	cd "${HOME}/.config/bspwm/src" ; sudo cp "KaliUpdates.sh" "/usr/local/bin/" ; sudo chmod +x "KaliUpdates.sh"

	echo -e "${Green}Everything is ready services are enabled.${Reset}\n" ; sleep 1.2
}

machinepwn_final_steps () {
	echo -e "${White}Deleting cloning folder and clean apt...${Reset}" ; sleep 2
	
	sudo rm -rf ${HOME}/cloning

	echo -e "${Green}Almost everything is ready.${Reset}\n"
	echo -ne "${White}Do you want to restart the system? ${LightRed}(y/n) ${Reset}"
	read choice

	if [ ${choice} == "y" ]; then
		echo -e "${Green}Restarting the system...${Reset}" ; sleep 3
		sudo systemctl reboot
	else
		echo -e "${LightRed}The user aborting restart...${Reset}" ; sleep 3
		echo -e "${LightRed}Exiting the script goodbye!${Reset}\n" ; sleep 3
		exit 0
	fi
}

# Main routine | rutina principal
initial_checks
welcome

install_dependencies
install_bspwm_sxhkd_and_others
Backup_old_configurations
machinepwn_change_default_shell

install_machinepwn_configurations
machinepwn_configure_services
machinepwn_final_steps

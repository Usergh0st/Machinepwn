#!/usr/bin/env bash
# ==========================================================
# Author: Usergh0st
# File: WallSelect.sh
# Description: Simple script that sets a wallpaper.
# Date: 25.12.2025
# Repository: https://github.com/Usergh0st/Machinepwn.git
# ==========================================================

# Variable feth walls directory.
wallpapers_directory="~/.config/bspwm/walls"

# Search for a wallpaper in any format.
wallpapers=($(find "${wallpapers_directory}" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# Pick one at random.
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set wallpaper.
feh --bg-scale "${random_wallpaper}"

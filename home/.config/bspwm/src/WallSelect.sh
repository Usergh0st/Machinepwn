#!/usr/bin/env bash
# ==========================================================
# Author: Usergh0st
# File: WallSelect.sh
# Description: Simple script that sets a wallpaper.
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Date: 12.01.2026
# ==========================================================

# Variable feth walls directory.
wallpapers_directory="${HOME}/.config/bspwm/walls"

# Search for a wallpaper in any format.
wallpapers=($(find "${wallpapers_directory}" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# Pick one at random.
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set wallpaper.
feh --bg-scale "${random_wallpaper}"

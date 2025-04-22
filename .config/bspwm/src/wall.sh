#!/usr/bin/env bash

# Simples script to set wallpapers using feh.

username=$(whoami)

# Choose wallpapers dir.

wallpapers_dir="/home/${username}/.config/bspwm/walls"
wallpapers=($(find "$wallpapers_dir" -type f -name "*.png" -o -name "*.jpg" -o -name "*.jpeg"))

# Random wallpaper select.
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set a random wallpaper using feh.
feh --bg-scale "$random_wallpaper"


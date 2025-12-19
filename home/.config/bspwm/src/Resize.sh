#!/usr/bin/env bash
# =======================================================
# Usergh0st
# File: Resize.sh
# https://github.com/Usergh0st/Machinepwn.git
# 14.12.2025
# Description: A simple script to resize the windows.
# 	       Extracted from S4vitar Academy.
# =======================================================

if bspc query -N -n focused.floating > /dev/null; then
	step=20
else
	step=100
fi

case "$1" in
	west) dir=right; falldir=left; x="-$step"; y=0;;
	east) dir=right; falldir=left; x="$step"; y=0;;
	north) dir=top; falldir=bottom; x=0; y="-$step";;
	south) dir=top; falldir=bottom; x=0; y="$step";;
esac

bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"

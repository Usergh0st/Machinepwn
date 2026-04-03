#!/usr/bin/env bash
# ============================================================================
# Author: Enríque González Aka (Usergh0st)
# File: target.sh
# Description: Small script that pinpoints the machine that was attacked.
# Repository: https://github.com/Usergh0st/Machinepwn
# Date: 18.03.2026
# Licensed: under GPL-3 Licensed
# ============================================================================

FILE=/tmp/target

if [ $# -eq 0 ]; then
	if [ -e "${FILE}" ]; then
		batcat ${FILE}
	else
		printf "󰆨"
	fi

elif [ "$1" = "reset" ]; then
	rm /tmp/target
else
	echo "$1" > ${FILE}
fi

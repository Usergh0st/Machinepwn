#!/usr/bin/env bash
# ============================================================================
# Author:Usergh0st
# File: target.sh
# Description: Small script that pinpoints the machine that was attacked.
# Date: 19.12.2025
# Repository: https://github.com/Usergh0st/Machinepwn.git
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

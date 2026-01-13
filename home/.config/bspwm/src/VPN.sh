#!/usr/bin/env bash
# ======================================================
# Author: Usergh0st
# File: VPN.sh
# Description: A simple script to show vpn conected.
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Date: 12.01.2026
# ======================================================

if ip link show tun0 &>/dev/null; then
	ip_addr=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

	if [[ -n "${ip_addr}" ]]; then
		echo -e "${ip_addr}"
	else
		echo -e "%{F-}"
	fi
else
	echo -e "VPN%{F-}"
fi

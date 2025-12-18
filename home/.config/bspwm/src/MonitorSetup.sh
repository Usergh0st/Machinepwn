#!/usr/bin/env bash
# ==========================================================================================
# Usergh0st
# File Script: MonitorSetup.sh
# Description: Dynamic multi-monitor support and configuration for bspwm using xrandr
# https://github.com/Usergh0st/Machinepwn.git
# 18.12.2025
#
# Copyright (C) 2025-2026 Usergh0st <usergh0stmail@proton.me>
# Copyright (C) 2027-2027 Usergh0st <usergh0stmail@proton.me>
# Licensed under GPL-3.0 license
# =========================================================================================

# Xrandr cmd to get connected monitors and their resolutions.
ouput_xrandr=$(xrandr -q)

# Funtion to obtain monitor info.
feth_monitor_info () {
    echo "${ouput_xrandr}" | awk -v monitor="$1" '
        $1 == monitor { getline; print $1, $2 }
    ' | tr -d '*+'
}

# Fetch connected monitors.
set -- $(echo -e "${ouput_xrandr}" | awk '$2 == "connected" {print $1}')
NUM_MONITORS=$#

# Configure monitors based on the number of connected monitors.
case ${NUM_MONITORS} in
	1)
		monitor_1="$1"

		set -- $(feth_monitor_info "${monitor_1}")
		mode_1="$1"
		rate_1="$2"

		xrandr --output "${monitor_1}" --primary --mode "${mode_1}" --pos 0x0 --rate "${rate_1}"
		bspc monitor "${monitor_1}" -d 1 2 3 4 5
		;;
	2)
		monitor_1="$1"
		monitor_2="$2"

		set -- $(feth_monitor_info "${monitor_1}")
		mode_1="$1"
		rate_2="$2"

		set -- $(feth_monitor_info "${monitor_2}")
		mode_2="$1"
		rate_2="$2"

		xrandr --output "${monitor_1}" --primary --mode "${mode_1}" --pos 0x0 --rate "${rate_1}" \
			--output "${monitor_2}" --mode "${mode_2}" --right-of "${monitor_1}" --auto --rate "${rate_2}"

		bspc monitor "${monitor_1}" -d 1 2 3 4
		bspc monitor "${monitor_2}" -d 5 6 7 8
		bspc wm -O "${monitor_1}" "${monitor_2}"
		;;
esac

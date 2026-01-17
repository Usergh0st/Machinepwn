#!/bin/sh
# =================================================================
# File: OpenApps.sh
# Author: Usergh0st
# Description: Control apps to launch.
# Repository: https://github/Usergh0st/Machinepwn.git
# Date: 14.01.2026
# Licensed: under GPL-3 Licensed
# ================================================================

case "${1}" in
	# Terminal alacritty launch modes
	# Choose your option dear user
	--terminal)
		Term.sh --terminal ;;
	--floating)
		Term.sh --floating ;;
	--update)
		Term.sh --update ;;
	--checkupdates)
		Term.sh --checkupdates ;;
	*)
		echo "Invalid Option" ;;
esac

#!/usr/bin/env bash
#  _____                           __
# |     |_.---.-.--.--.-----.----.|  |--.
# |       |  _  |  |  |     |  __||     |
# |_______|___._|_____|__|__|____||__|__|

# File to propouse launch the polybar.
# Terminate already running bar instances.
# If all your bars have ipc enabled you can use:

# polybar-msg cmd quit
# Otherwise you can use the nuclear option.
# Launch the polybar BarPwn.

killall -q polybar ; killall -q homebar ; pidof -q homebar || { polybar -q homebar -c "${HOME}"/.config/bspwm/polybar/homebar/config.ini & }
echo "The polybar homebar has launched..."

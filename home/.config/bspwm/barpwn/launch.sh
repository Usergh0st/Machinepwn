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
killall -q polybar ; killall -q barpwn ; pidof -q barpwn || { polybar -q barpwn -c "${HOME}"/.config/bspwm/barpwn/config.ini & }

echo "The polybar barpwn has launched..."

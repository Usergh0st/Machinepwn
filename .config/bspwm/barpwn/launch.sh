#!/usr/bin/env bash

#  _____                           __    
# |     |_.---.-.--.--.-----.----.|  |--.
# |       |  _  |  |  |     |  __||     |
# |_______|___._|_____|__|__|____||__|__|
                                       
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit

# Otherwise you can use the nuclear option:
# killall -q polybar
# Launch the polybar BarPwn.

killall -q barpwn ; pidof -q barpwn || { polybar -q barpwn -c "${HOME}"/.config/bspwm/barpwn/config.ini & }


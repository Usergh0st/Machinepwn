#!/usr/bin/env bash
# ==========================================================================
# Usergh0st
# File: powermenu.sh
# https://github.com/Usergh0st/Machinepwn.git
# 14.12.2025
# Description: A simple script powermenu, shutdown, restart and much more.
# ==========================================================================

# Enable strict mode.
set -euo pipefail

# Theme rofi path.
theme="${HOME}/.config/bspwm/rofi/powermenu.rasi"

# Prompt.
user="$(whoami)"

# Options.
power="󰤆"
restart="󰑐"
suspend="󰽥"
lock="󰕆"
logout="󰗽"

rofi_menu() {
  rofi -dmenu -i \
    -p "Goodbye ${user}" \
    -theme "${theme}"
}


# Show menu + capture choice.
choice="$(
  printf "%s\n%s\n%s\n%s\n%s\n" \
    "$lock" "$suspend" "$logout" "$restart" "$power" \
  | rofi_menu
)"


# Execute immediately.
case "${choice:-}" in
  "$lock")
    if command -v betterlockscreen >/dev/null 2>&1; then
      betterlockscreen -l
    elif command -v i3lock >/dev/null 2>&1; then
      i3lock -c 000000
    fi
    ;;
  "$suspend")
    systemctl suspend
    ;;
  "$logout")
    bspc quit
    ;;
  "$restart")
    systemctl reboot
    ;;
  "$power")
    systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac


#!/bin/bash
#                                    
# .-----.----.----.-----.-----.-----.
# |__ --|  __|   _|  -__|  -__|     |
# |_____|____|__| |_____|_____|__|__|
#
# Simples script set the monito resolution.
OUTPUT=$(xrandr | awk '/ connected/ {print $1; exit}')

if [[ -z "$OUTPUT" ]]; then
    echo "❌ No output video"
    exit 1
fi

echo "✅ Output detect: $OUTPUT"

# Set your resolution (1920x1080)
xrandr --output "$OUTPUT" --mode 1920x1080

echo "✅ Resolution 1920x1080"

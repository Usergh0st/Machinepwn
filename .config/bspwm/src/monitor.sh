#!/bin/bash

# Detect if we are in virtualbox.
if lspci | grep -qi virtualbox; then
    echo "Virtualbox detected adjusting resolution...."
    
    # Get the display name.
    SCREEN=$(xrandr | awk '/ connected/{print $1; exit}')

    # Get the best resolution available.
    BEST_RESOLUTION=$(xrandr | grep -A 1 "^$SCREEN" | grep -oP '\d+x\d+' | sort -nr | head -n 1)

    if [ -n "$BEST_RESOLUTION" ]; then
        echo "Applying the best resolution: $BEST_RESOLUTION"
        xrandr --output "$SCREEN" --mode "$BEST_RESOLUTION"
    else
        echo "No resolution was detected applying the default one."
        xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
        xrandr --addmode "$SCREEN" 1920x1080_60.00
        xrandr --output "$SCREEN" --mode 1920x1080_60.00
    fi

    echo "Resolution adjusted correctly."

else
    echo "Normal system detected adjusting the best resolution"
    
    SCREEN=$(xrandr | awk '/ connected/ {print $1; exit}')
    BEST_RESOLUTION=$(xrandr | grep -A 1 "^$SCREEN" | grep -oP '\d+x\d+' | sort -nr | head -n 1)

    if [ -n "$BEST_RESOLUTION" ]; then
        xrandr --output "$SCREEN" --mode "$BEST_RESOLUTION"
        echo "Resolución ajustada a $BEST_RESOLUTION."
    else
        echo "No suitable resolution was detected."
    fi
fi


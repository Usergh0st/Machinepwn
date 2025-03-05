#!/bin/bash

# 🖥️ Detectar si estamos en VirtualBox
if lspci | grep -qi virtualbox; then
    echo "📦 VirtualBox detectado, ajustando resolución automáticamente..."
    
    # Obtener el nombre de la pantalla (por lo general es VBOX0)
    SCREEN=$(xrandr | awk '/ connected/{print $1; exit}')

    # Obtener la mejor resolución disponible
    BEST_RESOLUTION=$(xrandr | grep -A 1 "^$SCREEN" | grep -oP '\d+x\d+' | sort -nr | head -n 1)

    if [ -n "$BEST_RESOLUTION" ]; then
        echo "🛠️ Aplicando mejor resolución disponible: $BEST_RESOLUTION"
        xrandr --output "$SCREEN" --mode "$BEST_RESOLUTION"
    else
        echo "⚠️ No se detectó una resolución adecuada, agregando 1920x1080 manualmente..."
        
        # Agregar 1920x1080 si no está disponible
        xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
        xrandr --addmode "$SCREEN" 1920x1080_60.00
        xrandr --output "$SCREEN" --mode 1920x1080_60.00
    fi

    echo "✅ Resolución ajustada correctamente en VirtualBox."

else
    echo "🖥️ Sistema normal detectado, ajustando a la mejor resolución..."
    
    SCREEN=$(xrandr | awk '/ connected/ {print $1; exit}')
    BEST_RESOLUTION=$(xrandr | grep -A 1 "^$SCREEN" | grep -oP '\d+x\d+' | sort -nr | head -n 1)

    if [ -n "$BEST_RESOLUTION" ]; then
        xrandr --output "$SCREEN" --mode "$BEST_RESOLUTION"
        echo "✅ Resolución ajustada a $BEST_RESOLUTION."
    else
        echo "⚠️ No se detectó una resolución adecuada. No se realizó ningún cambio."
    fi
fi


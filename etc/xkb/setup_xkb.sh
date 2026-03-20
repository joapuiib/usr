#!/bin/bash
SCRIPT_PATH=$(dirname "$0")

sudo cp $SCRIPT_PATH/gb /usr/share/X11/xkb/symbols/gb

if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us')]"
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'gb+extd')]"
else
    setxkbmap gb extd
fi

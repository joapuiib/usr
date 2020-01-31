#!/bin/bash

if [ $UID -ne 0 ] ; then
    echo This script needs super privileges.
    exit 1
fi
rm /usr/share/X11/xkb/symbols/gb
ln ~/etc/xkb/gb /usr/share/X11/xkb/symbols/gb
setxkbmap gb extd

#!/bin/bash
SCRIPT_PATH=$(dirname "$0")

if [ $UID -ne 0 ] ; then
    echo This script needs super privileges.
    exit 1
fi
cp $SCRIPT_PATH/gb /usr/share/X11/xkb/symbols/gb
setxkbmap gb extd

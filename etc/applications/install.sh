#!/bin/bash

if [ ! -d $HOME/.local/share/applications/ ]; then
    mkdir -p $HOME/.local/share/applications/
fi

cp -v -r $HOME/usr/etc/applications/*.desktop $HOME/.local/share/applications/

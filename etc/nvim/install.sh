#!/bin/bash
CONFIG_FOLDER="$HOME/.config/nvim/"

# Check if config folder exists
if [ ! -d $CONFIG_FOLDER ] ; then
    mkdir -p $CONFIG_FOLDER
fi

cp init.vim $CONFIG_FOLDER/
cp -r rplugin/ $CONFIG_FOLDER/
cp -r plugin/ $CONFIG_FOLDER/
cp -r after/ $CONFIG_FOLDER/
cp -r snippets/ $CONFIG_FOLDER/
cp -r ftplugin/ $CONFIG_FOLDER/

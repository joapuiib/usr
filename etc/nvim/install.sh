#!/bin/bash
CONFIG_FOLDER="$HOME/.config/nvim/"

# Check if config folder exists
if [ ! -d $CONFIG_FOLDER ] ; then
    mkdir -p $CONFIG_FOLDER
fi

cp init.vim $CONFIG_FOLDER/
cp -r rplugin/ $CONFIG_FOLDER/
cp -r config/ $CONFIG_FOLDER/

# Install nvim plugin manager
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ] ; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
vim -e -c PlugInstall -c q -c q

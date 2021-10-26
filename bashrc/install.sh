#!/bin/bash

USR_BASHRC=`pwd`/bashrc
if ! grep -q "^source .*usr/bashrc/bashrc$" ~/.bashrc ; then
    echo "source $USR_BASHRC" | tee -a ~/.bashrc
fi

USR_GITCONFIG=`pwd`/gitconfig
git config --global include.path $USR_GITCONFIG

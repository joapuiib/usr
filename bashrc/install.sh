#!/bin/bash

USR_BASHRC=`pwd`/bashrc
if ! grep -q "^source .*usr/bashrc/bashrc$" ~/.bashrc ; then
    echo "source $USR_BASHRC" | tee -a ~/.bashrc
fi

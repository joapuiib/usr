#!/bin/bash

# title             : augment_path.sh
# description       : This scrips adds any folder named 'bin' from your $PWD to your $HOME to $PATH
# author            : joapuiib
# date              : 31/01/2020
# version           : 1.0    
# usage             : source augment_path
# notes             : This script uses a $PATH_DEFAULT variable, that should store the default $PATH variable.
#                     This variable should be initialized in .bashrc as: export PATH_DEFAULT="$PATH"
# ==============================================================================

augment_path() {
    target="bin"
    PATH_ADDITION=""
    scandir="$PWD"

    if [[ $scandir == *"$HOME"* ]]; then
        until [ "$scandir" = $HOME ]; do
            resolved_target="$scandir"/"$target"
            if [ -d "$resolved_target" ]; then
                PATH_ADDITION="$PATH_ADDITION:$resolved_target"
            fi
            scandir="${scandir%/*}"
        done 
        PATH="$PATH_ADDITION:$PATH_DEFAULT"
        #echo $PATH_ADDITION
    	#echo $PATH
    fi
}

augment_path

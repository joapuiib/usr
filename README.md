# ~/usr
This is my Linux setup, configuration and custom scripts. I'm currently using Linux Mint 19 "Tara"

## ~/usr/bashrc/
All bash customizations are in this folder, instead of ~/.bashrc
In order to be effective, the main file has to be sourced first.

In __~/.bashrc__
```bash
# Source custom .bashrc
if [ -f $HOME/usr/bashrc/bashrc ]; then
    source $HOME/usr/bashrc/bashrc
fi

```
### ~/usr/bashrc/bashrc
Main bashrc file. Similar to ~/.bashrc
### ~/usr/bashrc/complete_alias
Autocompletion for aliases (https://github.com/cykerway/complete-alias/)
### ~/usr/bashrc/aliases
Custom aliases
### ~/usr/bashrc/dockerrc
Custom docker aliases (based on https://github.com/tcnksm/docker-alias)

## ~/usr/bin
My bash scripts

## ~/usr/etc
Custom configuration

### ~/usr/etc/aucc
Some files for aucc configuration (https://github.com/rodgomesc/avell-unofficial-control-center) 
### ~/usr/etc/bash\_completion
Provides auto-completion for my scripts
### ~/usr/etc/xkb
Custom extended GB keyboard layout
### ~/usr/etc/nvim
My NeoVim setup

---
Feel free to use them. (DISCLAIMER: Use at your own risk)

Any fix or suggestion is welcome. :smile:

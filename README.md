# ~/usr
This is my Linux setup, configuration and custom scripts. I'm currently using Linux Mint 19 "Tara"

## ~/usr/.bashrc
Customizations are made in this file, instead of ~/.bashrc
In order to be effective, they need to be sourced first:

In __~/.bashrc__
```bash
# Source custom .bashrc
if [ -f $HOME/usr/.bashrc ]; then
    source $HOME/usr/.bashrc
fi

```

## ~/usr/bin
My bash scripts


## ~/usr/etc
Custom configuration

#### ~/usr/etc/aucc
Some files for aucc configuration (https://github.com/rodgomesc/avell-unofficial-control-center) 
#### ~/usr/etc/bash\_completion
Provides auto-completion for my scripts
#### ~/usr/etc/xkb
Custom extended GB keyboard layout
#### ~/usr/etc/nvim
My NeoVim setup

---
Feel free to use them. (DISCLAIMER: Use at your own risk)

Any fix or suggestion is welcome. :smile:

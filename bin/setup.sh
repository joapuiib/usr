# List of steps in order to configure my setup
# This should become a setup script

# sudo apt install nvidia-drivers-460
# sudo apt install git

# apt install openssh-server
# apt install alltray
# apt install chromium-browser chromium-codecs-ffmpeg-extra

## https://www.spotify.com/es/download/linux/
## Key valid as 08/12/2021
# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# sudo apt-get update && sudo apt-get install spotify-client

# apt install python3-pip
# pip3 install setuptools
# pip3 install wheel

## Use unstable for neovim 0.5
# sudo add-apt-repository ppa:neovim-ppa/unstable
## sudo add-apt-repository ppa:neovim-ppa/stable

# apt install neovim
# pip3 install pynvim
# pip3 install jedi
# sudo rm /usr/bin/vi
# ln -s `which nvim` /usr/bin/vi
# :UpdateRemotePlugins
# apt install xclip

## Nerd fonts
# git clone https://github.com/ryanoasis/nerd-fonts ~/opt/nerd-fonts
# ~/opt/nerd-fonts/install.sh

# ln ~/etc/xkb/gb /usr/share/X11/symbols/
# setxkbmap gb extd

# Install blueman bluetooth manager
# apt install blueman
# apt remove blueberry

## IntelliJ
## https://github.com/JonasGroeger/jetbrains-ppa
# curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
# echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null
# sudo apt-get update

## Virtualbox
## https://www.virtualbox.org/wiki/Linux_Downloads
# echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

## tensorflow + cuda
## https://gist.github.com/kmhofmann/cee7c0053da8cc09d62d74a6a4c1c5e4
## fix libcusolver.10
# apt install libcusolver10

## Docker
# echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt update
# sudo apt install docker-ce docker-ce-cli containerd.io pigz
# sudo usermod -aG docker $USER
# sudo cp $HOME/usr/docker/daemon.json /etc/docker/daemon.json

## Install ruby with rbenv
# git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
## (already in usr/bashrc/bashrc) echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# mkdir -p "$(rbenv root)"/plugins
# git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

## Install yarn
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

## SQLite
# sudo apt-get install sqlite3 libsqlite3-dev

# AUCC
# cd ~/prog/python/aucc
# git pull
# python3 setup.py build
# python3 setup.py install
# cd

# Musescore
# wget -O - https://download.opensuse.org/repositories/home:/mirabile:/mscore/bionic-neon/Release.key | sudo apt-key add -
# echo deb https://download.opensuse.org/repositories/home:/mirabile:/mscore/bionic-neon ./ | sudo tee /etc/apt/sources.list.d/mscore.list
# apt install musescore-general-soundfont
# sudo apt install musescore3

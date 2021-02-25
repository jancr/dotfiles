#!/usr/bin/env bash

# asumes debian/ubuntu

# dependencies
sudo apt update

# development

sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
						libreadline-dev libsqlite3-dev wget llvm libncurses5-dev \
						libncursesw5-dev libffi-dev liblzma-dev python-openssl git \
						sqlite libreadline6-dev bzip2 cmake udo libpcre3 libpcre3-dev \

# python 3
sudo apt -y install python3-dev python3-pip jupyter-core

# java script
sudo apt -y install jq nodejs npm

#other
sudo apt -y install git curl tmux nodejs cmake fonts-powerline \
						neovim vim zsh xclip npm

# dependencies for iperl
sudo apt -y install libzmq3-dev libmagic-dev
sudo apt -y install libapp-repl-perl


# Graphical stuff
#sudo apt-get -y install guake
#sudo apt install gnome-session
#sudo update-alternatives --config gdm3.css


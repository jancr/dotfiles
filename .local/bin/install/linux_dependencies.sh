#!/usr/bin/env bash

# asumes debian/ubuntu

# dependencies
sudo apt-get update

# development
sudo apt-get -y install build-essential libssl-dev libffi-dev 

# python 2
sudo apt-get -y install python-dev python-pip

# python 3
sudo apt-get -y install python3-dev python3-pip jupyter-core

# java script
sudo apt-get -y install jq nodejs npm

#other
sudo apt-get -y install git curl tmux nodejs cmake fonts-powerline neovim vim zsh

# dependencies for iperl
sudo apt-get install libzmq3-dev libmagic-dev
sudo apt install libapp-repl-perl


# Graphical stuff
#sudo apt-get -y install guake
#sudo apt install gnome-session
#sudo update-alternatives --config gdm3.css

#!/usr/bin/env bash

# asumes debian/ubuntu

# dependencies
sudo apt-get update

# python 2
sudo apt-get -y install python-ipython python-pip ipython-notebook

# python 3
sudo apt-get -y install python3-ipython python3-pip ipython-notebook

# java script
sudo apt-get -y install jq nodejs npm

#other
sudo apt-get -y install git curl tmux nodejs cmake fonts-powerline neovim vim 

# dependencies for iperl
sudo apt-get install libzmq3-dev libmagic-dev
sudo apt install libapp-repl-perl


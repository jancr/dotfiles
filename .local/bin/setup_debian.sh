#!/usr/bin/env bash

################################################################################
# core packages
################################################################################



################################################################################
# 3rd party
################################################################################
# visual studio code
## key and sources
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# install
sudo apt-get update
sudo apt-get install code

# Jan's dotfiles


## Dependencies:
In theory all you should need to install is yadm, then the bin/dotfiles.sh should take care of the rest.

### 1. Install yadm - Yet Another Dotfiles Manager 
# Ubuntu / Debian
`
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:flexiondotorg/yadm
sudo apt-get update
sudo apt-get -y install yadm
`
# OSX
`brew install yadm`

### 2. Install the rest
`
yadm clone --hard https://github.com/jancr/dotfiles
bash ~/bin/dotfiles.sh
`



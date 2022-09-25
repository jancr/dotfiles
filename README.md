# Jan's dotfiles


## Dependencies:
In theory all you should need to install is yadm, then the bin/dotfiles.sh
should take care of the rest.

### 1. Install yadm - Yet Another Dotfiles Manager 
#### Ubuntu / Debian
```
sudo apt-get update
sudo apt-get -y install yadm
```
#### OSX
`brew install yadm`

### 2. Install the rest
```
yadm clone --hard git+ssh://git@github.com/jancr/dotfiles.git
yadm decrypt

# this almost always fails, at the scripts it runs and run them induvidually
bash ~/bin/dotfiles.sh
```



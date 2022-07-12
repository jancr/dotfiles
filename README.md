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
yadm clone --hard git+ssh://git@github.com/username/reponame.git
bash ~/bin/dotfiles.sh
```



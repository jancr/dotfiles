
touch $HOME/.config/zsh/extra.zsh
########################################
# antigen (zsh extension manager)
########################################
curl -L git.io/antigen > $HOME/.local/bin/antigen.zsh


#cd $HOME/.local
#git clone git://github.com/wting/autojump.git
#cd autojump
#./install.py


# Install oh-my-posh
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install autojump

# if no admin do this instead
# wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O$HOME/.local/bin/oh-my-posh 
# chmod +x $HOME/.local/bin/oh-my-posh

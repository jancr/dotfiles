
touch $HOME/.config/zsh/extra.zsh
########################################
# antigen (zsh extension manager)
########################################
curl -L git.io/antigen > $HOME/.local/bin/antigen.zsh


cd $HOME/.local
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

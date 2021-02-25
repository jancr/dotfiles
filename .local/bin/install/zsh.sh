
touch $HOME/.config/zsh/extra.zsh
########################################
# antigen (zsh extension manager)
########################################
curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > $HOME/.local/bin/antigen.zsh


cd $HOME/.local
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

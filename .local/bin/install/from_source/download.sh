
mkdir src
cd src

# tmux and depencencies
# wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
git clone git://github.com/libevent/libevent.git -b libevent-2.1.12-stable.tar.gz
wget https://invisible-mirror.net/archives/ncurses/ncurses-6.2.tar.gz
git clone https://github.com/tmux/tmux.git -b 3.1

# neovim
wget https://github.com/Kitware/CMake/releases/download/v3.18.3/cmake-3.18.3-Linux-x86_64.tar.gz
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
cd ..


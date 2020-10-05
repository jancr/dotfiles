
cd src
################################################################################
# install tmux and dependencies
################################################################################
# ncurses
tar xvzf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --prefix=$HOME/.local
make -j8
make install
cd ..

# libevent
cd libevent
./autogen.sh
./configure --prefix=$HOME/.local
make -j8
make install
cd ..

# tmux
cd tmux
sh autogen.sh
./configure --prefix=$HOME/.local CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncurses" \
        LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/include/ncurses -L$HOME/.local/lib"
make -j8
make install


################################################################################
# neovim
################################################################################
# cmake
tar xvzf cmake-3.18.3-Linux-x86_64.tar.gz
cd cmake-3.18.3-Linux-x86_64
./bootstrap
make
make install
cd ..

# neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
make install
# export PATH="$HOME/.local/neovim/bin:$PATH"

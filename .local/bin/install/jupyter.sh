my_dir=`pwd`
########################################
# jupyter (ipython and iperl)
########################################
pip3 install jupyter

pip3 install jupyter_contrib_nbextensions
pip3 install install jupyterthemes

# install vim bindings
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding

# fix vimbindings to work with dark color scheme
cd vim_binding
ln -s $HOME/.config/ln/jupyter_vim_binding.css vim_binding.css
cd $my_dir

# enable dark theme # and 100 cell width
jupyter nbextension enable vim_binding/vim_binding
jt -t onedork -f roboto -fs 12 -cellw 90%


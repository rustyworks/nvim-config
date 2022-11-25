#!/bin/bash --login

CURRENT_PATH=`pwd`

rm -rf ~/.nvim ~/.nvimrc ~/.config/nvim/

cd ~
ln -sf $CURRENT_PATH/.nvimrc .nvimrc
ln -sf $CURRENT_PATH/.nvim .nvim

mkdir ~/.config
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim

echo 'set runtimepath^=~/.nvim' >> ~/.config/nvim/init.vim
echo 'let &packpath=&runtimepath' >> ~/.config/nvim/init.vim
echo 'source ~/.nvimrc' >> ~/.config/nvim/init.vim

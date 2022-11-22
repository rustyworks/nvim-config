CURRENT_PATH=`pwd`

rm -rf ~/.nvim ~/.nvimrc ~/.config/nvim/

cd ~
ln -sf $CURRENT_PATH/.nvimrc .nvimrc
ln -sf $CURRENT_PATH/.nvim .nvim

mkdir ~/.config/nvim

echo 'set runtimepath^=~/.nvim' >> ~/.config/nvim/init.vim
echo 'let &packpath=&runtimepath' >> ~/.config/nvim/init.vim
echo 'source ~/.nvimrc' >> ~/.config/nvim/init.vim

# git clone 'https://github.com/VundleVim/Vundle.vim' $CURRENT_PATH/.vim/bundle/Vundle.vim

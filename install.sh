git clone https://github.com/nirwandogra/vim_settings.git
sudo apt-get install vim-gnome
mv ~/.vimrc ~/.vimrc.old
mv -R ~/.vim ~/.vim.old
ln -s ~/vim_settings/.vimrc ~/.vimrc
ln -s ~/vim_settings/.vim ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

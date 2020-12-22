#!/bin/bash

set -e
cd ~/
read -r -p "Use bashrc? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
 ln -s backup_bash/.bashrc
 ;;
    [nN][oO]|[nN])
 ln -s backup_bash/.zshrc
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac
ln -s backup_bash/.vimrc
ln -s backup_bash/.gitconfig
ln -s backup_bash/.gitignore
ln -s backup_bash/.tmux.conf

echo 'source ~/.bashrc' > .bash_profile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir tmp

bash

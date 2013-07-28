#!/bin/bash
################################
# . install.sh
# This script creates symlinks to dotfiles
################################

dir=~/.dotfiles
files="gitconfig gtkrc zshrc vimrc gvimrc"

cd $dir

for file in $files; do
  ln -s $dir/$file ~/.$file
done

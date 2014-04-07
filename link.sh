#!/bin/bash

# Set dotfiles list
DOT_DIR=~/dotfiles
Dotfiles=('gitconfig' 'gvimrc' 'vimrc' 'zshrc');

# Check for old dotfiles dir
OLD_DIR=~/.old_dotfiles
if [ ! -d "$OLD_DIR"  ]; then
  mkdir $OLD_DIR
  echo "Create old dotfiles directory : " $OLD_DIR
fi

# Clean old dotfiles
rm -rf $OLD_DIR/*
echo "Cleaning old dotfiles..."
cd $DOT_DIR

# Check all dotfiles
for file in "${Dotfiles[@]}"
do
  origin="$PWD/$file"
  target="$HOME/.$file"

  # Move file to old if target exists
  if [ -f $target ]; then
    mv $target $OLD_DIR
  fi

  # Link file
  ln -s $origin $target
  if [ $? -eq 0  ]; then
    echo "Sucessfully linked : $target"
  else
    echo "Linking failed: $origin"
  fi
done

exit 0

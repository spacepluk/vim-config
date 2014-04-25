#!/bin/sh
# Standalone installer for Unixs
# Original version is created by shoma2da
# https://github.com/shoma2da/neobundle_installer

# Installation directory
BUNDLE_DIR=~/.vim/bundle

# check git command
if [ `which git` ]; then
  : # You have git command. No Problem.
else
  echo 'Please install git command!'
  exit 1
fi

if [ -e ~/.vim ] || [ -e ~/.vimrc ]; then
  echo "ABORT!  Vim configuration files found."
  exit 1
fi

echo "Installing vim-config"
git clone https://github.com/spacepluk/vim-config ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

# make bundle dir and fetch neobundle
echo "Installing NeoBundle..."
mkdir -p $BUNDLE_DIR
git clone https://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim

echo "Done."


#!/bin/bash

# Detect the OS:
case $OSTYPE in
  solaris*) OS=SOLARIS;;
  darwin*)  OS=OSX;; 
  linux*)   OS=LINUX;; 
  bsd*)     OS=BSD;; 
  *)        OS="Unknown: $OSTYPE";; 
esac
# Source: http://f00bar.com/

# Install software
if [[ $OS == "LINUX" ]]; then
  sudo apt-get install tmux vim ack curl xsel gnome-tweak-tool vim-gui-common
  # * gnome-tweak-tool - currently, you must install gnome-tweak-tool to remap ctrl with caps lock
  # * vim-gui-common - This is needed so that `set clipboard=unnamedplus` will use system clipboard
elif [[ $OS == "OSX" ]]; then
  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux reattach-to-user-namespace vim
fi

# Link files
sh link_files

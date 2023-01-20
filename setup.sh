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
  # vim-gui-common is needed so that `set clipboard=unnamedplus` will use system clipboard
  sudo apt-get install tmux vim ack curl xsel gnome-tweaks vim-gui-common
  # Use gnome-tweaks to remap ctrl with caps lock: Keyboard & mouse > Additional Layout Options button > Caps Lock behavior chevron
  # Firefox Plugins: Lastpass, momentum dash, ublock origin, vimium?
elif [[ $OS == "OSX" ]]; then
  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux reattach-to-user-namespace vim
fi

# Link files
sh link_files

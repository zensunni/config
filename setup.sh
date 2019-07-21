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
  sudo apt-get install tmux vim ack terminator curl xsel
  # Remap home key (currently, you must install  gnome-tweak-tool to do this in gui).
  # `sudo apt-get install gnome-tweak-tool`
elif [[ $OS == "OSX" ]]; then
  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install tmux reattach-to-user-namespace vim
fi

# Link files
sh link_files

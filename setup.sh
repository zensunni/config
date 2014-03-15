#!/bin/bash

# Detect the OS:
case "$OSTYPE" in
  solaris*) echo "Detected: SOLARIS"
    OS=SOLARIS;;
  darwin*)  echo "Detected: OSX"
    OS=OSX;; 
  linux*)   echo "Detected: LINUX"
    OS=LINUX;; 
  bsd*)     echo "Detected: BSD"
    OS=BSD;; 
  *)        echo "Unknown: $OSTYPE"
    OS="Unknown: $OSTYPE";; 
esac
# Source: http://f00bar.com/

# Install software
if [[ OS == "LINUX" ]]; then
  sh get_software
fi

# Link files
#sh link_files

# Get vim plugins
#sh get_vim_plugins


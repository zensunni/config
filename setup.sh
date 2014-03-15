#!/bin/bash

# Install software
#sh get_software

#FILES=~/.config/.??*
FILES=~/config/.??*
for f in $FILES
do
  echo "Processing $f file..."
  ln -s $f ../
  # take action on each file. $f store current file name
done

# Get vim plugins
sh get_vim_plugins


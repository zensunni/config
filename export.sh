#!/bin/bash
FILES=~/.config/.??*
for f in $FILES
do
  echo "Processing $f file..."
  ln -s $f ../
  # take action on each file. $f store current file name
  #cat $f
done



#FILES=~/.config/*
#for f in $FILES
#do
#  echo "Processing $f file..."
#  # take action on each file. $f store current file name
#  #cat $f
#done


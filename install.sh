#!/usr/bin/env bash

# Colors
COL_BLUE="\x1b[34;01m"
COL_RESET="\x1b[39;49;00m"
COL_RED="\x1b[31;01m"

# Helper function
_print() {
  printf $COL_BLUE"\n$1\n"$COL_RESET
}

# Vundle
_print "Installing Vundle"
if [ -d "./bundle/vundle" ] ; then
	_print "Vundle is already installed"
else
  git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi



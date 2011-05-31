Proximity goes commandline
==========================

Our main vim settings, with bundles (managed through [vim-pathogen](https://github.com/tpope/vim-pathogen)) and an **update_bundles** script to keep everything up te date.

Installation
------------
`git clone git@github.com:proximitybbdo/vim.git ~/.vim`  
`ln -s ~/.vim/vimrc ~/.vimrc`  
`ln -s ~/.vim/gvimrc ~/.gvimrc`  

For your local settings, copy the *default.vimrc* file to vimrc.local, and add a symlink:
`cd ~/.vim`  
`mv default.vimrc vimrc.local`  
`ln -s ~/.vim/vimrc.local ~/.vimrc.local`  

For your local settings, copy the *default.gvimrc* file to gvimrc.local, and add a symlink:
`cd ~/.vim`  
`mv default.gvimrc gvimrc.local`  
`ln -s ~/.vim/gvimrc.local ~/.gvimrc.local`  

Vundle
-----
Vundle allows you to install bundles.
You can run it by calling ':BundleInstall' from within vim.

If you have troubles executing the command, you probably need to fetch vundle first:
`git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git`

The plugins and bundles
=======================

vim-tcomment
------------
Normal mode
`gcc` toggle comment for current line
Visual mode
`gc<CR>`

FuzzyFinder
-----------
special mapping <c-s> to search with wildcart

Proximity goes commandline
==========================

Our main vim settings, using Vundle to manage various plugins

Installation
------------
`git clone git@github.com:proximitybbdo/vim.git ~/.vim`  
`./install.sh`  
`ln -s ~/.vim/gvimrc ~/.gvimrc`  

For your local settings, just create a *vimrc.local* file 

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
special mapping @ to search with wildcart

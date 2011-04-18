Proximity goes commandline
==========================

Our main vim settings, with bundles (managed through [vim-pathogen](https://github.com/tpope/vim-pathogen)) and an update_bundles script to keep everything up te date.

Installation
------------
  git clone git@github.com:proximitybbdo/vim.git ~/.vim
  ln -s ~/.vim/.vimrc ~/.vimrc
  ln -s ~/.vim/.gvimrc ~/.gvimrc

For your local settings, copy the *default.vimrc.local* file to .vimrc.local, and add a symlink:
`cd ~/.vim`
`mv default.vimrc.local .vimrc.local`
`ln -s ~/.vim/.vimrc.local ~/.vimrc.local`
l
Extra
-----
The *update_bundles* is a ruby script that can be run through:
`ruby update_bundles`

Or you can make it executable:
`chmod +x update_bundles`

and run it like so:
`./update_bundles`

Our main vim settings, using Vundle to manage various plugins

Installation
------------
`git clone git@github.com:jackjoe/vim.git ~/.vim # if you have access to the repository`
`git clone git://github.com/jackjoe/vim.git ~/.vim # for public use`

`./install`
`ln -s ~/.vim/gvimrc ~/.gvimrc`

For your local settings, just create a *vimrc.local* file

Vundle
-----
Vundle allows you to install bundles.
You can run it by calling ':BundleInstall' from within vim.

If you have troubles executing the command, you probably need to fetch vundle first:
`git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git`

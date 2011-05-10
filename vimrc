" ---------------------------------------------------------------------------
" |                                                                         |
" |                         Proximity goes Vim!                             |
" |                                                                         |
" |   Highlights:                                                           |
" |     jj = <esc> Very useful to keep your hands on the home row           |
" |                                                                         |
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" |                               General                                   |
" ---------------------------------------------------------------------------

" Disable arrow keys *******************************************************

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Pathogen *****************************************************************
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" General editor ************************************************************
syntax on         " Enable syntax highlighting

set number        " Line number
set hidden

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmatch     " Show matching bracets when text indicator is over them
set autoread      " Set to auto read when a file is changed from the outside

set pastetoggle=<F2>  " If you press F2 all smart tabbing will be removed;
                      " needed for pasting

"Invisible character colors
highlight NonText guifg=#7A7A90
highlight SpecialKey guifg=#7A7A90

set history=1000      " keep 1000 lines of command line history
set undolevels=200    " Undo history
set ttyfast           " Yes, we have a fast terminal


" Color + font **************************************************************
syntax enable 				" Enable syntax hl

colorscheme default

"set t_Co=256
set encoding=utf8

set gfn=Monaco:h11

set ffs=unix,mac,dos	" Support all three, in this order
set shell=/bin/bash

" File type specific ********************************************************
filetype indent on
filetype plugin on

" Specific color coding for some file extensions
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.inc set filetype=php

" Search improvements *******************************************************
set hlsearch                " Highlight search things
set incsearch               " Make search act like search in modern browsers
set ignorecase              " Case insensitive matching.
set smartcase               " Ignore case when searching lowercase

" Text settings / tabbing / indenting ***************************************
set softtabstop=2 " Use a 2 space soft tab
set shiftwidth=2
set tabstop=2
set expandtab

set lbr
set tw=500
set ai                      " Auto indent
set si                      " Smart indent
set copyindent              " Take indentation from previous line

set wrap                    " set linewrap

" Files/backup **************************************************************
set nobackup                " do not keep a backup file, use versions instead
set nowb
set noswapfile

" Status bar ****************************************************************
set laststatus=2						" Always hide the statusline

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Source after saving *******************************************************
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" ---------------------------------------------------------------------------
" |                       Keyboard mapping                                   |
" ---------------------------------------------------------------------------

" Vim recommended ***********************************************************
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc'
let mapleader = ","

" NERDTree ******************************************************************
nmap <silent> <c-n> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" Zencoding ***************************************************************** 
imap <c-e> <c-y>,

" FuzzyFinder  ***************************************************************
nmap <c-s> :FufFile **/<CR>

" ---------------------------------------------------------------------------
" |                           Host specific                                 |
" |               Don't forget to symlink .vimrc.local !                    |
" ---------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"  


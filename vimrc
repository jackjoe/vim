" ---------------------------------------------------------------------------
" |                                                                         |
" |                         Proximity goes Vim!                             |
" |                                                                         |
" |   Highlights:                                                           |
" |     jj = <esc> Very useful to keep your hands on the home row           |
" |                                                                         |
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" |                               Vundle                                    |
" |                          Must be on top
" ---------------------------------------------------------------------------
filetype on   " first on, to avoid vim exiting with status code 1!
filetype off  " required!
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Original repos on github
Bundle 'mileszs/ack.vim.git'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-haml.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tsaleh/vim-align.git' 
Bundle 'tsaleh/vim-supertab.git'
Bundle 'tsaleh/vim-tcomment.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-scripts/FuzzyFinder.git'
Bundle 'itspriddle/vim-lesscss.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'ingydotnet/yaml-vim.git'
Bundle 'jeroenbourgois/vim-actionscript.git'
Bundle 'vim-scripts/matchit.zip.git'
Bundle 'scrooloose/nerdtree.git'
Bundle "honza/snipmate-snippets.git"
Bundle "msanders/snipmate.vim"
Bundle "kchmck/vim-coffee-script.git"

" vim-scripts repos
Bundle 'L9'

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

filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" General editor ************************************************************
syntax on         " Enable syntax highlighting

set number        " Line number
set hidden

set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set showmatch         " Show matching bracets when text indicator is over them
set autoread          " Set to auto read when a file is changed from the outside
set clipboard=unnamed " Yank everything to the system clipboard

" Invisible character colors
highlight NonText guifg=#7A7A90
highlight SpecialKey guifg=#7A7A90

set history=1000      " keep 1000 lines of command line history
set undolevels=200    " Undo history
set ttyfast           " Yes, we have a fast terminal
set noerrorbells      " Disable error bells.

" Color + font **************************************************************
syntax enable 				" Enable syntax hl

colorscheme default

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
au BufRead,BufNewFile *.ru set filetype=ruby

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

set list listchars=tab:»·,trail:·,eol:¬,nbsp:_

" Files/backup **************************************************************
set nobackup                " do not keep a backup file, use versions instead
set nowb
set noswapfile

" Status bar ****************************************************************
set laststatus=2						" Always hide the statusline

" Tell snipmate to pull it's snippets from a custom directory
let g:snippets_dir = $HOME.'/.vim/bundle/snipmate-snippets/snippets'

" Format the statusline *****************************************************
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/', "~/..", "g")
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
" |                 Custom functions and helpers                            |
" ---------------------------------------------------------------------------
function! FixNewLine()
  :%s/\
  /\r/
  :%s/\s\+$//
  :retab
  :let @/=''
endfunction
:command! FEOL :call FixNewLine()

" ---------------------------------------------------------------------------
" |                       Keyboard mapping                                   |
" ---------------------------------------------------------------------------

" Vim recommended ***********************************************************
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc'
let mapleader = ","

" Block movement
nmap <tab> %
vmap <tab> %

" Enable F2 key for toggling pastemode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" paste with paste mode and exit
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

" Show/hide hidden characters
nmap <leader>l :set list!<cr>

" Clear the search highlight
map <silent> \ :silent nohlsearch<cr>

" Mappings specific for html
:vmap <leader>b <S-S><strong>
:vmap <leader>i <S-S><em>

" NERDTree *******************************************************************
nmap <silent> <c-n> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Zencoding ****************************************************************** 
imap <c-e> <c-y>,

" FuzzyFinder  ***************************************************************
nmap <C-o> :FufFile **/<CR>

" Switch files  **************************************************************
nmap <c-h> <ESC>:bp<CR>
nmap <c-l> <ESC>:bn<CR>

" Commands for vim-rails *****************************************************
function! s:setRails()
  map <buffer> <leader>rc :Rcontroller
  map <buffer> <leader>vc :RVcontroller
  map <buffer> <leader>sc :RScontroller
  map <buffer> <leader>vf :RVfunctional
  map <buffer> <leader>sf :RSfunctional
  map <buffer> <leader>m :Rmodel
  map <buffer> <leader>vm :RVmodel
  map <buffer> <leader>sm :RSmodel
  map <buffer> <leader>u :Runittest
  map <buffer> <leader>vu :RVunittest
  map <buffer> <leader>su :RSunittest
  map <buffer> <leader>vv :RVview
  map <buffer> <leader>sv :RSview
  map <buffer> <leader>A  :A<cr>
  map <buffer> <leader>av :AV<cr>
  map <buffer> <leader>as :AS<cr>
  map <buffer> <leader>aa :R<cr>
endfunction

" ---------------------------------------------------------------------------
" |                           Host specific                                 |
" ---------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


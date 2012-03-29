" ---------------------------------------------------------------------------
" |                                                                         |
" |                         Proximity goes Vim!                             |
" |                                                                         |
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" |                               Vundle                                    |
" |                          Must be on top
" ---------------------------------------------------------------------------
filetype on   " first on, to avoid vim exiting with status code 1!
filetype off  " required!

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Original repos on github
Bundle 'tpope/vim-haml.git'
Bundle 'jeroenbourgois/vim-actionscript.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'ingydotnet/yaml-vim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'mattn/zencoding-vim'
Bundle 'nvie/vim-pyflakes'
Bundle 'nvie/vim-pep8'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'ervandew/supertab.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'itspriddle/vim-lesscss.git'
Bundle 'vim-scripts/matchit.zip.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Townk/vim-autoclose'
Bundle 'wincent/Command-T'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'docunext/closetag.vim'

" Snipmate specific ~ start
" Install dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"

" Install snipmate:
Bundle "garbas/vim-snipmate"
" Snipmate specific ~ end

" vim-scripts repos
Bundle 'L9'
Bundle 'tComment'
Bundle 'Align'

" ---------------------------------------------------------------------------
" G E N E R A L
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

" ================ General Config ====================
"
set laststatus=2   " Always show the statusline

syntax on         " Enable syntax highlighting

set number        " Line number
set hidden

set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set showmatch                     " Show matching bracets when text indicator is over them
set autoread                      " Set to auto read when a file is changed from the outside
set clipboard=unnamed             " Yank everything to the system clipboard

" Invisible character colors

highlight NonText guifg=#7A7A90
highlight SpecialKey guifg=#7A7A90

set history=1000                  " keep 1000 lines of command line history
set undolevels=200                " Undo history
set ttyfast                       " Yes, we have a fast terminal
set noerrorbells                  " Disable error bells.

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*

" =============== Color + font ======================

syntax enable 				            " Enable syntax hl

colorscheme default

set encoding=utf8
set ffs=unix,mac,dos	            " Support all three, in this order
set shell=/bin/bash

" ---------------------------------------------------------------------------
"  F I L E  T Y P E S 
" ---------------------------------------------------------------------------
"
au BufRead,BufNewFile *.module    set filetype=php
au BufRead,BufNewFile *.inc       set filetype=php
au BufRead,BufNewFile *.install   set filetype=php
au BufRead,BufNewFile *.module    set filetype=php
au BufRead,BufNewFile *.ru        set filetype=ruby

" Search improvements *******************************************************
set hlsearch                      " Highlight search things
set incsearch                     " Make search act like search in modern browsers
set ignorecase                    " Case insensitive matching...
set smartcase                     " ... unless they contain at least one capital letter

" Text settings / tabbing / indenting ***************************************
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set wrap                          " set linewrap

set lbr
set tw=500
set ai                            " Auto indent
set si                            " Smart indent
set copyindent                    " Take indentation from previous line

" List chars
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set listchars=""                  " Reset the listchars
set listchars=tab:»·,trail:·,eol:¬,nbsp:_

" Files/backup **************************************************************
set nobackup                " do not keep a backup file, use versions instead
set nowb
set noswapfile

" Syntastic *****************************************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1    " show signs in bar
let g:syntastic_quiet_warnings=1  " warnings suck

let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': []}
nmap <F3> :SyntasticCheck<CR>     " do check

" Format the statusline *****************************************************
" set statusline+=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

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

let g:Powerline_symbols = 'fancy'

" Source after saving *******************************************************
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" ---------------------------------------------------------------------------
" Custom functions and helpers 
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
" Keyboard mapping
" ---------------------------------------------------------------------------

" Vim recommended ***********************************************************
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc'
let mapleader = ","

" Block movement
nmap <tab> %
vmap <tab> %

" Show/hide hidden characters
nmap <leader>l :set list!<cr>

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Clean whitespace
command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Clean whitespace
map <leader>W  :%s/s+$//<cr>:let @/=''<CR>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>

" Fuck you, help key, seriously
set fuoptions=maxvert,maxhorz
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>

" Command-T  *****************************************************************
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" Paste mode  ****************************************************************
" Enable F2 key for toggling pastemode
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" Coffeescript  **************************************************************
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" Mappings specific for html *************************************************
:vmap <leader>b <S-S><strong>
:vmap <leader>i <S-S><em>

" NERDTree *******************************************************************
nmap <silent> <c-n> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Zencoding ******************************************************************
imap <c-e> <c-y>,

" Switch files  **************************************************************
nmap <c-h> <ESC>:bp<CR>
nmap <c-l> <ESC>:bn<CR>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Rainbow Parentheses ********************************************************
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <leader>R :RainbowParenthesesToggle<CR>

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

" CSS and LessCSS {{{
au BufNewFile,BufRead *.less setlocal filetype=less
" }}}

" ---------------------------------------------------------------------------
" |                           Host specific                                 |
" ---------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


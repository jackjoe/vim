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
Bundle 'jeroenbourgois/vim-actionscript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ingydotnet/yaml-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/zencoding-vim'
Bundle 'nvie/vim-pyflakes'
Bundle 'nvie/vim-flake8'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'Lokaltog/powerline'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'docunext/closetag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tclem/vim-arduino'

Bundle 'vim-scripts/DBGPavim'

" Snipmate specific ~ start
" Install dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

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
syntax enable 		" Enable syntax hl

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
set nofoldenable        "dont fold by default

" ================ Completion =======================

set completeopt=menu,preview
set complete=.,b,u,]
set wildmode=longest,list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*

" =============== Color + font ======================

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
au BufRead,BufNewFile *.pde       set filetype=arduino
au BufRead,BufNewFile *.ino       set filetype=arduino

" Extra syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

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

" XDebug ********************************************************************
let g:dbgPavimPort = 9999

" Powerline *****************************************************************
let g:Powerline_symbols = 'fancy'
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline) "

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely and
" update the statusline. If you find this annoying, you can add the following
" snippet to your vimrc to escape insert mode immediately:
" if ! has('gui_running')
"   set ttimeoutlen=10
"   augroup FastEscape
"     autocmd!
"     au InsertEnter * set timeoutlen=0
"     au InsertLeave * set timeoutlen=1000
"   augroup END
" endif

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

" Show/hide hidden characters
nmap <leader>l :set list!<cr>

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Clean whitespace
command! KillWhitespace :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Clean windows weird characters
command! CleanWindowsShit :call CleanWindowsShit()<CR>

function! CleanWindowsShit()
  :%s///g
endf

" Clean whitespace
map <leader>W  :%s/s+$//<cr>:let @/=''<CR>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>

" Fuck you, help key, seriously
if has("gui_running")
  set fuoptions=maxvert,maxhorz
endif

noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>

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

set autochdir
let NERDTreeChDirMode=2

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
au BufNewFile,BufRead *.less set ft=css.less
" }}}

" ---------------------------------------------------------------------------
" |                           Host specific                                 |
" ---------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


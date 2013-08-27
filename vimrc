
" ============================================================================
" |                               Vundle                                    |
" |                          Must be on top
" ============================================================================

" filetype on   " first on, to avoid vim exiting with status code 1!
filetype off  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Original repos on github
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'ingydotnet/yaml-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Townk/vim-autoclose'
Bundle 'docunext/closetag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'EasyMotion'
Bundle "nono/vim-handlebars"
Bundle "SirVer/ultisnips"

" XDebug
Bundle 'vim-scripts/DBGPavim'

" vim-scripts repos
Bundle 'L9'
Bundle 'tComment'
Bundle 'Align'

" ============================================================================
" General
" ============================================================================

" map : to ; for qwerty
noremap ; :

" == Disable arrow keys ======================================================

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" == Bootstrap ================================================================

set encoding=utf8
set laststatus=2        " Always show the statusline
set nocompatible        " the future is now, use vim defaults instead of vi ones

syntax on               " Enable syntax highlighting
syntax enable 		      " Enable syntax hl

filetype on             " /!\ doesn't play well with compatible mode
filetype plugin on      " trigger file type specific plugins
filetype indent on      " indent based on file type syntax

set number              " Line number
set hidden

set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set cmdheight=1         " height of the command line
set showmatch           " Show matching bracets when text indicator is over them
set clipboard=unnamed   " Yank everything to the system clipboard

highlight NonText guifg=#7A7A90   " Invisible character colors
highlight SpecialKey guifg=#7A7A90

set history=1000        " keep 1000 lines of command line history
set undolevels=200      " Undo history
set ttyfast             " Yes, we have a fast terminal
set title               " change the terminal title
set lazyredraw          " do not redraw when executing macros
set report=0            " always report changes

" == Editing ==================================================================

set nowrap        " don't wrap lines
set nojoinspaces  " insert only one space after '.', '?', '!' when joining lines
set showmatch     " briefly jumps the cursor to the matching brace on insert
set matchtime=4   " blink matching braces for 0.4s
set backspace=indent,eol,start " allow backspacing over everything

set softtabstop=2
set shiftwidth=2  " indent with 2 spaces
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=2
set expandtab
set wrap                          " set linewrap

set lbr
set tw=500
set autoindent
set smartindent
set copyindent                    " Take indentation from previous line

" set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:»·,trail:·,eol:¬,nbsp:_

" reselect last selection after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <

" == Buffers ==================================================================

set autoread         " Set to auto read when a file is changed from the outside
set nobomb           " don't clutter files with Unicode BOMs
set hidden           " enable switching between buffers without saving
set switchbuf=usetab " switch to existing tab then window when switching buffer
set autoread         " auto read files changed only from the outside of ViM
set fsync            " sync after write
set confirm          " ask whether to save changed files

if has("autocmd")
  augroup trailing_spaces
    " autocmd!
    autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces before saving
  augroup END
  " augroup restore_cursor
  "   " restore cursor position to last position upon file reopen
  "   autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  " augroup END
endif

" == Folding ==================================================================

if has("folding")
  set foldenable
  set foldmethod=syntax   " fold based on indent
  set foldlevelstart=99   " start editing with all folds open
  set foldnestmax=3       " deepest fold is 3 levels
  set nofoldenable        " dont fold by default
endif

" == Completion ===============================================================

set completeopt=longest,menuone,preview " better completion
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest:full,list:longest
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=.git            " ignore the .git directory
set wildignore+=*.DS_Store      " ignore Mac finder/spotlight crap

if exists("&wildignorecase")
  set wildignorecase
endif

" == Color + font =============================================================

colorscheme default
set ffs=unix,mac,dos	  " Support all three, in this order

" == Git/SVN Errors ===========================================================

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" == Filetypes ================================================================

au BufRead,BufNewFile *.module    set filetype=php
au BufRead,BufNewFile *.inc       set filetype=php
au BufRead,BufNewFile *.install   set filetype=php
au BufRead,BufNewFile *.module    set filetype=php
au BufRead,BufNewFile *.ru        set filetype=ruby
au BufRead,BufNewFile *.less      set filetype=css

" Handlebars
au BufRead,BufNewFile *.handlebars,*.hbs set ft=handlebars

" Extra syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" == Search improvements ======================================================

set hlsearch                      " Highlight search things
set incsearch                     " Make search act like search in modern browsers
set ignorecase                    " Case insensitive matching...
set smartcase                     " ... unless they contain at least one capital letter

" == Files/backup =============================================================

set nobackup                " do not keep a backup file, use versions instead
set nowb
set noswapfile

" == Visualbell ===============================================================

set visualbell    " shut up
set noerrorbells  " shut up
set mousehide     " hide mouse pointer when typing

" == Syntastic ================================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1    " show signs in bar
let g:syntastic_quiet_warnings=1  " warnings suck

let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': []}
nmap <F3> :SyntasticCheck<CR>     " do check

" == Statusline ===============================================================

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

" == XDebug ===================================================================

let g:dbgPavimPort = 9999

" == Source after saving ======================================================

if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" == Keyboard mapping =========================================================

" Professor VIM says '87% of users prefer jj over esc'
imap jj <Esc>
let mapleader = ","

" Show/hide hidden characters
nmap <leader>l :set list!<cr>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Clean whitespace
command! KillWhitespace :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <silent> <leader>W :call <SID>StripTrailingWhitespaces()<CR>

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

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>

if has("gui_running") " Fuck you, help key, seriously
  set fuoptions=maxvert,maxhorz
endif

noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>

" switch between last two files
nnoremap <leader><Tab> <c-^>

" move to the position where the last change was made
noremap gI `.

" split line and preserve cursor position
nnoremap S mzi<CR><ESC>`z

" == Paste mode ===============================================================

nnoremap <F2> :set invpaste paste?<CR> " Enable F2 key for toggling pastemode
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" == Coffeescript =============================================================

" vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
" map <leader>c :CoffeeCompile<CR>

" == HTML =====================================================================

:vmap <leader>b <S-S><strong>
:vmap <leader>i <S-S><em>

" == Ultisnips ================================================================

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" == Nerdtree =================================================================

nmap <silent> <c-n> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" set autochdir
let NERDTreeChDirMode = 1
let NERDChristmasTree = 1

" == Supertab =================================================================

" let g:SuperTabDefaultCompletionType = 'context'

" == CtrlP ====================================================================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store

let g:ctrlp_custom_ignore = '\.(git|hg|svn)$\|\.(o|swp|pyc|wav|mp3|ogg|blend)$|node_modules\|DS_Store\|git'

map <leader>cp :CtrlPClearCache<CR>

" == Emmet (previously Zencoding ===============================================

" imap <c-e> <c-y>,
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<c-e>'

" == Switch files =============================================================

nmap <c-h> <ESC>:bp<CR>
nmap <c-l> <ESC>:bn<CR>

" == EasyMotion ===============================================================

let g:EasyMotion_leader_key = '<Leader>'

" == Split windows ============================================================

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" switch between windows by hitting <Tab> twice
nmap <silent> <Tab><Tab> <C-w>w

map + 3<c-w>>
map - 3<c-w><

" == User defined ============================================================

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

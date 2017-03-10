" Jack + Joe do vim, since 2012
"
" Last major rework updated reflecting
" http://dougblack.io/words/a-good-vimrc.html

" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

let base16colorspace=256  " Access colors present in 256 colorspace

" Vundle must be first
" Vundle {{{
filetype on   " first on, to avoid vim exiting with status code 1!
filetype off  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" We might implement https://github.com/junegunn/vim-plug/
" }}}

" Plugins {{{
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'docunext/closetag.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'esneider/YUNOcommit.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rstacruz/vim-ultisnips-css'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'slashmili/alchemist.vim'
Plugin 'majutsushi/tagbar'

Plugin 'bling/vim-airline'

" Needed for airline
Plugin 'tpope/vim-fugitive'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'

" Haskell
" Install stylish-haskell via cabal
" Plugin 'nbouscal/vim-stylish-haskell'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'lukerandall/haskellmode-vim'
" Plugin 'bitc/vim-hdevtools'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Golang
Plugin 'fatih/vim-go'

" Formats
Plugin 'godlygeek/tabular' " needed for markdown
Plugin 'tpope/vim-markdown'
Plugin 'cespare/vim-toml'

" Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ingydotnet/yaml-vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'tComment'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" General {{{
" map : to ; for qwerty
noremap ; :

set encoding=utf8
set laststatus=2        " Always show the statusline
set nocompatible        " the future is now, use vim defaults instead of vi ones

syntax enable 		      " Enable syntax highlighting
filetype on             " /!\ doesn't play well with compatible mode
filetype plugin on      " trigger file type specific plugins
filetype indent on      " indent based on file type syntax

set clipboard=unnamed   " Yank everything to the system clipboard

set history=1000        " keep 1000 lines of command line history
set undolevels=200      " Undo history
set ttyfast             " Yes, we have a fast terminal
set title               " change the terminal title
set lazyredraw          " do not redraw when executing macros
set report=0            " always report changes

" }}}

" UI Layout {{{
set cmdheight=1         " height of the command line
set number              " show line numbers
set hidden
set ruler               " show the cursor position all the time
set showcmd             " show command in bottom bar
set scrolloff=1         " Always show at least one line above/below the cursor.
set nocursorline        " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
" }}}

" {{{ Editing

set nowrap                      " don't wrap lines
set nojoinspaces                " insert only one space after '.', '?', '!' when joining lines
set showmatch                   " briefly jumps the cursor to the matching brace on insert
set matchtime=4                 " blink matching braces for 0.4s
set backspace=indent,eol,start  " allow backspacing over everything
fixdel

set softtabstop=2
set shiftwidth=2                " indent with 2 spaces
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=2
set expandtab
set wrap                        " set linewrap

set lbr
set tw=500
set autoindent
set smartindent
set copyindent                  " Take indentation from previous line

" set list                      " Show invisible characters
set listchars=""                " Reset the listchars
set listchars=tab:»·,trail:·,eol:¬,nbsp:_

" reselect last selection after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=250

" allow multiple pastes of the same content when pasting in visual mode.
vnoremap p pgvy
" }}}

" == Silver Searcher ===========================

" Ag
" brew install the_silver_searcher
" pacman -S the_silver_searcher
" apt-get install silversearcher-ag
let g:ackprg = 'ag --nogroup --nocolor --column --ignore="*.min.js"'
" Allow lowercase ack in case of misspelling
cnoreabbrev <expr> ack getcmdtype() == ':' && getcmdline() ==# 'ack' ? 'Ack' : 'ack'

" == Buffers ==================================

set autoread         " Set to auto read when a file is changed from the outside
set nobomb           " don't clutter files with Unicode BOMs
set hidden           " enable switching between buffers without saving
set switchbuf=usetab " switch to existing tab then window when switching buffer
set fsync            " sync after write
set confirm          " ask whether to save changed files

if has("autocmd")
  augroup trailing_spaces
    " autocmd!
    autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces before saving
  augroup END
endif

" Folding {{{
" if has("folding")
"   set foldenable
"   set foldmethod=indent   " fold based on indent
"   set foldlevelstart=99   " start editing with all folds open
"   set foldnestmax=10      " deepest fold is 3 levels
"   set nofoldenable        " dont fold by default
"   nnoremap <space> za
" endif
" }}}

" == Completion ==================================

" set completeopt=longest,menuone,preview             " better completion
set wildmenu                                        " enable ctrl-n and ctrl-p to scroll thru matches
" set wildmode=longest:full,list:longest
set wildignore=*.o,*.obj,*~                         " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=.git                                " ignore the .git directory
set wildignore+=*.DS_Store                          " ignore Mac finder/spotlight crap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store,*.min.css,*.min.js

if exists("&wildignorecase")
  set wildignorecase
endif

" == Color + font ===================================

set ffs=unix,mac,dos	  " Support all three, in this order

" == Git/SVN Errors =====================================

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" == Filetypes =======================================

au BufRead,BufNewFile *.module            set filetype=php
au BufRead,BufNewFile *.inc               set filetype=php
au BufRead,BufNewFile *.install           set filetype=php
au BufRead,BufNewFile *.less,*.scss       set filetype=css
au BufRead,BufNewFile *.json              set filetype=javascript
au BufRead,BufNewFile *.handlebars,*.hbs  set filetype=handlebars
au BufRead,BufNewFile *.tmpl              set filetype=html
au BufRead,BufNewFile *.go                set filetype=go
au BufRead,BufNewFile *.ru,*.rb           set filetype=ruby
" Haskell
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2
au Bufenter *.hs,*.lhs compiler ghc
" Extra syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,.caprc,.irbrc,irb_tempfile*} set ft=ruby
" Spell check certain filetypes (eg Markdown)
autocmd BufRead,BufNewFile *.md   setlocal spell
autocmd BufRead,BufNewFile *.txt  setlocal spell

" Searching {{{
set hlsearch                " Highlight search things
set incsearch               " Make search act like search in modern browsers
set ignorecase              " Case insensitive matching...
set smartcase               " ... unless they contain at least one capital letter
" }}}

" Files/Backup {{{
set nobackup                " do not keep a backup file, use versions instead
set nowb
set noswapfile
" }}}

" Visualbell {{{
set visualbell              " shut up
set noerrorbells            " shut up
set mousehide               " hide mouse pointer when typing
" }}}

" CTags {{{
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }
nmap <F8> :TagbarToggle<CR>
" }}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_sass_checkers = ['sass', 'sass_lint', 'sassc']
let g:syntastic_javascript_checkers = ['flow', 'eslint']

let g:syntastic_php_checkers = ['php', 'phpmd', 'phpcs']
let g:syntastic_php_phpmd_post_args = "unusedcode,design,codesize"
let g:syntastic_php_phpcs_args = "--tab-width=2 --standard=~/.terminator/phpcs_ruleset.xml"
let g:syntastic_enable_signs=1    " show signs in bar
let g:syntastic_check_on_open=0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_mode_map = {  'mode': 'active',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['scss']}

autocmd BufEnter * :syntax sync fromstart
" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" == Statusline =========================

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

" == Mouse =============================

" Enable mouse in all modes. -> https://bitheap.org/mouseterm/
set mouse=a
" Set mouse type to xterm.
set ttymouse=xterm

" == Airline =========================

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline) "
let g:airline_powerline_fonts=1
set ttimeoutlen=50

" == Configure browser for haskell_doc.vim ================

" let g:haddock_browser = "open"
" let g:haddock_browser_callformat = "%s %s"
" let g:haddock_docdir="/usr/local/share/doc/ghc/html/"
" let g:haskell_indent_case=2

" == Source after saving ================

" Keyboard {{{
let mapleader = ","

" Save
nnoremap <leader>w :w<CR>

" Show/hide hidden characters
nmap <leader>l :set list!<cr>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}

command! KillWhitespace :call StripTrailingWhitespaces()<CR>

function! StripTrailingWhitespaces()
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

" Run ctags
map <leader>ct :!ctags --tag-relative=yes -R -f ./.git/tags --exclude=.git --exclude=storage --exclude=node_modules --exclude=tests --exclude=public --exclude=vendor<CR>

" Clean windows weird characters
command! CleanWindowsShit :call CleanWindowsCharacters()<CR>
function! CleanWindowsCharacters()
  :%s/\\//g
endf

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

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

" == Paste mode ===============================

nnoremap <F2> :set invpaste paste?<CR> " Enable F2 key for toggling pastemode
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" == HTML ===============================

:vmap <leader><leader>b <S-S><strong>
:vmap <leader><leader>i <S-S><em>

" convert list of lines to <li>
map <leader><leader>l :s/\s\+$//e<CR>:'<,'>s/^/<li>/g<CR>:'<,'>s/$/<\/li>/g<CR>:nohl<CR>

" == Javascript =============================

let g:javascript_plugin_flow = 1

" == Nerdtree ================================

nmap <silent> <c-n> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" set autochdir
let NERDTreeChDirMode = 1

" == CtrlP ================================

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:btt'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 0 " always open in new buffer
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\.(git|hg|svn)$\|\.(o|swp|pyc|wav|mp3|ogg|blend|jpg|png|gif|psd|ai|svg)$\|node_modules\|documentation\|vendor\|DS_Store\|git\|min'
map <leader>cp :CtrlPClearCache<CR>
map <leader>o :CtrlP<CR>
" }}}

" Silver Searcher in ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" == Emmet (previously Zencoding ===========

" Emmet {{{
let g:use_emmet_complete_tag = 1
let g:user_emmet_leader_key = '<c-e>'
" }}}

" JSX
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'js',
\  },
\}

" == Split windows ====================

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" switch between windows by hitting <Tab> twice
nmap <silent> <Tab><Tab> <C-w>w

" enlarge splits
map + 3<c-w>>
map - 3<c-w><

" == Search ==========================

" show number of matches after a search
nmap <leader>c :%s///gn<cr>

" == Golang ============================

" Clear filetype flags before changing runtimepath to force Vim to reload them.

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" == VIM JSX =======================================================

let g:jsx_ext_required = 0

" == YUNO ============================

"Y U No Commit {{{
let g:YUNOcommit_after = 20
" }}}

" == UltiSnips =================================================================

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-tab>"

" Do not interfere with vim mapping
inoremap <c-x><c-k> <c-x><c-k>

" == Highlight =========================
" Highlight words to avoid in production

highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cconsole\|var_dump\|print_r\|alert/
autocmd BufWinEnter * match TechWordsToAvoid /\cconsole\|var_dump\|print_r\|alert/
autocmd InsertEnter * match TechWordsToAvoid /\cconsole\|var_dump\|print_r\|alert/
autocmd InsertLeave * match TechWordsToAvoid /\cconsole\|var_dump\|print_r\|alert/
autocmd BufWinLeave * call clearmatches()

let g:jsx_ext_required = 0

" == User defined =====================

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

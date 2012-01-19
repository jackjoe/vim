
" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

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


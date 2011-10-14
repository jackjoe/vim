" No ugly toolbar
set guioptions-=T

set go-=T
set bg=dark

" The beautiful solarized
colorscheme wombat
set gfn=Monaco:h11

" Disable error bells.
set noerrorbells 

" Size matters
set lines=50
set columns=170

" decent full screen support
set fuoptions=maxvert,maxhorz

" ---------------------------------------------------------------------------
" |                           Host specific                                 |
" |               Don't forget to symlink .gvimrc.local !                   |
" ---------------------------------------------------------------------------
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
" 

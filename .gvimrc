" No ugly toolbar
set guioptions-=T

set go-=T
set bg=dark

" The beautiful solarized
set background=light
colorscheme solarized
set gfn=Menlo:h12

" Size matters
set lines=50
set columns=170

" decent full screen support
set fuoptions=maxvert,maxhorz

" Set visible column wrap to 78 chars
set colorcolumn=78
set textwidth=78

if &background == "dark"
    hi normal guibg=black
endif

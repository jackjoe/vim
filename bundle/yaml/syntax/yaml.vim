" Vim color file
" Maintainer:   Michael Brailsford <brailsmt@yahoo.com>
" Date:			$Date: 2002/04/01 05:11:19 $ 
" Version: 		$Revision: 1.2 $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=dark	
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="midnight"

hi Normal guifg=lightsteelblue guibg=#00006f ctermfg=14

"Make semicolons at the end of lines stick out
"syn match semicolon #;$#
"hi semicolon guifg=red gui=bold ctermfg=1

hi Cursor guifg=bg guibg=fg ctermfg=0 ctermbg=11
"hi CursorIM	
"hi Directory	
hi DiffAdd guifg=yellow guibg=darkgreen ctermbg=0
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
hi Folded guibg=#000047 ctermbg=4 guifg=yellow ctermfg=11 gui=bold
hi FoldColumn guibg=lightblue ctermbg=14 guifg=darkblue ctermfg=11 gui=bold
"hi IncSearch	
"hi LineNr		
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi Search		
"hi SpecialKey	
"hi StatusLine	
"hi StatusLineNC	
"hi Title		
hi Visual guifg=fg guibg=bg
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment guifg=green ctermfg=10
hi Constant	guifg=lightmagenta gui=bold ctermfg=13
hi String guifg=indianred1 ctermfg=5
hi Character guifg=violet ctermfg=5
hi Number guifg=turquoise1 ctermfg=5
"hi Identifier	
hi Statement guifg=khaki1 gui=bold ctermfg=15 cterm=underline
hi PreProc guifg=firebrick1 gui=italic ctermfg=9
hi Type	guifg=gold gui=bold ctermfg=3
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
hi Todo guifg=yellow guibg=blue gui=bold

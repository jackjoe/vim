" Vim color file - madeofme
" Adaptation of 'madeofcode'
" Main changes I made:
" - replaced the wider column separator with a fine | line
" Last change: May 14 2020
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "madeofcode"

hi IncSearch guifg=NONE guibg=#233466 guisp=#233466 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
hi SpecialComment guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Typedef guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Title guifg=#f8f8f8 guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Folded guifg=#c050c2 guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=170 ctermbg=234 cterm=NONE
hi PreCondit guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Include guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi TabLineSel -- no settings --
hi StatusLineNC guifg=#f8f8f8 guibg=#363745 guisp=#363745 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#353c4f guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=239 ctermbg=234 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
"hi DiffText -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Debug guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Identifier guifg=#99cf50 guibg=NONE guisp=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Conditional guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#99cf50 guibg=NONE guisp=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi Todo guifg=#c050c2 guibg=#000000 guisp=#000000 gui=bold,italic ctermfg=170 ctermbg=NONE cterm=bold
hi Special guifg=#545454 guibg=NONE guisp=NONE gui=NONE ctermfg=240 ctermbg=NONE cterm=NONE
hi LineNr guifg=#81818a guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=245 ctermbg=234 cterm=NONE
hi StatusLine guifg=#f8f8f8 guibg=#363745 guisp=#363745 gui=bold ctermfg=15 ctermbg=238 cterm=bold
hi Normal guifg=#f8f8f8 guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=15 ctermbg=234 cterm=NONE
hi Label guifg=#8fff58 guibg=#102522 guisp=#102522 gui=NONE ctermfg=119 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
hi PMenuSel guifg=NONE guibg=#05448d guisp=#05448d gui=NONE ctermfg=NONE ctermbg=24 cterm=NONE
hi Search guifg=NONE guibg=#233466 guisp=#233466 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Statement guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#54576B guibg=NONE guisp=#000000 gui=italic ctermfg=170 ctermbg=NONE cterm=NONE
hi Character guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi Float guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi Number guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi Boolean guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi Operator guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#12142E guisp=#090a1b gui=NONE ctermfg=2 ctermbg=234 cterm=NONE
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi Question -- no settings --
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi DiffDelete -- no settings --
"hi ModeMsg -- no settings --
hi CursorColumn guifg=NONE guibg=#12142E guisp=#090a1b gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Define guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Function guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
"hi FoldColumn -- no settings --
hi PreProc guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=NONE guibg=#05448d guisp=#05448d gui=NONE ctermfg=NONE ctermbg=24 cterm=NONE
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
hi VertSplit guifg=#363745 guibg=#090a1b guisp=#363745 gui=NONE ctermfg=238 ctermbg=238 cterm=NONE
hi Exception guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Keyword guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Type guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
"hi DiffChange -- no settings --
hi Cursor guifg=NONE guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
"hi SpellLocal -- no settings --
"hi Error -- no settings --
hi PMenu guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#353c4f guibg=#090a1b guisp=#090a1b gui=NONE ctermfg=239 ctermbg=234 cterm=NONE
hi Constant guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
"hi DefinedName -- no settings --
hi Tag guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi String guifg=#8fff58 guibg=#102522 guisp=#102522 gui=NONE ctermfg=119 ctermbg=235 cterm=NONE
hi PMenuThumb guifg=NONE guibg=#81818a guisp=#81818a gui=NONE ctermfg=NONE ctermbg=245 cterm=NONE
hi MatchParen guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi Structure guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Macro guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
"hi DiffAdd -- no settings --
"hi TabLine -- no settings --
hi htmlarg guifg=#45c1ea guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi javascriptfunction guifg=#99cf50 guibg=NONE guisp=NONE gui=NONE ctermfg=149 ctermbg=NONE cterm=NONE
hi erubycomment guifg=#c050c2 guibg=#000000 guisp=#000000 gui=italic ctermfg=170 ctermbg=NONE cterm=NONE
hi rubyclass guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi rubyrailsarmethod guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
hi htmlspecialchar guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi rubyexception guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi csscommonattr guifg=#cf6a4c guibg=NONE guisp=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
hi rubyescape guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi rubyfunction guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyrailsuserclass guifg=#00ffbc guibg=NONE guisp=NONE gui=NONE ctermfg=49 ctermbg=NONE cterm=NONE
"hi cssbraces -- no settings --
hi rubyglobalvariable guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#45c1ea guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyblockparameter guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi erubyrailsmethod guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
hi javascriptrailsfunction guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
"hi javascriptbraces -- no settings --
hi rubyregexpdelimiter guifg=#e9c062 guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi csscolor guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi rubyconstant guifg=#00ffbc guibg=NONE guisp=NONE gui=NONE ctermfg=49 ctermbg=NONE cterm=NONE
hi rubyrailsmethod guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
"hi erubydelimiter -- no settings --
hi rubypseudovariable guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi rubyrailsarassociationmethod guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
hi rubyrailsrendermethod guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
hi rubyinstancevariable guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi rubyinterpolationdelimiter  guifg=#545454      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyclassvariable guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi htmltag guifg=#45c1ea guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi rubycontrol guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi yamlalias guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi yamldocumentheader guifg=#8fff58 guibg=#102522 guisp=#102522 gui=NONE ctermfg=119 ctermbg=235 cterm=NONE
hi csspseudoclassid guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi cssvaluelength guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi rubystringdelimiter guifg=#8fff58 guibg=#102522 guisp=#102522 gui=NONE ctermfg=119 ctermbg=235 cterm=NONE
hi cssfunctionname guifg=#f1d950 guibg=NONE guisp=NONE gui=NONE ctermfg=221 ctermbg=NONE cterm=NONE
hi yamlanchor guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi rubyregexp guifg=#e9c062 guibg=NONE guisp=NONE gui=NONE ctermfg=179 ctermbg=NONE cterm=NONE
hi rubysymbol guifg=#0a9cff guibg=NONE guisp=NONE gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
hi cssurl guifg=#588aff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
hi rubyinclude guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi cssclassname guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi yamlkey guifg=#6fd3ff guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyoperator guifg=#EC606A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi clear -- no settings --
hi htmlendtag guifg=#45c1ea guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi elixirAtom guifg=#3BFFBC guibg=NONE guisp=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
" adaptations
" vertical split lint

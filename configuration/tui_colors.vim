" -----------------------------------------------------------------------------
" --- TUI Colors
" -----------------------------------------------------------------------------
"
" Description:	Custom UI colors for various elements
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File tui_colors.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_tui_colors")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" If colors are not supported
if &t_Co <= 2 && !has("gui_running")
	finish
endif

" Highlight last search terms
set hlsearch

" Enable syntax highlighting
syntax enable

" Cursor (character under it)
highlight Cursor			ctermfg=black		ctermbg=white

" PopUp Menu
highlight Pmenu				ctermfg=white		ctermbg=darkmagenta
highlight PmenuSel			ctermfg=black		ctermbg=lightmagenta
highlight PmenuSbar								ctermbg=black
highlight PmenuThumb		ctermfg=darkred

" Status Line
highlight StatusLine		ctermfg=black		ctermbg=lightmagenta
highlight StatusLineNC		ctermfg=gray		ctermbg=black

" Verical Split separation line
highlight VertSplit			ctermfg=black		ctermbg=magenta

" Wild Menu
highlight WildMenu			ctermfg=black		ctermbg=magenta

" Line Number
highlight LineNr			ctermfg=darkblue	ctermbg=black

" Non Text such as ~, $ and @
highlight NonText			ctermfg=cyan	ctermbg=black

" Diff
highlight DiffAdd			ctermfg=white		ctermbg=darkgreen
highlight DiffChange		ctermfg=white		ctermbg=darkblue
highlight DiffDelete		ctermfg=white		ctermbg=darkred
highlight DiffText			ctermfg=white		ctermbg=darkmagenta

" Search
highlight Search			ctermfg=black		ctermbg=yellow
highlight IncSearch			ctermfg=white		ctermbg=black

" Matching parenthesis
highlight MatchParen		ctermfg=black		ctermbg=cyan

" Error Message
highlight ErrorMsg			ctermfg=white		ctermbg=red

" Question
highlight Question			ctermfg=green		ctermbg=black

" Directory
highlight Directory			ctermfg=green		ctermbg=black			cterm=underline

" Operators
highlight Operator			ctermfg=magenta

" StorageClass
highligh StorageClass		ctermfg=lightgreen

" Strong Delimiter
highlight StrongDelimiter	ctermfg=blue								cterm=bold
highlight Delimiter			ctermfg=cyan
highlight Operator			ctermfg=magenta
highlight Special			ctermfg=red									cterm=underline

" Spell
highlight SpellBad			ctermfg=red			ctermbg=black			cterm=underline
highlight SpellCap			ctermfg=blue		ctermbg=black			cterm=underline
highlight SpellRare			ctermfg=green		ctermbg=black			cterm=underline
highlight SpellLocal		ctermfg=magenta		ctermbg=black			cterm=underline

let g:loaded_tui_colors = 1

" vim: set fdm=marker:

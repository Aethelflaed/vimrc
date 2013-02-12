" -----------------------------------------------------------------------------
" --- Allman code style
" -----------------------------------------------------------------------------
"
" Description:	Allman code style
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	February 12 2013
"

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File allman.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists('g:loaded_allman')
	finish
endif
" }}}
" -----------------------------------------------------------------------------

function! code_style#allman#enable()
	call <SID>parenthese()
	call <SID>brace()
endfunction

" LOCAL FUNCTIONS {{{1

" Remove the whitespaces between a name and a parenthese
function s:parenthese()
	if search('\(\w\)\s\+(', 'nwc') > 0
		%s/\(\w\)\s\+(/\1(/g
	endif
endfunction

" If a brace is after a name, remove eventual whitespaces and skip a line
function s:brace()
	if search('\S\s*{\s*$', 'nwc') > 0
		%s/\(\S\)\s*{\s*$/\1\r{/g
	endif
endfunction

" }}}

let g:loaded_allman = 1

" vim: set fdm=marker:

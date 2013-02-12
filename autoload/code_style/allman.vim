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
	let cursor = getpos('.')

	call <SID>clean_eol()
	call <SID>parentheses()
	call <SID>braces()

	call <SID>whitespaces()

	normal gg=G
	call setpos('.', cursor)
endfunction

" LOCAL FUNCTIONS {{{1

function s:whitespaces()
	if search('\s\+$\| \+\ze\t', 'nwc') > 0
		%s/\s\+$\| \+\ze\t//g
	endif
endfunction

function s:clean_eol()
	if search('\r\n', 'nwc') > 0
		%s/\r\n/\r/g
	endif
	if search('', 'nwc') > 0
		%s///g
	endif
endfunction

" Remove the whitespaces between a name and a parenthese
function s:parentheses()
	if search('\(\w\)\s\+(', 'nwc') > 0
		%s/\(\w\)\s\+(/\1(/g
	endif
endfunction

" If a brace is after a name, remove eventual whitespaces and skip a line
function s:braces()
	if search('\S\s*{\s*$', 'nwc') > 0
		%s/\(\S\)\s*{\s*$/\1\r{/g
	endif
endfunction

" }}}

let g:loaded_allman = 1

" vim: set fdm=marker:

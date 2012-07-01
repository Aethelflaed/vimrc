" -----------------------------------------------------------------------------
" --- Text configuration
" -----------------------------------------------------------------------------
"
" Description:	Text configuration, including file format, spell and encoding
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	October 10 2011

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File spell.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_spell")
	finish
endif
" -----------------------------------------------------------------------------

set fileencodings=utf-8,latin1,default
set encoding=utf-8
set fileformats=unix,mac

set spelllang=en_us

let g:loaded_spell = 1


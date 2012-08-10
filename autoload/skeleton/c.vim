" -----------------------------------------------------------------------------
" --- skeleton#c
" -----------------------------------------------------------------------------
"
" Description:	Specialize skeleton for C language
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File c.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:skeleton_c_loaded")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

function! skeleton#c#load()
	let name = expand('%:t:r')
	let ext = expand('%:e')

	let file = 'c/'

	if name == 'main' && ext == 'c'
		let file .= 'main.c'
	else
		let file .= 'skeleton.' . ext
	endif
	call skeleton#read(file)
endfunction

let g:skeleton_c_loaded = 1

" vim: set fdm=marker:

" -----------------------------------------------------------------------------
" --- skeleton#cpp
" -----------------------------------------------------------------------------
"
" Description:	Specialize skeleton for C++ language
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File cpp.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:skeleton_cpp_loaded")
	finish
endif
" -----------------------------------------------------------------------------

function! skeleton#cpp#load()
	let name = expand('%:t:r')
	let ext = expand('%:e')

	let file = g:skeletons_dir . '/cpp/'

	if name == 'main' && ext == 'cpp'
		let file .= 'main.cpp'
	else
		let file .= 'skeleton.' . ext
	endif
	call skeleton#read(file)
endfunction

let g:skeleton_cpp_loaded = 1

" vim: set fdm=marker:

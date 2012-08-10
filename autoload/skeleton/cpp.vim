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
		if ext == 'cpp'
			let cmdheight = &cmdheight
			setlocal cmdheight=2
			echo 'Open header file (' . name . '.hpp)? [y/n] '
			if nr2char(getchar()) == 'y'
				call skeleton#read(file)
				setlocal nomodified
				silent execute ':vsp ' . name . '.hpp'
				set ft=cpp
				if findfile(expand('%:p:h') . '/' . name . '.hpp') == ''
					call skeleton#cpp#load()
				endif
				let &cmdheight = cmdheight
				return
			endif
			let &cmdheight = cmdheight
		endif
	endif
	call skeleton#read(file)
endfunction

let g:skeleton_cpp_loaded = 1

" vim: set fdm=marker:

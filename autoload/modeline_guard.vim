" -----------------------------------------------------------------------------
" --- Modeline Guard
" -----------------------------------------------------------------------------
"
" Description:	Manages trusted file whose modeline only are executed
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File modeline_guard.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:modeline_guard_loaded")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

if !exists('g:modeline_guard_trust_dir')
	let g:modeline_guard_trust_dir = $HOME . '/.vim/trust'
endif

function! modeline_guard#enable()
	call modeline_guard#disable()

	if finddir(g:modeline_guard_trust_dir) == ''
		silent call mkdir(g:modeline_guard_trust_dir, 'p')
	endif

	augroup modeline_guard
		autocmd!

		autocmd BufReadPre * call modeline_guard#check()
	augroup END
endfunction

function! modeline_guard#disable()
	augroup modeline_guard
		autocmd!
	augroup END
endfunction

function! modeline_guard#trust()
	let trust_file = g:modeline_guard_trust_dir . expand('%:p')
	let trust_file_dir = g:modeline_guard_trust_dir . expand('%:p:h')
	if findfile(trust_file) == ''
		if finddir(trust_file_dir) == ''
			silent call mkdir(trust_file_dir, 'p')
		endif
		call writefile(['1'], trust_file)
		echo 'File now trusted. Modeline effective at next restart'
	else
		echo 'File already trusted'
	endif
endfunction

function! modeline_guard#check()
	if findfile(g:modeline_guard_trust_dir . expand('%:p')) != ''
		setlocal modeline
	endif
endfunction

let g:modeline_guard_loaded = 1

" vim: set fdm=marker:

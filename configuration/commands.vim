" -----------------------------------------------------------------------------
" --- Commands
" -----------------------------------------------------------------------------
"
" Description:	User defined commands
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 19 2011

" -----------------------------------------------------------------------------
" Load guard
if v:version < 703
	echoerr 'File commands.vim has not been tested on this version (' . v:version . ')'
endif
" Prevents file from being included more than once
if exists('g:loaded_commands')
	finish
endif
" -----------------------------------------------------------------------------

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
	command DiffOrig
				\ vert new		|
				\ set bt=nofile	|
				\ r #			|
				\ 0d_			|
				\ diffthis		|
				\ wincmd p		|
				\ diffthis
endif

" Remove all trailing spaces and spaces before tabs of the file
if !exists(':RemoveTrailingSpaces')
	command RemoveTrailingSpaces :%s/\s\+$\| \+\ze\t//g
endif

if !exists(':Trust')
	command Trust
				\ let b:trust_file = g:trust_dir . expand('%:p')		|
				\ let b:trust_file_dir = g:trust_dir . expand('%:p:h')	|
				\ if findfile(b:trust_file) == ''						|
				\	if finddir(b:trust_file_dir) == ''					|
				\		silent call mkdir(b:trust_file_dir, 'p')		|
				\	endif												|
				\	call writefile(['trusted'], b:trust_file)			|
				\	echo 'File now trusted. modeline effective !'		|
				\ else													|
				\	echo 'File already trusted'							|
				\ endif
endif

let g:loaded_commands = 1


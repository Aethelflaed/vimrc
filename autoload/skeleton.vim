" -----------------------------------------------------------------------------
" --- skeleton
" -----------------------------------------------------------------------------
"
" Description:	Apply a predefined skeleton to a new file
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File skeleton.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:skeleton_loaded")
	finish
endif
" }}}1
" -----------------------------------------------------------------------------

" CONFIGURATION {{{1

if !exists('g:skeleton_author')
	let g:skeleton_author = ''
endif

" }}}1

function! skeleton#load()
	let type = &ft
	let name = expand('%')
	let ext = expand('%:e')

	let file = 'skeleton.' . type

	execute 'runtime! autoload/skeleton/' . type . '.vim'
	if exists('*skeleton#' . type . '#load')
		execute 'call skeleton#' . type . '#load()'
	else
		call skeleton#read(file)
	endif
endfunction

" GLOBAL FUNCTIONS {{{1

function! skeleton#replace(text, repl, flag)
	let pos = [1, 1]
	call cursor(1, 1)
	let hasfind=searchpos('\C' . a:text)
	while hasfind != [0, 0]
		let pos = hasfind
		let line = substitute(getline('.'), a:text, a:repl, a:flag)
		call setline('.', line)

		let hasfind = 'g' == a:flag ? searchpos('\C' . a:text, 'W') : [0, 0]
	endwhile

	return pos
endfunction

function! skeleton#filename(default)
	let filename = expand('%:t:r')
	return '' == filename ? a:default : filename
endfunction

function! skeleton#Filename(default)
	return substitute(skeleton#filename(a:default), '\<.', '\U\0', 'g')
endfunction

function! skeleton#FILENAME(default)
	return substitute(skeleton#filename(a:default), '.*', '\U\0', '')
endfunction

function! skeleton#template()
	let type = &filetype
	if exists('*skeleton#' . type . '#template')
		execute 'call skeleton#' . type . '#template()'
	endif

	call skeleton#replace('${author}', g:skeleton_author, 'g')
	call skeleton#replace('${datetime}', strftime('%Y/%m/%d %H:%M:%S'), 'g')
	call skeleton#replace('${date}', strftime('%B %d %Y'), 'g')
	call skeleton#replace('${FILENAME}', skeleton#FILENAME('UNKNOWN'), 'g')
	call skeleton#replace('${Filename}', skeleton#Filename('Unknown'), 'g')
	call skeleton#replace('${filename}', skeleton#filename('unknown'), 'g')
	let cur = skeleton#replace('${cursor}', '', '')
	call setpos('.', [0, cur[0], cur[1]])
endfunction

function! skeleton#read(file)
	let file = g:skeletons_dir . '/' . a:file
	if findfile(file) != ''
		try
			silent execute '0r ' . file
			call skeleton#template()
		catch /.*/
			return
		endtry
	endif
endfunction

" }}}

let g:skeleton_loaded = 1

" vim: set fdm=marker:

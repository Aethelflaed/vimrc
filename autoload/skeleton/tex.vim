" -----------------------------------------------------------------------------
" --- skeleton#tex
" -----------------------------------------------------------------------------
"
" Description:	Specialize skeleton for (la)tex language
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 13 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File tex.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:skeleton_tex_loaded")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" Make sure skeleton.vim is loaded

if !exists('g:skeleton_loaded')
	runtime! autoload/skeleton.vim
endif

" CONFIGURATION {{{1

if !exists('g:skeleton_tex_author')
	let g:skeleton_tex_author = g:skeleton_author
endif

if !exists('g:skeleton_tex_address')
	let g:skeleton_tex_address = ''
endif

" }}}

function! skeleton#tex#load()
	let name = expand('%:t:r')

	call skeleton#read(skeleton#tex#skel())

	let cmdheight = &cmdheight
	setlocal cmdheight=2
	let &cmdheight = cmdheight

endfunction

function! skeleton#tex#template()
	call skeleton#replace('${header}', s:skeleton_tex_header, '')
	call skeleton#replace('${tex_author}', g:skeleton_tex_author, 'g')
	call skeleton#replace('${tex_address}', g:skeleton_tex_address, 'g')

	execute ':%s/<CR>/\r/g'
endfunction

function! skeleton#tex#skel()
	let class = skeleton#tex#class()
	if class == 'letter'
		let class .= '/' . skeleton#tex#letter()
	endif
	return 'tex/classes/' . class . '.tex'
endfunction

function! skeleton#tex#class()
	let prompt = ['Document class?', '1. article', '2. book', '3. letter', '4. report']
	let classes = ['', 'article', 'book', 'letter', 'report']
	let index = inputlist(prompt)
	if index < 1 || index > 4
		return 'unknown'
	endif
	let class = classes[index]
	return class
endfunction

function! skeleton#tex#letter()
	let prompt = ['What letter?', '1. US', '2. FR']
	let letters = ['', 'us', 'fr']
	let index = inputlist(prompt)
	while index < 1 || index > 2
		let index = inputlist(prompt)
	endwhile
	let letter = letters[index]
	return letter
endfunction

let s:skeleton_tex_header =
			\ '% ${Filename}<CR>' .
			\ '%<CR>' .
			\ '% Author:		${author}<CR>' .
			\ '% Created:		${datetime}<CR>' .
			\ '% Last Change:	${date}'

let g:skeleton_tex_loaded = 1

" vim: set fdm=marker:

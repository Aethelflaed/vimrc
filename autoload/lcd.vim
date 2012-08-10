" -----------------------------------------------------------------------------
" --- lcd (Last Change Date)
" -----------------------------------------------------------------------------
"
" Description:	Auto update "Last Change"
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File autocmds.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:lcd_loaded")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" CONFIGURATION {{{1

let g:lcd_format = "%B %d %Y"
let g:lcd_pattern = "[a-zA-Z]\\+ [0-9]\\{1,2\\} [0-9]\\{4\\}"

" }}}

function! lcd#enable()
	call lcd#disable()

	augroup lcd
		autocmd!

		autocmd BufWritePre * call lcd#update()
	augroup END
endfunction

function! lcd#disable()
	augroup lcd
		autocmd!
	augroup END
endfunction

function! lcd#update()
	let line = search('Last Change:', 'wnb')
	if line > 0
		let date = strftime(g:lcd_format)
		let cur_date = matchstr(getline(line), g:lcd_pattern)
		if date != cur_date
			echo 'Update "Last Change"? [y/n]'
			let answer = nr2char(getchar())
			while answer != 'y' && answer != 'n'
				echo 'Last Change: answer by "y" or "n" '
				let answer = nr2char(getchar())
			endwhile
			if answer == 'y'
				let pos = getpos('.')
				execute '%s/Last Change:\s*' . g:lcd_pattern .
							\ '/Last Change:	' . date . '/g'
				call setpos('.', pos)
			endif
		endif
	endif
endfunction

let g:lcd_loaded = 1

" vim: set fdm=marker:

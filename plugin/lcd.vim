" -----------------------------------------------------------------------------
" --- lcd (Last Change Date)
" -----------------------------------------------------------------------------
"
" Description:	Auto update "Last Change"
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	July 04 2012

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File autocmds.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:lcd_loaded")
	finish
endif
" -----------------------------------------------------------------------------

function lcd#update()
	let s:line = search('Last Change:', 'wnb')
	if s:line > 0
		let s:format = 'date "+' . g:lcd_format . '"'
		let s:date = substitute(system(s:format), '\n', '', '')
		let s:cur_date = matchstr(getline(s:line), g:lcd_pattern)
		if s:date != s:cur_date
			let s:answer = input('Update "Last Change"? [y/n] ')
			while s:answer != 'y' && s:answer != 'n'
				let s:answer = input('Last Change: answer by "y" or "n" ')
			endwhile
			if s:answer == 'y'
				let s:date = 'Last Change:	' . s:date
				let s:command = '%s/Last Change:\s*' . g:lcd_pattern
				let s:command = s:command . '/' . s:date . '/g'
				let s:pos = getpos('.')
				execute s:command
				call setpos('.', s:pos)
				unlet s:pos
				unlet s:command
			endif
			unlet s:answer
		endif
		unlet s:format
		unlet s:date
		unlet s:cur_date
	endif
	unlet s:line
endfunction

let g:lcd_format = "%B %d %Y"
let g:lcd_pattern = "[a-zA-Z]\\+ [0-9]\\{1,2\\} [0-9]\\{4\\}"

let g:lcd_loaded = 1

" vim: set fdm=marker:

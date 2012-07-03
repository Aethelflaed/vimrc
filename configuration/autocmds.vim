" -----------------------------------------------------------------------------
" --- Auto Commands
" -----------------------------------------------------------------------------
"
" Description:	User defined auto commands
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	July 04 2012

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File autocmds.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_autocmds")
	finish
endif
" -----------------------------------------------------------------------------

augroup jump_to_last_position
	autocmd!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif
augroup END

augroup html
	autocmd!
	" Custom matching (< and >)
	autocmd FileType html set matchpairs=<:>	" Only matching for HTML
	autocmd FileType php set matchpairs+=<:>	" Add this matching for PHP
augroup END

augroup text
	autocmd!

	autocmd FileType txt set spell spelllang=en_us
	autocmd FileType tex set spell spelllang=en_us
augroup END

augroup modeline_guard
	autocmd!
	
	autocmd BufReadPre *
				\ if findfile(g:trust_dir . expand("%:p")) != ''	|
				\	set modeline									|
				\ endif
augroup END

augroup last_change
	autocmd!

	autocmd BufWritePre *
				\ if search('Last Change:', 'w')								|
				\	let s:answer = input('Update "Last Change" [y/n]? ')		|
				\	while s:answer != 'y' && s:answer != 'n'					|
				\		let s:answer = input('Answer by "y" or "n" ')			|
				\	endwhile													|
				\	if s:answer == 'y'											|
				\		let s:date = system('date "+%B %d %Y"')					|
				\		let s:date = substitute(s:date, '\n', '', '')			|
				\		let s:date = 'Last Change:	' . s:date					|
				\		let s:pattern = 'Last Change:\s\+'						|
				\		let s:pattern = s:pattern . '[a-zA-Z]\+ [0-9]\{1,2\} '	|
				\		let s:pattern = s:pattern . '[0-9]\{1,4\}'				|
				\		let s:command = '%s/' . s:pattern . '/' . s:date . '/g' |
				\		execute s:command										|
				\		unlet s:date											|
				\		unlet s:pattern											|
				\		unlet s:command											|
				\	endif														|
				\	unlet s:answer												|
				\ endif
augroup END

let g:loaded_autocmds = 1


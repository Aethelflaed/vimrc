" -----------------------------------------------------------------------------
" --- Auto Commands
" -----------------------------------------------------------------------------
"
" Description:	User defined auto commands
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File autocmds.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_autocmds")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

augroup jump_to_last_position " {{{1
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
augroup END " }}}

augroup html " {{{1
	autocmd!
	" Custom matching (< and >)
	autocmd FileType html set matchpairs=<:>	" Only matching for HTML
	autocmd FileType php set matchpairs+=<:>	" Add this matching for PHP
augroup END " }}}

augroup text " {{{1
	autocmd!

	autocmd FileType txt set spell spelllang=en_us
	autocmd FileType tex set spell spelllang=en_us
	autocmd FileType markdown set spell spelllang=en_us
augroup END " }}}

augroup modeline_guard " {{{1
	autocmd!
	
	autocmd BufReadPre *
				\ if findfile(g:trust_dir . expand('%:p')) != ''	|
				\	setlocal modeline								|
				\ endif
augroup END " }}}

augroup lcd " {{{1
	autocmd!

	autocmd BufWritePre * call lcd#update()
augroup END " }}}

augroup skeleton " {{{1
	autocmd!

	autocmd BufNewFIle *.h set filetype=c
	autocmd BufNewFIle *.tex set filetype=tex
	autocmd BufNewFile * call skeleton#load()
augroup END " }}}

let g:loaded_autocmds = 1

" vim: set fdm=marker:

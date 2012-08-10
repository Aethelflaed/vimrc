" -----------------------------------------------------------------------------
" --- Directories configuration
" -----------------------------------------------------------------------------
"
" Description:	Directories configuration and initialization
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File directories.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_directories")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" Enable backup
set backup

" Check backup & swap directories
let s:backup_dir = g:base_dir . '/backup'
let s:swap_dir = g:base_dir . '/swap'

" Check directories {{{1

if finddir(s:backup_dir) == ''
    silent call mkdir(s:backup_dir, 'p')
endif
if finddir(s:swap_dir) == ''
    silent call mkdir(s:swap_dir, 'p')
endif

" }}}

" Configure backup directory
let &backupdir = s:backup_dir
" Configure swap directory
let &directory = s:swap_dir

" Clean {{{1
unlet s:backup_dir
unlet s:swap_dir
" }}}

let g:loaded_directories = 1

" vim: set fdm=marker:

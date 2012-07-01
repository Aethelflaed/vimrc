" -----------------------------------------------------------------------------
" --- Backup configuration
" -----------------------------------------------------------------------------
"
" Description:	Backup configuration and initialization
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 19 2011

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File backup.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_backup")
	finish
endif
" -----------------------------------------------------------------------------

" Enable backup
set backup

" Check backup & swap directories
let s:backup_dir = g:base_dir . '/backup'
let s:swap_dir = g:base_dir . '/swap'
let g:trust_dir = g:base_dir . '/trust'
if finddir(g:base_dir) == ''
    silent call mkdir(g:base_dir)
endif
if finddir(s:backup_dir) == ''
    silent call mkdir(s:backup_dir)
endif
if finddir(s:swap_dir) == ''
    silent call mkdir(s:swap_dir)
endif
if finddir(g:trust_dir) == ''
	silent call mkdir (g:trust_dir)
endif

" Configure backup directory
set backupdir=$HOME/.vim/backup
" Configure swap directory
set directory=$HOME/.vim/swap

" Clean
unlet s:backup_dir
unlet s:swap_dir

let g:loaded_backup = 1


" -----------------------------------------------------------------------------
" --- Central configuration
" -----------------------------------------------------------------------------
"
" Description:	Central configuration of vim, loaded from .vimrc
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	January 20 2013

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File vimrc has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_vimrc")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

set nocompatible	" Disable VI compatibility

" Set encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

let g:base_dir = expand("<sfile>:h")

" Configure backup
source <sfile>:h/configuration/directories.vim

" If mouse is available, enable it
" and set same behavior as xterm
if has("mouse")
	set mouse=a
	behave xterm
endif

" Enable file type detection and custom settings
filetype plugin indent on

" If vim was compiled with autocommands support
if has("autocmd")
	source <sfile>:h/configuration/autocmds.vim
else
	set autoindent " always set autoindenting on
endif

" Plugins
source <sfile>:h/configuration/plugins.vim

" Load other commands
source <sfile>:h/configuration/commands.vim

" Load configuration
source <sfile>:h/configuration/configuration.vim

" Mapping
source <sfile>:h/configuration/mapping.vim

" Syntax configuration
source <sfile>:h/configuration/syntax_config.vim

" Text 
source <sfile>:h/configuration/text.vim

" see thesaurus
" see omnifunc
" see insert-index
" see usr_05
" see matchit plugin in marco under $VIMRUNTIME
" see Q_sc
" see text-objects

let g:loaded_vimrc = 1

" vim: set fdm=marker:

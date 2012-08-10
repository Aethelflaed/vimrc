" -----------------------------------------------------------------------------
" --- Plugins
" -----------------------------------------------------------------------------
"
" Description:	Plugin loader and configuration
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File plugins.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_plugins")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

let g:skeleton_author = 'Geoffroy Planquart <geoffroy@aethelflaed.com>'
call skeleton#enable()

let g:loaded_plugins = 1

" vim: set fdm=marker:

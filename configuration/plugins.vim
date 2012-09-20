" -----------------------------------------------------------------------------
" --- Plugins
" -----------------------------------------------------------------------------
"
" Description:	Plugin loader and configuration
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	September 20 2012

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
let g:skeleton_dir = g:base_dir . '/skeletons'
let g:skeleton_tex_author = 'Geoffroy \\bsc{Planquart}'
let g:skeleton_tex_address = '3 rue du Tribunal\\\\67300 \\bsc{Schiltigheim}'
call skeleton#enable()

call lcd#enable()

let g:modeline_guard_trust_dir = g:base_dir . '/trust'
call modeline_guard#enable()

call encrypted#enable()

let g:loaded_plugins = 1

" vim: set fdm=marker:

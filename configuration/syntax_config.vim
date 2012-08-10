" -----------------------------------------------------------------------------
" --- Syntax file configuration
" -----------------------------------------------------------------------------
"
" Description:	Configuration of syntax highlighting
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 10 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File syntax_config.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_syntax_cfg")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" std_c configuration
let c_cpp_comments = 1
let c_gnu = 1
let c_space_errors = 1
let c_comment_string = 1
let c_comment_numbers = 1
let c_comment_types = 1
let c_comment_date_time = 1
let c_warn_nested_comments = 1
let c_warn_8bitchars = 1
let c_warn_multichar = 1
let c_warn_digraph = 1
let c_warn_trigraph = 1
let c_char_is_integer = 1
let c_impl_defined = 1
let c_posix = 1
let c_math = 1
let c_C94 = 1
let c_C99 = 1
let c_cpp_warn = 1
let c_conditional_is_operator = 1

let g:loaded_syntax_cfg = 1

" vim: set fdm=marker:

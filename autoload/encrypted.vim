" -----------------------------------------------------------------------------
" --- encrypted
" -----------------------------------------------------------------------------
"
" Description:	Read write gpg encrypted files using vim.
" Author:		Geoffroy Planquart <geoffroy@aethelflaed.com>
" Last Change:	September 20 2012

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File encrypted.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:encrypted_loaded")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

function! encrypted#enable()
	call encrypted#disable()

	augroup encrypted
		autocmd!

		autocmd BufReadPre,FileReadPre *.gpg call <SID>stealth_mode()
		autocmd BufReadPre,FileReadPre *.gpg set binary
		autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg -d 2> /dev/null
		autocmd BufReadPost,FileReadPost *.gpg set nobinary
		autocmd BufReadPost,FileReadPost *.gpg execute ':doautocmd BufReadPost ' . expand('%:r')

		autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ase 2> /dev/null
		autocmd BufWritePost,FileWritePost *.gpg u

	augroup END
endfunction

function! encrypted#disable()
	augroup encrypted
		autocmd!
	augroup END
endfunction

" LOCAL FUNTIONS {{{1

function s:stealth_mode()
	" First make sure nothing is written to ~/.viminfo while editing
	" an encrypted file.
	set viminfo=
	" We don't want a swap file, as it writes unencrypted data to disk
	set noswapfile
	set nobackup
	set nowritebackup
	set bufhidden=wipe
endfunction

" }}}

let g:encrypted_loaded = 1

" vim: set fdm=marker:

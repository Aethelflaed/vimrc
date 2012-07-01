" -----------------------------------------------------------------------------
" --- Mapping
" -----------------------------------------------------------------------------
"
" Description:	User defined mapping
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	August 19 2011

" -----------------------------------------------------------------------------
" Load guard
if v:version != 703
	echoerr "File mapping.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_mapping")
	finish
endif
" -----------------------------------------------------------------------------

" Set <leader>
let mapleader = "@"

" Activate / deactivate search highlighting
nmap <silent> <leader>n :set nohlsearch<CR>
nmap <silent> <leader>N :set hlsearch<CR>

" Toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>

" Auto-select first item in popup completion menu
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
  \ '<C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use w!! to save as root
cmap w!! w !sudo tee >/dev/null %

let g:loaded_mapping = 1


" -----------------------------------------------------------------------------
" --- Global Configuration
" -----------------------------------------------------------------------------
"
" Description:	Global configuration of vim
" Author:		Geoffroy PLANQUART <geoffroy@planquart.fr>
" Last Change:	January 16 2013

" -----------------------------------------------------------------------------
" LOAD GUARD {{{1
if v:version != 703
	echoerr "File configuration.vim has not been tested on this version (" . v:version . ")"
endif
" Prevents file from being included more than once
if exists("g:loaded_configuration")
	finish
endif
" }}}
" -----------------------------------------------------------------------------

" Set runtimepath to include other configuration
let &runtimepath =
	\ g:base_dir.','.
	\ g:base_dir.'/ruby,'.
	\ $VIM.'/vimfiles,'.
	\ $VIMRUNTIME.','.
	\ $VIM.'/vimfiles/after,'.
	\ g:base_dir.'/after'

" -----------------------------------------------------------------------------
" Editor
" -----------------------------------------------------------------------------

" Set term title to current file title
set title

" Show line number
set number
" Show the cursor position all the time
set ruler

" Make sure auto settings are disabled
set nomodeline
set modelines=2

" Horizontal scroll if line is too long
set nowrap

" Disable all bells, audio and visual
set visualbell t_vb=

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Minimal number of screen lines to keep aboce and below the cursor
set scrolloff=3

" tilde behave as an operator
set tildeop

" Character used in list mode
set listchars=eol:$,tab:>-,trail:.,extends:>,conceal:+,nbsp:.

" -----------------------------------------------------------------------------
" Text folding
" -----------------------------------------------------------------------------

set foldcolumn=2
set foldminlines=3

" -----------------------------------------------------------------------------
" Tabs and indenting to 4 character width
" -----------------------------------------------------------------------------

set smartindent
set tabstop=4
set preserveindent
set shiftwidth=4
set shiftround
set softtabstop=4
set smarttab

" -----------------------------------------------------------------------------
" Search
" -----------------------------------------------------------------------------

set hlsearch		" Highlight last search terms
set incsearch		" Do incremental searching
set showmatch		" Show matching pattern
set matchtime=0		" 0 seconds to show the matching pattern
set noignorecase	" Disable case insensitiveness

" -----------------------------------------------------------------------------
" Commands
" -----------------------------------------------------------------------------

" Kepp 50 lines of command line history
set history=50

" Shell message include both stderr and stdout
set shellredir=>%s\ 2>&1

set showcmd			" Display incomplete commands
set cmdheight=1		" Number of command line always displayed
set laststatus=2	" always have status-line

set hidden			" Allow to change buffer without saving

set wildmenu		" turn on wild menu
set shortmess=aoI	" Shorten messages and skip intro message

set lazyredraw		" Do not redraw while executing macros

" -----------------------------------------------------------------------------
" Completion
" -----------------------------------------------------------------------------

" Show tag with function prototype
set showfulltag

" Always show the complete menu with additional info
set completeopt=longest,menuone,preview

" Set conceal level
set conceallevel=1

let g:loaded_configuration = 1

" vim: set fdm=marker:

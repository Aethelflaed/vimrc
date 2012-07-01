set nocompatible	" Disable VI compatibility

" Set encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

let g:base_dir = expand("<sfile>:h")

" Configure backup
source <sfile>:h/configuration/backup.vim

" Load TUI colors customization
source <sfile>:h/configuration/tui_colors.vim

" If mouse is available, enable it
" and set same behavior as xterm
if has("mouse")
	set mouse=a
	behave xterm
endif

" If vim was compiled with autocommands support
if has("autocmd")
	source <sfile>:h/configuration/autocmds.vim
else
	set autoindent " always set autoindenting on
endif

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
"

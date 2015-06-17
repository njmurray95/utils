"[>1;3409;0c"""""""""""""""""""""""""""""""""""""""
" Nick Murray
"
" Plugins
"   (N/A)
"
" Sections
"   | General
"   | User interface
"   | Mappings
"   | Abbreviations
"   | Search and Replace
"   | Text Formattig -- General
"   | Text Formatting -- Specific File Formats
"   | Text, tabs, and spacing
"   | Notes
" 
"
" IDEAS:
" 
"   Create mapping for comment headers
"       i.e.
" nnoremap <leader>h ############<cr>#Header<cr>############
"
"
"""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""
"   => General
"""""""""""""""""""""""""""""""""""""""""

autocmd!

"Not vi-compatible
set nocompatible

"When .vimrc is edited, reload it.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"Make editing .vimrc simple
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"Leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

"Set persistent undo
if exists("&undodir")
	set undofile
	let &undodir=&directory
	set undolevels=500
	set undoreload=500
endif

"Set Y to match C and D
nnoremap Y y$

"Set vim to use system clipboard
if has('clipboard')
    nnoremap y "+y
    nnoremap Y "+y$
    nnoremap d "+d
    nnoremap D "+D
    nnoremap p "+p
    nnoremap P "+P
    nnoremap c "+c
    nnoremap C "+C
endif

"FIXME
"Let <esc> toggle in and out of insert
"nnoremap <C-[> a


"Visual cues on errors
set visualbell " vb

"""""""""""""""""""""""""""""""""""""""""
"   => Text, tabs, and spacing
"""""""""""""""""""""""""""""""""""""""""

"Everything adjusts to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

"Auto indent
set autoindent " ai

"""""""""""""""""""""""""""""""""""""""""
"   => VIM user interface
"""""""""""""""""""""""""""""""""""""""""

"Enable syntax highlighting
syntax on

"Colorscheme
color pablo

"Show line numbers
set number " nu

"Show matching parentheses
set showmatch
set matchtime=2 " mat

"Command Line WiLd menu
set wildmenu

"Always show current position
set ruler

"Search highlights synchronously
set incsearch

"Show Status line
set laststatus=2

"Show commands as types
set showcmd

"""""""""""""""""""""""""""""""""""""""""
"   => Mappings
"""""""""""""""""""""""""""""""""""""""""

"Scrolling catches line wraps
nnoremap j gj
nnoremap k gk

"Surround a word 
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>e " in 'quotes'
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>e " in "quotes"
nnoremap <leader>> viw<esc>a><esc>bi<<esc>e " in <tags>
nnoremap <leader>< viw<esc>a><esc>bi<<esc>e " in <tags>
nnoremap <leader>) viw<esc>a)<esc>bi(<esc>e " in (parentheses)
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>e " in (parentheses)
nnoremap <leader>] viw<esc>a]<esc>bi[<esc>e " in [brackets]
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>e " in [brackets]
nnoremap <leader>} viw<esc>a}<esc>bi{<esc>e " in {curlies}
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>e " in {curlies}

"Insert a space
nnoremap <space><space> i<space><esc>

"Insert empty line
nnoremap <enter> o<esc>
augroup enter
    autocmd CmdwinEnter * nnoremap <CR> <CR> " Fix q: new enter problem
    autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

"Instant commenting
augroup comments
    autocmd!
    autocmd Filetype cpp     nnoremap <buffer> <localleader>c I//<esc>
    autocmd Filetype python  nnoremap <buffer> <localleader>c I#<esc>
    autocmd Filetype sh      nnoremap <buffer> <localleader>c I#<esc>
    autocmd Filetype vim     nnoremap <buffer> <localleader>c I"<esc>
augroup END

"Instant conditionals
augroup conditionals
    autocmd!
    autocmd Filetype cpp     :iabbrev <buffer> iff if ( )<left><left>
    autocmd Filetype python  :iabbrev <buffer> iff if:<left>
augroup END

iabbrev FX FIXME

"""""""""""""""""""""""""""""""""""""""""
"   => Notes
"""""""""""""""""""""""""""""""""""""""""

" Look into nohl
" Suggested remapping:
" nnoremap <silent> <C-l> :nohl<CR><C-l>

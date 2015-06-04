"""""""""""""""""""""""""""""""""""""""""
" Nick Murray
"
" Plugins
"   (N/A)
"
" Sections
"   | General
"   | Text, tabs, and spacing
"   | VIM user interface
"   | Mappings
"   | Notes
" 
"""""""""""""""""""""""""""""""""""""""""




"""""""""""""""""""""""""""""""""""""""""
"   => General
"""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"
let maplocalleader = "\\"

"Set persistent undo
if exists("&undodir")
	set undofile
	let &undodir=&directory
	set undolevels=500
	set undoreload=500
endif

"Set vim to use system clipboard
if has('clipboard')
    nnoremap y "+y
    nnoremap d "+d
    nnoremap p "+p
    nnoremap P "+P
    nnoremap p "+p
    nnoremap P "+P
endif

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

"Auto indent
set autoindent " ai

"""""""""""""""""""""""""""""""""""""""""
"   => VIM user interface
"""""""""""""""""""""""""""""""""""""""""

"Enable syntax highlighting
syntax on

"Color schemes
"Try these:
"color peachpuff
color pablo
"color slate
"color torte

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
nmap j gj
nmap k gk

"Set Y to match C and D
nnoremap Y y$

"Surround a word in 'quotes'

nnoremap <leader>' viw<esc>a'<esc>bi'<esc>e
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>e

"Make editing .vimrc simple
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"""""""""""""""""""""""""""""""""""""""""
"   => Notes
"""""""""""""""""""""""""""""""""""""""""

" Look into nohl
" Suggested remapping:
" nnoremap <silent> <C-l> :nohl<CR><C-l>

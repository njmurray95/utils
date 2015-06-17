""""""""""""""""""""""""""""""""""""""""
" Nick Murray
"
"   Notes
"
"   Main Settings
"    | General
"    | User Interface
"    | Basic Mappings
"    | Text, tabs, and spacing
"    | Search and Replace
"    | Foldings
"    | Abbreviations
"    | Macros
"
"   Plugins
"       gotham256.vim --> Gotham colorscheme
"
"
"
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   => Notes
"""""""""""""""""""""""""""""""""""""""""

" Look into nohl
" Suggested remapping:
" nnoremap <silent> <C-l> :nohl<CR><C-l>
"   Create mapping for comment headers
"       i.e.
" nnoremap <leader>h ############<cr>#Header<cr>############
" write command to save when not sudo
" toggle on and off $ on end of lines
" hlsearch and whitespace hl not working for some reason
"
" yypVr= underlines an entire line with =
"

"""""""""""""""""""""""""""""""""""""""""
"   => General
"""""""""""""""""""""""""""""""""""""""""

"_______________________________________"
"                                       "
"               GENERAL                 "
"_______________________________________"
"                                       "


"""""""""""""""""""""""""""""""""""""""""
"   => General
"""""""""""""""""""""""""""""""""""""""""

"Turn on vi-incompatible advanced features
set nocompatible

"Unicode 8 encoding
set encoding=utf-8

"When .vimrc is edited, reload it.
augroup reload_vimrc " {{{
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }}}

"Set persistent undo
if exists("&undodir")
    set undofile
    set undodir=~/.vim/undo
	set undolevels=500
    set undoreload=500
endif

"Fix backups
set backupdir=~/vimtemp,.
set dir=~/vimtemp//,.

"Set vim to use system clipboard
if has('clipboard')
    set clipboard=unnamed
endif

"Filetype-based behavior
syntax on                       "Enable syntax highlighting
filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype indentation
filetype plugin on              "Enable filetype plugins

"""""""""""""""""""""""""""""""""""""""""
"   => User Interface
"""""""""""""""""""""""""""""""""""""""""

if $COLORTERM ==# 'gnome-terminal'
    set t_Co=256
endif

"Colorscheme
try
    color gotham256
catch
    color pablo
endtry

set number                      "Show line numbers

set visualbell                  "Visual cues on errors

set wrap                        "Wrap long lines
set linebreak                   "Wrap lines at words instead of letters

set laststatus=2                "Show Status line
set showcmd                     "Show commands as typed
set showmode                    "Show current mode
set ruler                       "Always show current position

set mouse=a                     "Enable mouse on all modes
set scrolloff=4                 "Keep cursor 4 lines from edge 

set showmatch                   "Show matching parentheses
set matchtime=2                 "Length matched paren flashes (1/10 sec)

set wildmenu                    "Command Line WiLd menu
set wildmode=longest,list,full  "Autocomplete longest, list all, cycle 
set wildignore+=*.o,*.git,*.swp "Filetypes for autocomplete to ignore 

set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary

set hidden                      "Hide unsaved buffers when switching
set autoread                    "Automatically reload file written to disk

"""""""""""""""""""""""""""""""""""""""""
"   => Search Results
"""""""""""""""""""""""""""""""""""""""""

set smartcase                   "Search ignores case unless capitals
set incsearch                   "Search highlights synchronously
set wrapscan                    "Search wraps around end of file

set gdefault                    "Replace with :s affects entire line

"FIXME
set hlsearch "Highlight search results

"Clear search results on redraw
nnoremap <C-l> <esc>:nohlsearch<CR><C-l>


"""""""""""""""""""""""""""""""""""""""""
"   => Text, tabs, and spacing
"""""""""""""""""""""""""""""""""""""""""

"Everything adjusts to 4 spaces
set tabstop=4                   "Tab has length 4 spaces
set shiftwidth=4                ">> shifts 4 spaces
set softtabstop=4               "Tabs equate to 4 spaces
set expandtab                   "Tabs become softtabstop# spaces

set smarttab                    "<BS> deletes 1 tab's worth of spaces
set autoindent                  "Copy current indent when new line starts


"FIXME
"Highlight trailing whitespace
"highlight WhitespaceErrors ctermbg=Red guibg=Red 
"match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/ 



"""""""""""""""""""""""""""""""""""""""""
"   => Basic Mappings
"""""""""""""""""""""""""""""""""""""""""

" Reclaim Useful keys:
"______________________
" Tab -- <tab>, autocomplete, and return to next jump
" Caps Lock -- <esc> and <Ctrl> (Mapped at OS level)
" Space -- <leader>
" Enter -- Command line
" Backslash (\) -- <localleader>
" Backspace -- delete char, return to last jump

"Tab now doubles as autocomplete
inoremap <tab> <c-r>=TabOrAuto()<cr>

"Set leaders
let mapleader = "\<space>"
let maplocalleader = "\\"

"Enter starts command line
nnoremap <CR> :

"Fix Command Window enter
augroup enter
    autocmd CmdwinEnter * nnoremap <CR> <CR> " Fix q: new enter problem
    autocmd BufReadPost quickfix nnoremap <CR> <CR>
augroup END

"Backspace jumps to previous location, reversing Tab
nnoremap <BS> <C-o>

"Make backspace work set backspace=indent,eol,start
set backspace=indent,eol,start


" Other useful mappings
"_______________________

"Make editing .vimrc simple
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>

"Set Y to match C and D
nnoremap Y y$

"Insert a space
nnoremap <space><space> i<space><esc>

"Scrolling does not skip wrapped lines
nnoremap j gj
nnoremap k gk

"H and L replace 0 and $
nnoremap H 0
onoremap H 0
nnoremap L $
onoremap L $

"Switch between buffers easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Move lines up and down and reindent
nnoremap <Down> :m+<CR>==
nnoremap <Up> :m-2<CR>==

"Move chars left and right
"FIXME
nnoremap <Left> Xph
"nnoremap <Left> <c-r>=TransposeLeft()<cr>
nnoremap <Right> xp
"NOTE: <Left> will paste extra chars on 0

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

"+/- as increment/decrement is more intuitive than the defaults
nnoremap + <C-a>
nnoremap - <C-x>

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
    autocmd Filetype cpp     :iabbrev <buffer> if if ( )<left><left>
    autocmd Filetype python  :iabbrev <buffer> if if:<left>
augroup END

"""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations
"""""""""""""""""""""""""""""""""""""""""

iabbrev FX FIXME
iabbrev @@ njmurray@umich.edu
iabbrev ssig --<cr>Nick Murray<cr>njmurray@umich.edu<cr>

"""""""""""""""""""""""""""""""""""""""""
"   => Functions
"""""""""""""""""""""""""""""""""""""""""

"Return <C-n> for autocomplete on words, <tab> otherwise
function! TabOrAuto()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-n>"
    endif
endfunction

"Return <nop> on 0 col, transpose character left otherwise
function! TransposeLeft()
if col('.') ==# 1
        return "<nop>"
    else
        return "Xph"
    endif
endfunction


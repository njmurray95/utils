""""""""""""""""""""""""""""""""""""""""
" Nick Murray
"
"   Notes
"
"   Main Settings (XXX)
"    | Notes
"    | General
"    | User Interface
"    | Keyboard and Mappings
"    | Search and Replace
"    | Text, tabs, and spacing
"    | Buffers and Windows
"    | Abbreviations (TBD)
"    | Functions
"    | Macros (TBD) 
"
"   Plugins
"       gotham255.vim --> Gotham colorscheme
"
"
"
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"   => Notes (XXX)
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
"   => General (XXX)
"""""""""""""""""""""""""""""""""""""""""

"Ensure vim is not using vi compatibility mode
if &compatible | set nocompatible | endif

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
    "set undodir=$HOME/.vim/undo
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

" Saving
"________

cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""
"   => User Interface (XXX)
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

set laststatus=2                "Show Status line
set showcmd                     "Show commands as typed
set showmode                    "Show current mode
set ruler                       "Always show current position

set visualbell                  "Visual cues on errors
set cursorline                  "Highlight current line

set mouse=a                     "Enable mouse on all modes
set scrolloff=4                 "Keep cursor 4 lines from edge 

set wildmenu                    "Command Line WiLd menu
set wildmode=longest,list,full  "Autocomplete longest, list all, cycle 
set wildignore+=*.o,*.git,*.swp "Filetypes for autocomplete to ignore 

set wrap                        "Wrap long lines
set linebreak                   "Wrap lines at words instead of letters
set breakindent                 "Wrapped lines are visually indented
set breakindentopt=shift:8      "Wrapped lines are indented automatically

set showmatch                   "Show matching parentheses
set matchtime=2                 "Length matched paren flashes (1/10 sec)
set matchpairs+=<:>             "Add matching brackets

set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary
set hidden                      "Hide unsaved buffers when switching
set autoread                    "Automatically reload file written to disk


"""""""""""""""""""""""""""""""""""""""""
"   => Keyboard and Mappings (XXX)
"""""""""""""""""""""""""""""""""""""""""

" Reclaim Useful keys:
"______________________
" Tab -- <tab>, autocomplete, and return to next jump
" Caps Lock -- <esc> and <Ctrl> (Mapped at OS level)
" Space -- <leader> and un/fold
" Enter -- Command line
" Backslash (\) -- <localleader>
" Backspace -- delete char, return to last jump

"Tab now doubles as autocomplete
inoremap <tab> <c-r>=TabOrAuto()<cr>

"Set space as leader
let mapleader = "\<space>"

"Space itself is used for foldings
nnoremap <space> za

"\ becomes local leader
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
vnoremap j gj
nnoremap k gk
vnoremap k gk

"Include the default behavior if ever needed
nnoremap gj j
vnoremap gj j
nnoremap gk k
vnoremap gk k

"Let J and K browse sections of text
nnoremap J }
onoremap J }
nnoremap K {
onoremap K {

"Let <C-j> and <C-k> remember the old J and K
nnoremap <C-j> J
nnoremap <C-k> K

"H and L replace 0 and $ nnoremap H 0
nnoremap H 0
onoremap H 0
nnoremap L $
onoremap L $

"Let h and l wrap around lines
set whichwrap+=h,l

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

"Toggle relative numbers on and off
nnoremap <leader>n :set invrelativenumber<CR>

"Expedite C++ Compiling
"FIXME: Decide
"Something for :make
"Something for :cn -- go to next compile error
"Something for :cc -- go to current compile error

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
"   => Search and Replace (XXX)
"""""""""""""""""""""""""""""""""""""""""

set ignorecase					"Search ignores case
set smartcase                   "Search matches case on capital letters
set incsearch                   "Search highlights synchronously
set wrapscan                    "Search wraps around end of file

set gdefault                    "Replace with :s affects entire line

set hlsearch                    "Highlight search results

"Clear search results on redraw
nnoremap <C-l> <esc>:nohlsearch<CR><C-l>


"""""""""""""""""""""""""""""""""""""""""
"   => Text, tabs, and spacing (XXX)
"""""""""""""""""""""""""""""""""""""""""

"Everything adjusts to 4 spaces
set tabstop=4                   "Tab has length 4 spaces
set shiftwidth=4                ">> shifts 4 spaces
set softtabstop=4               "Tabs equate to 4 spaces
set expandtab                   "Tabs become softtabstop# spaces

set smarttab                    "<BS> deletes 1 tab's worth of spaces
set autoindent                  "Copy current indent when new line starts

"Highlight trailing whitespace 
highlight WhitespaceErrors ctermbg=DarkGray guibg=DarkGray
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/       

"FIXME
"Highlight comments in italics
"highlight Comment term=italic gui=italic

"""""""""""""""""""""""""""""""""""""""""
"   => Buffers and Windows (XXX)
"""""""""""""""""""""""""""""""""""""""""

set showtabline=2               "Always show tabs list

"Switch between buffers easily
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"FIXME
nnoremap <leader>c :w!<CR><C-w>c

"Switch between tabs easily
nnoremap <leader><tab> gt
nnoremap <leader><BS> gT
nnoremap <leader>x :w!<CR>:tabclose<CR>

"""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations (XXX)
"""""""""""""""""""""""""""""""""""""""""

iabbrev FX FIXME
iabbrev @@ njmurray@umich.edu
iabbrev ssig --<cr>Nick Murray<cr>njmurray@umich.edu<cr>

"""""""""""""""""""""""""""""""""""""""""
"   => Functions (XXX)
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

"""""""""""""""""""""""""""""""""""""""""
"   => Macros (XXX)
"""""""""""""""""""""""""""""""""""""""""

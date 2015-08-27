""""""""""""""""""""""""""""""""""""""""
" Nick Murray

"   Notes
"
"   Main Settings (XXX)
"    | Notes
"    | General
"    | User Interface
"    | Keyboard and Mappings
"    | Search and Replace
"    | Text and spacing
"    | Buffers and Windows
"    | Abbreviations (TBD)
"    | Functions
"    | Macros (TBD)
"
"   Plugins.
"       gotham256.vim --> Gotham colorscheme
"
"
"
"""""""""""""""""""""""""""""""""""""""""

" changing something

"""""""""""""""""""""""""""""""""""""""""
"   => Notes (XXX)
"""""""""""""""""""""""""""""""""""""""""

" Wishlist " Consistent command to comment out range of lines
" Get t and f working across lines with , and ; operators

" nnoremap <leader>h ############<cr>#Header<cr>############
" toggle on and off $ on end of lines
" hlsearch and whitespace hl not working for some reason
"
" yypVr= underlines an entire line with =
"
" Add tabedit function for easy file access
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
if has("persistent_undo")
    set undofile
    "set undodir=$HOME/.vim/undo
    set undolevels=500
    set undoreload=500
endif

" Remember 200 cmdline commands
set history=200

"Fix backups
set dir=~/.vim/swap//,/var/tmp//,/tmp//,.
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//
"FIXME

"Set vim to use system clipboard
if has('clipboard')
    set clipboard=unnamed
endif

"Filetype-based behavior
syntax on                       "Enable syntax highlighting
filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype indentation
filetype plugin on              "Enable filetype plugins

"Saving when not sudo
cnoremap w!! w !sudo tee > /dev/null %

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
set sidescrolloff=4             "Don't scroll any closer left/right

set wildmenu                    "command line wild menu
set wildmode=longest,list,full  "autocomplete longest, list all, cycle
set wildignore+=*.o,*.git,*.swp "filetypes for autocomplete to ignore

set wrap                        "Wrap long lines
set linebreak                   "Wrap lines at words instead of letters

if has('multi_byte')            "Set symbol for broken lines
    let &showbreak = '↳ '       "Display '↳ ' (u21B3)
else
    let &showbreak = '>> '      "Display '>> '
endif

set showmatch                   "Show matching parentheses
set matchtime=2                 "Length matched paren flashes (1/10 sec)
set matchpairs=(:),{:},[:],<:>  "Chars in a balanced pair


set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary
set hidden                      "Hide unsaved buffers when switching

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
inoremap <Tab> <c-r>=TabOrAuto()<cr>
inoremap <S-Tab> <c-p>

"Set space as leader
let mapleader = "\<space>"

"Space itself is used for foldings
nnoremap <space> za

"\ becomes local leader
let maplocalleader = "\\"

"Enter starts command line
noremap <CR> :
noremap q<CR> q:

"Fix Command Window enter
augroup enter
    autocmd!
    autocmd CmdwinEnter * noremap <CR> <CR>
    autocmd CmdwinLeave * noremap <CR> :
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

" Repurpose h,j,k,l
"_______________________

"Scrolling does not skip wrapped lines
noremap j gj
noremap k gk

"Include the default behavior if ever needed
noremap gj j
noremap gk k

"Let J and K browse sections of text
noremap J }
noremap K {

"Let <C-j> and <C-k> remember the old J and K
nnoremap <C-j> J
nnoremap <C-k> K

"H and L replace 0 and $ nnoremap H 0
noremap H ^
noremap L $

"Move lines up and down and reindent
nnoremap <silent> <Down> :m+<CR>==
nnoremap <silent> <Up> :m-2<CR>==

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
"   => Text and spacing
"""""""""""""""""""""""""""""""""""""""""

"Everything adjusts to 4 spaces
set tabstop=4                   "Tab has length 4 spaces
set shiftwidth=4                ">> shifts 4 spaces
set softtabstop=4               "Tabs equate to 4 spaces
set expandtab                   "Tabs become softtabstop spaces
set shiftround                  "Round indents to multiple of shiftwidth

set smarttab                    "<BS> deletes 1 tab's worth of spaces
set autoindent                  "Copy current indent when new line starts

"Maintain highlight on indent
vnoremap < <gv
vnoremap > >gv

"Reindent file
nmap <silent> <Leader>g :call Preserve("normal gg=G")<CR>

"Strip trailing whitespace
noremap <silent> <Leader>s :call Preserve("%s/\\s\\+$//e")<CR>

"Highlight trailing whitespace
highlight WhitespaceErrors ctermbg=DarkGray guibg=DarkGray
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/       

" Makefiles require tabs not spaces
augroup makefile
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" Fix python whitespace
augroup re-tab
    autocmd!
    autocmd BufWrite *.py retab
augroup END

"""""""""""""""""""""""""""""""""""""""""
"   => Buffers and Windows (XXX)
"""""""""""""""""""""""""""""""""""""""""

set splitbelow                  "Open new panes in bottom
set splitright                  "Open new panes to right

set showtabline=2               "Always show tabs list

" Easy buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Easy tab navigation
nnoremap ]1 1gt
nnoremap ]2 2gt
nnoremap ]3 3gt
nnoremap ]4 4gt
nnoremap ]5 5gt
nnoremap ]6 6gt
nnoremap ]7 7gt
nnoremap ]8 8gt
nnoremap ]9 9gt
nnoremap ]0 :tablast<CR>

"""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations (XXX)
"""""""""""""""""""""""""""""""""""""""""

iabbrev FX FIXME
iabbrev @@ njmurray@umich.edu
iabbrev ssig --<cr>Nick Murray<cr>njmurray@umich.edu<cr>

"""""""""""""""""""""""""""""""""""""""""
"   => Functions (XXX)
"""""""""""""""""""""""""""""""""""""""""

function! Preserve(command)
    let last_search=@/
    let cursor = getpos('.')
    normal H
    let window = getpos('.')
    call setpos('.', cursor)

    execute a:command

    let @/=last_search
    call setpos('.', window)
    normal zz
    call setpos('.', cursor)
endfunction


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

"Let f move linewise
function! FindChar(back, inclusive, exclusive)
    let flag = 'W'
    if a:back
        let flag = 'Wb'
    endif
    if search('\V' . nr2char(getchar()), flag)
        if a:inclusive
            norm! l
        endif
        if a:exclusive
            norm! h
        endif
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""
"   => Macros (XXX)
"""""""""""""""""""""""""""""""""""""""""

"EOF

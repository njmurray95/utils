""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    __      __ _
"    \ \    / /|_| ________
"     \ \  / /  _ |  _   _ \
"      \ \/ /  | || | | | | |
"       \__/   |_||_| |_| |_|
"
"   Author: Nick Murray
"   Version: \0
"
"   Main Settings (XXX)
"    | Notes
"    | General
"    | User Interface
"    | Keyboard and Mappings
"    | Search and Replace
"    | Text and spacing
"    | Buffers and Windows
"    | Git
"    | Functions
"
"   Plugins.
"       gotham256.vim --> Gotham colorscheme
"       gitgutter     --> Display a `git diff` in the left column
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Notes (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set visual line break at line 80
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn=join(range(81,82),",")
"let &colorcolumn=join(range(81,81),",")
"let &colorcolumn=80

" Wishlist:
" Consistent command to comment out range of lines
" Get t and f working across lines with , and ; operators
" Airline
" Better commenting

" [[ and ]] piss me off
" make [[ do % if on } and in first column, else ][%
" make ]] do % if on } and in first column, else []%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => General (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Unicode 8 encoding
set encoding=utf-8

"Reload vimrc after editing
augroup reload_vimrc " {{{
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }}}

augroup last-position-jump
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"zz" | endif
augroup END

"Set persistent undo
if has("persistent_undo")
    set undofile
    set undolevels=500
    set undoreload=500
endif

" Remember 200 cmdline commands
set history=200

"Fix backups
set dir=$HOME/.vim/swap//,/var/tmp//,/tmp//,.
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//
set viminfo+=n$HOME/.vim/viminfo

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

" Start pathogen
execute pathogen#infect()

"set statusline=%{fugitive#statusline()}

"Open all files in argslist as tabs
tab sball

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => User Interface (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colorscheme
try
    color gotham256
catch
    color pablo
endtry

set number                      "Show line numbers

set laststatus=0                "Hide Status line
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

set nowrap                      "Wrap long lines
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

set tags=tags;/                 "Search up directory for ctags file

set autochdir                   "Vim's pwd is the file's basename

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Keyboard and Mappings (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"Quit in visual mode
vnoremap ZZ <esc>ZZ
vnoremap ZQ <esc>ZQ

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

"Make backspace work
set backspace=indent,eol,start

" Other useful mappings
"_______________________

"Set Y to match C and D
nnoremap Y y$

"Split a line at cursor. Delete any trailing whitespace this creates.
nnoremap <silent> S a<cr><esc>k:silent! s/\s\+$//<CR>$

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

"Let ctrl remember original versions
nnoremap <C-j> J
nnoremap <C-k> K

"H and L replace 0 and $ nnoremap H 0
noremap H ^
noremap L $

"Move lines up and down and reindent
nnoremap <silent> <Down> :m+<CR>==
nnoremap <silent> <Up> :m-2<CR>==

" Move chars left and right
nnoremap <silent> <Left> :<C-u>silent! norm xhP<CR>
nnoremap <silent> <Right> xp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Make editing .vimrc simple
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>

"Strip trailing whitespace
"noremap <silent> <Leader>s :call Preserve("%s/\\s\\+$//e")<CR>
noremap <silent> <Leader>s :keeppatterns %s/\s\+$//e<CR>:retab<CR>

"Turn paste on and off
noremap <Leader>p :set paste!<CR>

" Toggle line wraps
nnoremap <leader>w :set wrap!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Search and Replace (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase                  "Search ignores case
set smartcase                   "Search matches case on capital letters
set incsearch                   "Search highlights synchronously
set wrapscan                    "Search wraps around end of file

set gdefault                    "Replace with :s affects entire line

set hlsearch                    "Highlight search results

"Clear search results on redraw
nnoremap <C-l> <esc>:nohlsearch<CR><C-l>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Text and spacing (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Everything adjusts to 4 spaces
set tabstop=4                   "Tab has length 4 spaces
set shiftwidth=4                ">> shifts 4 spaces
set softtabstop=4               "Tabs equate to 4 spaces
set expandtab                   "Tabs become softtabstop spaces
set shiftround                  "Round indents to multiple of shiftwidth

set smarttab                    "<BS> deletes 1 tab's worth of spaces
set autoindent                  "Copy current indent when new line starts

set colorcolumn=81              "Highlight column 81 for line breaks

"Maintain highlight on indent
vnoremap < <gv
vnoremap > >gv

"Reindent file
"nmap <silent> <Leader>g :call Preserve("normal gg=G")<CR>

"Highlight trailing whitespace
highlight WhitespaceErrors ctermbg=DarkGray guibg=DarkGray
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/

" Load filetype-specific settings
augroup filetype
    autocmd!
    autocmd FileType make       call MakefileMode()
    autocmd Filetype markdown   call MarkdownMode()
    autocmd Filetype python     call PyMode()
    autocmd BufRead latex      call LatexMode()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Buffers, Windows, and Tabs (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow                  "Open new panes in bottom
set splitright                  "Open new panes to right

set showtabline=2               "Always show tabs list

" Easy buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <silent><Leader>bt :tab sball<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Git (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <Leader>ga :!git add %<CR>
nnoremap <Leader>gga :Git add %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Modes (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MakefileMode()
    " Make requires tab characters
    setlocal noexpandtab
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
endfunction

function! MarkdownMode()
    " Wrap text slightly over 80 char edge
    setlocal textwidth=85
endfunction

function! LatexMode()
    setlocal textwidth=80
endfunction

function! CMode()
    set cindent

endfunction

function! PyMode()
    "Clean up malformed indentations
    retab
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Functions (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Return <C-n> for autocomplete on words, <tab> otherwise
function! TabOrAuto()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-n>"
    endif
endfunction

"EOF

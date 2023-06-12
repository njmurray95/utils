""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    __      __ _
"    \ \    / /|_| ________
"     \ \  / /  _ |  _   _ \
"      \ \/ /  | || | | | | |
"       \__/   |_||_| |_| |_|
"
"   Author: Nick Murray
"   Version: \0

"   Main Settings (XXX)
"    | General
"    | Plugins
"    | User Interface
"    | Keyboard and Mappings
"    | Search and Replace
"    | Text and spacing
"    | Buffers and Windows
"    | Functions
"
"   Plugins
"    | gitgutter      --> Display a `git diff` in the left column
"    | vim-surround   --> Mappings for surrounding text
"    | tmux-navigator --> Switch between vim and tmux panes

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

"Put all backups, swaps, and meta files in ~/.vim
if !exists("~/.vim/install")
    silent execute '!mkdir -p ~/.vim/swap'
    silent execute '!mkdir -p ~/.vim/backup'
    silent execute '!mkdir -p ~/.vim/undo'
    silent execute '!mkdir -p ~/.vim/colors'
    silent execute '!touch ~/.vim/install'
endif

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

"Open all files in argslist as tabs
tab sball

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Plugins (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"tmux-navigator -- write all buffers before switching over
let g:tmux_navigator_save_on_switch = 2

"Switch panes even when in insert mode
inoremap <C-h> <C-o>:silent TmuxNavigateRight<cr>
inoremap <C-j> <C-o>:silent TmuxNavigateDown<cr>
inoremap <C-k> <C-o>:silent TmuxNavigateUp<cr>
inoremap <C-l> <C-o>:silent TmuxNavigateLeft<cr>

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0                 "Don't check syntax on quitting

"Linters
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "-E"       "Turns off pylint style checking
let g:syntastic_cpp_checkers = ["gcc"]
let g:syntastic_cpp_gcc_args = "-std=c++11"     "Always use c++11

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => User Interface (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colorscheme
try
    let g:solarized_termcolors=256
    color solarized
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
set display=lastline            "Wrapped partial lines will display

if has('multi_byte')            "Set symbol for broken lines
    let &showbreak = '↳ '       "Display '↳ ' (u21B3)
else
    let &showbreak = '>> '      "Display '>> '
endif

set showmatch                   "Show matching parentheses
set matchtime=2                 "Length matched paren flashes (1/10ths sec)
set matchpairs=(:),{:},[:],<:>  "Chars in a balanced pair

set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary
set hidden                      "Hide unsaved buffers when switching

set tags=tags;/                 "Search up directory for ctags file

set autochdir                   "Vim's pwd is the file's basename

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Keyboard and Mappings (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tab now doubles as autocomplete
inoremap <Tab> <c-r>=TabOrAuto()<cr>
inoremap <S-Tab> <c-p>

"Quit in visual mode
vnoremap ZZ <esc>ZZ
vnoremap ZQ <esc>ZQ

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

"Set Y to match C and D
nnoremap Y y$

"Scrolling does not skip wrapped lines
noremap j gj
noremap k gk

"Use J and K to scroll by paragraphs
noremap J }
noremap K {

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

"Set space as leader
let mapleader = "\<space>"

"\ becomes local leader
let maplocalleader = "\\"

"Split a line at cursor. Delete any trailing whitespace this creates.
nnoremap <silent> <leader>s a<cr><esc>k:silent! s/\s\+$//<CR>$

"Join two lines together
nnoremap <leader>j J

"Fix Formatting and whitespace
noremap <silent> <Leader>f mm:keeppatterns %s/\s\+$//e<CR>:retab<CR>`m

"Paste mode toggle
noremap <Leader>p :set paste!<CR>

"Wraps toggle
noremap <leader>w :set wrap!<cr>

"Check Marks
nnoremap <leader>c A (✓)<esc>

"Number line toggle
noremap <silent> <leader>n :call ToggleNumber()<cr>

"Invisible chars toggle
noremap <leader>i :set list!<cr>
set listchars=tab:>-,space:_,eol:$

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
nnoremap <C-x> <esc>:nohlsearch<CR><C-l>

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

"Maintain highlight on visual mode indent
vnoremap < <gv
vnoremap > >gv

"Highlight trailing whitespace (regex)
highlight WhitespaceErrors ctermbg=DarkGray guibg=DarkGray
match WhitespaceErrors /\s\+$\|[^\t]\@<=\t\+/

" Load filetype-specific settings
augroup filetype
    autocmd!
    autocmd FileType make       call MakefileMode()
    autocmd Filetype markdown   call MarkdownMode()
    autocmd Filetype text       call MarkdownMode()
    autocmd Filetype python     call PyMode()
    autocmd FileType tex        call LatexMode()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Buffers, Windows, and Tabs (XXX)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow                  "Open new panes in bottom
set splitright                  "Open new panes to right

set showtabline=2               "Always show tabs list

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
    setlocal wrap     "Wrap text slightly over 80 char edge
    setlocal nonumber "Prettier for text files
endfunction

function! LatexMode()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal wrap
endfunction

function! PyMode()
    retab  "Clean up malformed indentation
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

"Toggle between number, relativenumber, and nonumber
function! ToggleNumber()
    if &number
        set nonumber
        set relativenumber
    elseif &relativenumber
        set norelativenumber
    else
        set number
    endif
endfunction

"EOF

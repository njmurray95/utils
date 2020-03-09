""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => General (XXX)

call plug#begin('~/.vim/plugged')

" Vim Syntax additions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'kshenoy/vim-signature'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"IDE Features
Plug 'dense-analysis/ale'

" Aesthetics
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'

call plug#end()

"Reload vimrc after editing
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

"Set persistent undo
set undofile

" TODO :h viminfo
set viminfo+=n$HOME/.vim/viminfo

"System clipboard -- copy-paste plays with other programs
set clipboard=unnamed

nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [b :bprev<cr>

nnoremap <silent> ]t :tabn<cr>
nnoremap <silent> [t :tabp<cr>

"Sane escape in term mode
tnoremap <Esc> <C-\><C-n>

"A + hjkl switches windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-h> <C-w>h
tnoremap <A-j> <C-w>j
tnoremap <A-k> <C-w>k
tnoremap <A-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Aesthetics (XXX)
"Cursor -- see :h cursor-style
set guicursor=a:block,a:blinkwait1000-blinkon1000-blinkoff100

color Monokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => User Interface (XXX)

set number                      "Show line numbers

set laststatus=0                "Hide Status line

set visualbell                  "Visual cues on errors
set cursorline                  "Highlight current line
set virtualedit=all             "Cursor can float over unwritten text

set mouse=nvc                   "Enable mouse on normal, visual, command
set scrolloff=4                 "Keep cursor 4 lines from edge
set sidescrolloff=4             "Don't scroll any closer left/right

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
set matchtime=2                 "Length matched paren flashes (1/10ths sec)
set matchpairs=(:),{:},[:],<:>  "Chars in a balanced pair

set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary
set hidden                      "Hide unsaved buffers when switching

set autochdir                   "Vim's pwd is the open file's basename

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Keyboard and Mappings (XXX)

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

"Set Y to match C and D
nnoremap Y y$

"Scrolling does not skip wrapped lines
noremap j gj
noremap k gk

"Saving when not sudo
cnoremap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Mappings

"Set space as leader
let mapleader = "\<space>"

"\ becomes local leader
let maplocalleader = "\\"

"Split a line at cursor. Delete any trailing whitespace this creates.
nnoremap <silent> <leader>s a<cr><esc>k:silent! s/\s\+$//<CR>$

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

"Replace smart quotes with quotes
noremap <silent> <leader>q :s/”/"/g<cr>:s/“/"/g<cr>:s/’/'/g<cr>

"Invisible chars toggle
noremap <leader>i :set list!<cr>
set listchars=tab:>-,space:_,eol:$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Search and Replace (XXX)

set ignorecase                  "Search ignores case
set smartcase                   "Search matches case on capital letters
set wrapscan                    "Search wraps around end of file
set hlsearch                    "Highlight search results

"Clear search results on redraw
nnoremap <leader>l <esc>:nohlsearch<CR><C-l>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Text and spacing (XXX)

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
    autocmd Filetype markdown   call TextMode()
    autocmd Filetype text       call TextMode()
    autocmd Filetype python     call PyMode()
    autocmd FileType tex        call TwoSpaceMode()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Buffers, Windows, and Tabs (XXX)

set splitbelow                  "Open new panes in bottom
set splitright                  "Open new panes to right

set showtabline=2               "Always show tabs list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Modes (XXX)

function! MakefileMode()
    " Make requires tab characters
    setlocal noexpandtab
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
endfunction

function! TextMode()
    setlocal wrap     "Wrap text slightly over 80 char edge
    setlocal nonumber "Prettier for text files
endfunction

function! TwoSpaceMode()
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

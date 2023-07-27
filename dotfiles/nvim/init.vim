""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => General (XXX)

" To install a new plugin, write the line
" And then call
" :PlugInstall
call plug#begin(stdpath('data') . '\plugged')

    " Vim Syntax additions
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'kshenoy/vim-signature'

    " FZF
    "Plug '/usr/local/opt/fzf'
    "Plug 'junegunn/fzf.vim'

    "IDE Features
    "Plug 'dense-analysis/ale'

    " Aesthetics
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'flazz/vim-colorschemes'

    " Filetypes
    Plug 'leafgarland/typescript-vim'

    " Status Line
    Plug 'vim-airline/vim-airline'

    " Line diff
    Plug 'AndrewRadev/linediff.vim'

call plug#end()

"Reload vimrc after editing
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

"Set persistent undo
set undofile

"System clipboard -- copy-paste plays with other programs
set clipboard=unnamedplus

nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [b :bprev<cr>

nnoremap <silent> ]j :tabn<cr>
nnoremap <silent> [j :tabp<cr>

"Sane escape in term mode
tnoremap <Esc> <C-\><C-n>

"Automatically enter insert mode in term
autocmd BufEnter term://* startinsert

"A + hjkl switches windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-h> <C-w>h
tnoremap <A-j> <C-w>j
tnoremap <A-k> <C-w>k
tnoremap <A-l> <C-w>l

set autochdir                   "Vim's pwd is the open file's basename

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Aesthetics (XXX)

"Cursor -- see :h cursor-style
set guicursor=a:block,a:blinkwait1000-blinkon1000-blinkoff100

colorscheme fahrenheit

highlight CursorLine guibg=#444454 ctermbg=grey 
highlight CursorColumn guibg=#444454 ctermbg=grey
highlight ColorColumn guibg=#444454 ctermbg=grey

set number                      "Show line numbers

set visualbell                  "Visual cues on errors
set cursorline                  "Highlight current line
set cursorcolumn
set virtualedit=all             "Cursor can float over unwritten text

set mouse=nvc                   "Enable mouse on normal, visual, command
set scrolloff=4                 "Keep cursor 4 lines from edge
set sidescrolloff=4             "Don't scroll any closer left/right

set wildmode=longest,list,full  "autocomplete longest, list all, cycle
set wildignore+=*.o,*.git,*.swp "filetypes for autocomplete to ignore

set nowrap                      "Wrap long lines
set linebreak                   "Wrap lines at words instead of letters

if has('multi_byte')            "Set symbol for broken lines
    let &showbreak = '? '       "Display '? ' (u21B3)
else
    let &showbreak = '>> '      "Display '>> '
endif

set showmatch                   "Show matching parentheses
set matchtime=2                 "Length matched paren flashes (1/10ths sec)
set matchpairs=(:),{:},[:],<:>  "Chars in a balanced pair

set timeoutlen=500              "Set timeout waiting for input (millisec)

set lazyredraw                  "Don't update display unless necessary
set hidden                      "Hide unsaved buffers when switching

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Keyboard and Mappings (XXX)

"Tab now doubles as autocomplete
inoremap <Tab> <c-r>=TabOrAuto()<cr>
inoremap <S-Tab> <c-p>

"Enter starts command line
noremap <Enter> :
noremap q<Enter> q:

"Fix Command Window enter
augroup enter
    autocmd!
    autocmd CmdwinEnter * noremap <Enter> <Enter>
    autocmd CmdwinLeave * noremap <Enter> :
augroup END

"Set Y to match C and D
nnoremap Y y$

"Scrolling does not skip wrapped lines
noremap j gj
noremap k gk

"Maintain highlight on visual mode indent
vnoremap < <gv
vnoremap > >gv

"Search visually selected region
vnoremap * y/<C-r>"<CR>

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
nnoremap <silent> <leader>p :call TogglePaste()<cr>

"Wraps toggle
noremap <leader>w :set wrap!<cr>

"Number line toggle
noremap <silent> <leader>n :call ToggleNumber()<cr>

"Replace smart quotes with quotes
noremap <silent> <leader>q :s//"/g<cr>:s//"/g<cr>:s//'/g<cr>

"Invisible chars toggle
noremap <leader>i :set list!<cr>
set listchars=tab:>-,space:_,eol:$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Search and Replace (XXX)

set ignorecase                  "Search ignores case
set smartcase                   "Search matches case on capital letters
set wrapscan                    "Search wraps around end of file
set hlsearch                    "Highlight search results
set noincsearch                 "Don't jump before search is completed

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

set autoindent                  "Copy current indent when new line starts

set colorcolumn=80              "Highlight column 81 for line breaks

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

"Buffer movements
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

nnoremap ]t <C-]>
nnoremap [t <C-t>
nnoremap ]g g]

"Compile errors
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Augroups
augroup filetype
    autocmd!
    autocmd BufEnter *wscript* :setlocal filetype=python
    autocmd Filetype yaml call TwoSpaceMode()
    autocmd Filetype iss call TwoSpaceMode()
    autocmd Filetype html call TwoSpaceMode()
    autocmd Filetype javascript call TwoSpaceMode()
    autocmd Filetype json call TwoSpaceMode()
    autocmd Filetype text call PlainMode()
    autocmd Filetype make call MakefileMode()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   => Functions (XXX)

" Return <C-n> for autocomplete on words, tab otherwise
function! TabOrAuto()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<C-n>"
    endif
endfunction

"number -> relativenumber -> nonumber -> number
function! ToggleNumber()
    if &number
        set nonumber
        set relativenumber
    elseif &relativenumber
        set nonumber
        set norelativenumber
    else
        set number
        set norelativenumber
    endif
endfunction

"Enable Putty to copy/paste without mouse when in paste mode
function! TogglePaste()
    if &paste
        set nopaste
        set mouse=cnv
        set number
        echo "Paste off."
    else
        set paste
        set mouse=
        set nonumber
        echo "Paste on!"
    endif
endfunction

function! TwoSpaceMode()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2
endfunction

function! PlainMode()
    setlocal colorcolumn=0
    setlocal nocursorcolumn
endfunction

function! MakefileMode()
    " Make requires tab characters
    setlocal noexpandtab
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
endfunction

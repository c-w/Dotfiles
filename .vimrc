" Line numbers, syntax highlighting, UI
set number
syntax on
set cursorline
set showmatch
set textwidth=80
if exists('+colorcolumn')
    set colorcolumn=+1
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Change filetype-syntax highlighting from defaults
au BufNewFile,BufRead *.pl setlocal ft=prolog

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on

" Search options
set incsearch
set hlsearch
set ignorecase

" Navigation fixes
set backspace=indent,eol,start
set scrolloff=3
set scrolljump=6
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap jj <Esc>
inoremap kk <Esc>
inoremap kj <Esc>
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
vnoremap < <gv
vnoremap > >gv

" Consistency fixes
noremap Y y$

" Prevent auto-created files from cluttering working directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

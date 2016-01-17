source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Line numbers, syntax highlighting, UI
set number
syntax on
set cursorline
set showmatch
set textwidth=80
if exists('+colorcolumn')
    set colorcolumn=+1
elseif exists('matchadd')
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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
nnoremap j gj
nnoremap k gk
vnoremap < <gv
vnoremap > >gv
set autochdir

" More natural splitting
set splitright
set splitbelow
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
au VimResized * wincmd =

" Consistency fixes
noremap Y y$
nnoremap Q <NOP>

" Keep backups but prevent auto-created files from cluttering working directory
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Strip trailing whitespace
fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()

" File-type specific modifications
au BufRead,BufNewFile *.js set tabstop=2
au BufRead,BufNewFile *.js set softtabstop=2
au BufRead,BufNewFile *.js set shiftwidth=2
au BufRead,BufNewFile *.py set textwidth=79
au BufRead,BufNewFile *.tsv set textwidth=99999
au FileType gitcommit set textwidth=72 | set spell | set colorcolumn=50

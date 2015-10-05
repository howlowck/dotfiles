set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'matthewtodd/vim-twilight'
Bundle 'nanotech/jellybeans.vim'

" autocmd VimEnter * CtrlP ~/www

filetype plugin indent on     " required
"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

syntax on

set t_Co=256
colorscheme jellybeans

" disable bells
set noeb vb t_vb=

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" CtrlP
nnoremap <silent> p :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

"Show line numbers
set number

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Map escape key to jj
imap jj <esc>

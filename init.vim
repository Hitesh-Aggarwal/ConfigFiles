set number relativenumber
set shiftwidth=4
set expandtab
set smartindent
set tabstop=4
set nofoldenable
set foldlevel=1
set softtabstop=4
set termguicolors
set undofile
set undodir=$HOME/.local/share/nvim/undofiles//
set nobackup
set noswapfile
set scrolloff=8
set incsearch
set hlsearch
set mouse=a

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'itchyny/lightline.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax enable
colorscheme dracula

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let NERDTreeQuitOnOpen=1

let mapleader = ";"
nnoremap <leader>n :NERDTreeToggle<CR>
inoremap <TAB> <C-P>
inoremap <C-P> <TAB>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

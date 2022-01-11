"SETTINGS
set number relativenumber
set confirm
set cursorline
set ignorecase
set smartcase
set shiftwidth=4
set expandtab
set smartindent
set tabstop=4
set nofoldenable
set foldmethod=indent
set foldlevel=1
set softtabstop=4
set termguicolors
set undofile
set undodir=$HOME/.local/share/nvim/undofiles//
set nobackup
set noswapfile
set scrolloff=8
set incsearch
set nohlsearch
set mouse=a

"PLUGINS
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'itchyny/lightline.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

"SETTING MY COLORSCHEME
syntax enable
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ }

"NERDCOMMENTER SETTINGS
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let NERDTreeQuitOnOpen=1

"KEYBINDINGS
let mapleader = ";"
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
inoremap <TAB> <C-P>
inoremap <C-P> <TAB>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

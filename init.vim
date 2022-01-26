"     __  ___                 _                    
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__  
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/  
"        /____/                                    

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
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'gruvbox-community/gruvbox'
call plug#end()

"SETTING MY COLORSCHEME
syntax enable
let g:gruvbox_italic=1
colorscheme gruvbox
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

"NERDCOMMENTER SETTINGS
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"KEYBINDINGS
let mapleader = ";"
nnoremap j gj
nnoremap k gk
inoremap <TAB> <C-P>
inoremap <C-P> <TAB>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :Rg<CR>

"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

set number relativenumber
set confirm
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nofoldenable
set foldmethod=indent
set foldlevel=1
set termguicolors
set undofile
set undodir=$HOME/.local/share/nvim/undofiles//
set nobackup
set noswapfile
set scrolloff=8
set incsearch
set nohlsearch
set mouse=a
set splitbelow splitright

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'gruvbox-community/gruvbox'
call plug#end()

syntax enable
let g:afterglow_italic_comments=1
let g:gruvbox_italic=1
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

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

autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e

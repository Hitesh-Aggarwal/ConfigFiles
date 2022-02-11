"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
set number relativenumber
set clipboard+=unnamedplus
set nowrap
set confirm
set colorcolumn=80
set incsearch
set nohlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set foldenable
set foldmethod=expr
set foldlevel=1
set foldexpr=nvim_treesitter#foldexpr()
set termguicolors
set undofile
set undodir=$HOME/.local/share/nvim/undofiles//
"set undodir=C:\Users\Horse\\AppData\Local\nvim-data\undofiles\\
set nobackup
set noswapfile
set scrolloff=8
set mouse=a
set splitbelow splitright
" ################################################

" ################### PLUGINS ####################
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'EdenEast/nightfox.nvim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'mhinz/vim-startify'
    Plug 'windwp/nvim-autopairs'
    Plug 'numToStr/Comment.nvim'
    Plug 'itchyny/lightline.vim'
    Plug 'godlygeek/tabular'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'preservim/nerdtree'
call plug#end()
" ################################################

" ################# LUA STUFF ####################
lua require('nvim-autopairs').setup{}
lua require('telescope').setup()
lua require('Comment').setup()

lua << EOF
require 'colorizer'.setup ({
    '*';
    css        = { RRGGBBAA = true; names = true };
    javascript = { RRGGBBAA = true; };
    html       = { RRGGBBAA = true; };
    },{ rgb_fn = true; names = false; })
EOF

"lua require 'nvim-treesitter.install'.compilers = { "clang" }
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained",
  -- sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
EOF
" #################################################

" ############### OTHERS SETTINGS #################

let g:NERDTreeMouseMode = 3
let g:NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeDirArrowExpandable = "+"
let g:lightline = {
      \ 'colorscheme': 'nightfox',
      \ }
syntax enable
colorscheme nordfox
" ################################################


" ################## KEYBINDINGS #################

" Set the leader key to ";"
let mapleader = ";"

" Autocomplete with TAB
inoremap <expr> <Tab>       pumvisible() ? "\<C-y>" : "\<Tab>"

" Easy window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Cursor stays in centre while moving through searches
nnoremap n nzzzv
nnoremap N Nzzzv

" Set undobreaks at ",.!?"
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Move lines up and down with ALT-j and ALT-k and ALT-UP and ALT-DOWN
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
inoremap <m-j> <esc>:m .+1<CR>==i
inoremap <m-k> <esc>:m .-2<CR>==i
nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==
vnoremap <m-Down> :m '>+1<CR>gv=gv
vnoremap <m-Up> :m '<-2<CR>gv=gv
inoremap <m-Down> <esc>:m .+1<CR>==i
inoremap <m-Up> <esc>:m .-2<CR>==i
nnoremap <m-Down> :m .+1<CR>==
nnoremap <m-Up> :m .-2<CR>==

" Commands for telescope
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>a :Telescope find_files hidden=true<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>t :Telescope treesitter<CR>
nnoremap <leader>l :Telescope live_grep<CR>
nnoremap <leader>o :Telescope oldfiles<CR>
nnoremap <leader>g :Telescope grep_string<CR>
nnoremap <leader>h :Telescope help_tags<CR>

" Other commands
nnoremap <leader>nn :NERDTree<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>na :NERDTreeFind<CR>

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree D:\Documents/ | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
 autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" ################################################

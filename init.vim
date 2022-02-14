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
set colorcolumn=120
set incsearch
set nohlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
set sidescrolloff=16
set mouse=a
set splitbelow splitright
" ################################################

" ################### PLUGINS ####################
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'EdenEast/nightfox.nvim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'mhinz/vim-startify'
    Plug 'windwp/nvim-autopairs'
    Plug 'numToStr/Comment.nvim'
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
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
  },
}
EOF

lua << EOF
require 'colorizer'.setup ({
    '*';
    },{ css = true; css_fn = true })
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
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowCollapsible = "-"
let g:NERDTreeDirArrowExpandable = "+"
"let g:startify_bookmarks = [ {'c': '~\AppData\Local\nvim\init.vim' }]
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim' }]
let g:startify_change_to_dir = 0
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }
syntax enable
colorscheme dracula
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

" Easy window resizing
nnoremap <C-Up> :vertical resize +2<CR>
nnoremap <C-Down> :vertical resize -2<CR>
nnoremap <C-Right> :resize +2<CR>
nnoremap <C-Left> :resize -2<CR>

" Easy window moving
nnoremap <m-h> <C-w>H
nnoremap <m-j> <C-w>J
nnoremap <m-k> <C-w>K
nnoremap <m-l> <C-w>L

" Move lines up and down with ALT-UP and ALT-DOWN
vnoremap <m-Down> :m '>+1<CR>gv=gv
vnoremap <m-Up> :m '<-2<CR>gv=gv
inoremap <m-Down> <esc>:m .+1<CR>==i
inoremap <m-Up> <esc>:m .-2<CR>==i
nnoremap <m-Down> :m .+1<CR>==
nnoremap <m-Up> :m .-2<CR>==

" Commands for telescope
nnoremap <leader>f :lua require("telescope.builtin").find_files()<CR>
nnoremap <leader>b :lua require("telescope.builtin").buffers()<CR>
nnoremap <leader>t :lua require("telescope.builtin").treesitter()<CR>
nnoremap <leader>l :lua require("telescope.builtin").live_grep()<CR>
nnoremap <leader>o :lua require("telescope.builtin").oldfiles()<CR>
nnoremap <leader>g :lua require("telescope.builtin").grep_string()<CR>
nnoremap <leader>h :lua require("telescope.builtin").help_tags()<CR>

" Nerd Tree commands
nnoremap <leader>n :NERDTreeFind<CR>

" Go to next and previous files easily
nnoremap <C-n> :next<CR>
nnoremap <C-p> :previous<CR>

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
" ################################################

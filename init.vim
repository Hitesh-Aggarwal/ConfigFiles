"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
set number relativenumber
set autochdir
set confirm
set colorcolumn=80
set textwidth=79
set incsearch
set nohlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nofoldenable
set foldmethod=expr
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
    Plug 'windwp/nvim-autopairs'
    Plug 'vimwiki/vimwiki'
    Plug 'goolord/alpha-nvim'
    Plug 'numToStr/Comment.nvim'
    Plug 'godlygeek/tabular'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'marko-cerovac/material.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
" ################################################

" ################# LUA STUFF ####################
lua require'alpha'.setup(require'alpha.themes.startify'.config)
lua require'nvim-tree'.setup()
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

lua << EOF
require('lualine').setup {
    options = {
        theme = 'tokyonight'
        }
    }
EOF

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
let g:tokyonight_style='night'
let g:tokyonight_lualine_bold = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_respect_buf_cwd = 1
let g:vimwiki_list = [{'path': 'D:\Documents\vimwiki\',
            \ 'path_html': 'D:\Documents\vimwikihtml\'}]
syntax enable
colorscheme tokyonight
" ################################################


" ################## KEYBINDINGS #################

" Set the leader key to ";"
let mapleader = ";"

" Autocomplete with tab
inoremap <TAB> <C-P>
inoremap <C-P> <TAB>

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

" Move lines up and down with ALT-j and ALT-k
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
inoremap <m-j> <esc>:m .+1<CR>==i
inoremap <m-k> <esc>:m .-2<CR>==i
nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==

" Commands for telescope
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>a :Telescope find_files hidden=true<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>t :Telescope treesitter<CR>
nnoremap <leader>l :Telescope live_grep<CR>
nnoremap <leader>o :Telescope oldfiles<CR>
nnoremap <leader>g :Telescope grep_string<CR>
nnoremap <leader>h :Telescope help_tags<CR>

" Commands for plugins
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>d :bwipe

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
" ################################################

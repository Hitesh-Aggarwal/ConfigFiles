"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
set number relativenumber
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
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set termguicolors
set undofile
set undodir=$HOME/.local/share/nvim/undofiles//
set nobackup
set noswapfile
set scrolloff=8
set mouse=a
set nowrap
set splitbelow splitright
" ################################################

" ################### PLUGINS ####################
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'windwp/nvim-autopairs'
    Plug 'goolord/alpha-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'marko-cerovac/material.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
" ################################################

" ################# LUA STUFF ####################
lua require'colorizer'.setup()
lua require'alpha'.setup(require'alpha.themes.startify'.config)
lua require'nvim-tree'.setup()
lua require('nvim-autopairs').setup{}
lua require('telescope').setup()
lua require('telescope').load_extension('fzy_native')

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
  },
  indent = {
      enable = true
      }
}
EOF
" #################################################

" #################### OTHERS #####################
let g:tokyonight_style='night'
let g:tokyonight_lualine_bold = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_respect_buf_cwd = 1
syntax enable
colorscheme tokyonight

let mapleader = ";"
nnoremap j gj
nnoremap k gk
inoremap <TAB> <C-P>
inoremap <C-P> <TAB>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>a :Telescope find_files hidden=true<CR>
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>t :Telescope treesitter<CR>
nnoremap <leader>h :Telescope live_grep<CR>
nnoremap <leader>o :Telescope oldfiles<CR>
nnoremap <leader>d :bwipe

autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
" ################################################

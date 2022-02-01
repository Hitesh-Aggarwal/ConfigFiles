"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
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
" ################################################

" ################### PLUGINS ####################
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'windwp/nvim-autopairs'
    Plug 'sunjon/shade.nvim'
    Plug 'goolord/alpha-nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'tjdevries/colorbuddy.vim'
    Plug 'Th3Whit3Wolf/onebuddy'
    Plug 'marko-cerovac/material.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()
" ################################################

" ################# LUA STUFF ####################

lua require'colorizer'.setup()
lua require'alpha'.setup(require'alpha.themes.startify'.config)
lua require'nvim-tree'.setup()
lua require('nvim-autopairs').setup{}

lua << EOF
require'shade'.setup({
overlay_opacity = 50,
opacity_step = 1,
keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
    }
})
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
  },
}
EOF

" #################################################

" #################### OTHERS #####################
let g:tokyonight_style='night'
let g:tokyonight_italic_comments=1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_add_trailing = 1
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
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :Rg<CR>
nnoremap <leader>n :NvimTreeToggle<CR>

autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
" ################################################

"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
set number
set nowrap
set confirm
set incsearch
set nohlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'vim-scripts/AutoComplPop'
    Plug 'windwp/nvim-autopairs'
    Plug 'preservim/nerdcommenter'
call plug#end()
" ################################################

" ################# LUA STUFF ####################
lua require('nvim-autopairs').setup{}

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyonight',
  },
}
EOF

" #################################################

" ############### OTHERS SETTINGS #################

syntax enable
colorscheme tokyonight
" ################################################

" ################## KEYBINDINGS #################

" Set the leader key to ";"
let mapleader = ";"

" Autocomplete with TAB
inoremap <tab> <c-y>
inoremap <c-y> <tab>

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
nnoremap <m-left> <C-w>H
nnoremap <m-down> <C-w>J
nnoremap <m-up> <C-w>K
nnoremap <m-right> <C-w>L

" Move lines up and down with ALT-k and ALT-j
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
inoremap <m-j> <esc>:m .+1<CR>==i
inoremap <m-k> <esc>:m .-2<CR>==i
nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==

" Go to next and previous buffers easily
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Quickly open config file
"nnoremap <leader>c :e ~\AppData\Local\nvim\init.vim<CR>
nnoremap <leader>c :e ~/.config/nvim/init.vim<CR>

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

au BufNewFile *.c 0r ~/.config/nvim/skel/c.skel
au BufNewFile *.cpp 0r ~/.config/nvim/skel/cpp.skel
au BufNewFile *.html 0r ~/.config/nvim/skel/html.skel
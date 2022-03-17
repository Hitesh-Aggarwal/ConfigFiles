"     __  ___                 _
"    /  |/  /_  __     _   __(_)___ ___  __________
"   / /|_/ / / / /    | | / / / __ `__ \/ ___/ ___/
"  / /  / / /_/ /     | |/ / / / / / / / /  / /__
" /_/  /_/\__, /      |___/_/_/ /_/ /_/_/   \___/
"        /____/

" ################### SETTINGS ###################
set number
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
set foldmethod=indent
set foldlevel=100
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
    Plug 'sainnhe/sonokai'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'windwp/nvim-autopairs'
call plug#end()
" ################################################

" ################# LUA STUFF ####################
lua require('nvim-autopairs').setup{}

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'sonokai',
  },
}
EOF

" #################################################

" ############### OTHERS SETTINGS #################

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
syntax enable
colorscheme sonokai
" ################################################

" ################## KEYBINDINGS #################

" Set the leader key to ";"
let mapleader = ";"

" Autocomplete with TAB
inoremap <C-p> <TAB>
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-P>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

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

" Go to next and previous buffers easily
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Quickly open config file
nnoremap <leader>c :e ~\AppData\Local\nvim\init.vim<CR>

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
" ################################################

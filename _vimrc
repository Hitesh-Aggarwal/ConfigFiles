if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set number
set autochdir
set hidden
set guioptions-=m
set guioptions-=T
set guifont=Hack:h12:cANSI:qDRAFT
set path+=**
set nowrap
set confirm
set incsearch
set nohlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=0
set expandtab
set termguicolors
set cursorline
set undofile
set undodir=C:\Users\Horse\vimfiles\undofiles\\
set nobackup
set noswapfile
set scrolloff=8
set sidescrolloff=16
set mouse=a
set splitbelow splitright

syntax enable
set background=light
colorscheme solarized8_high

" ################## KEYBINDINGS #################

" Set the leader key to ";"
let mapleader = ";"

" Autocomplete with TAB
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
nnoremap <leader>c :e ~\_vimrc<CR>

" ################################################

" ################ AUTOCOMMANDS ##################
autocmd BufRead,BufNewFile *.gawk set filetype=awk
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

cd D:\Documents\
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END

au BufNewFile *.c 0r ~\vimfiles\skel\c.skel
au BufNewFile *.cpp 0r ~\vimfiles\skel\cpp.skel
au BufNewFile *.html 0r ~\vimfiles\skel\html.skel

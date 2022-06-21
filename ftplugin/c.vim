nnoremap <leader>r :w<CR>:!gcc <C-R>% -o out/<C-R>%<BS><BS> && ./out/<C-R>%<BS><BS><CR>
nnoremap <leader>t :w<CR>:term gcc <C-R>% -o out/<C-R>%<BS><BS> && ./out/<C-R>%<BS><BS><CR>
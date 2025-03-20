
set relativenumber
hi VertSplit cterm=NONE ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE guibg=NONE cterm=NONE
set fillchars+=vert:\ 
set tabstop=3
set shiftwidth=3
set expandtab
set smartindent

imap jk <ESC>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nmap <leader>z :vsplit<CR>
nmap <leader>x :split<CR>
nmap <leader>v <C-w>o
nmap <C-UP> <cmd>resize +2<CR>
nmap <C-DOWN> <cmd>resize -2<CR>
nmap <C-LEFT> <cmd>vertical resize +2<CR>
nmap <C-RIGHT> <cmd>vertical resize -2<CR>



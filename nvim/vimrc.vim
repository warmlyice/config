syntax on
set number
set encoding=UTF-8

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype plugin indent on




let mapleader = ","

noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>Q :qa<CR>
noremap <Leader>h <C-w>h
noremap <Leader>l <C-w>l
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
nnoremap <silent> <leader>c} V}:call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call nerdcommenter#Comment('x', 'toggle')<CR>



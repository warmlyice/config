syntax on
set number
" 设置 Vim 内部使用 utf-8
set encoding=utf-8
" 自动识别文件编码，并按顺序检测
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" 设置终端屏幕使用的编码
" set termencoding=utf-8
" 设置新文件保存的编码
set fileencoding=utf-8

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



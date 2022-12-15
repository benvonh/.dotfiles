" ------------------------------------------------------------------------------
"                                   SET OPTIONS
" ------------------------------------------------------------------------------

" editor
set number
set nowrap
set confirm
set mouse=a
set scrolloff=8

" visuals
set visualbell
set termguicolors
set signcolumn=yes
set colorcolumn=81

" search
set incsearch
set nohlsearch

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" indentation
set shiftround
set autoindent
set smartindent

" backup
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" others
set hidden
set completeopt=menu,menuone,noselect

" ------------------------------------------------------------------------------
"                                   KEY MAPPINGS
" ------------------------------------------------------------------------------

" exit insert mode
inoremap kk <esc>

" paste without yank
vnoremap p "_dP

" clear line
nnoremap <c-x> 120x

" centre after motion
nnoremap n nzz
nnoremap N Nzz
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

" move between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" swap between panes
nnoremap <a-h> <c-w>H
nnoremap <a-j> <c-w>J
nnoremap <a-k> <c-w>K
nnoremap <a-l> <c-w>L

" leader
let mapleader=' '

" basic commands
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>x <cmd>x<cr>
nnoremap <leader>s <cmd>wa<cr>
nnoremap <leader>c <cmd>qa<cr>
nnoremap <leader>z <cmd>wa<cr> <cmd>qa<cr>
nnoremap <leader>q <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

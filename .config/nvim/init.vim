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

" move panes
nnoremap <a-h> <c-w>H
nnoremap <a-j> <c-w>J
nnoremap <a-k> <c-w>K
nnoremap <a-l> <c-w>L

" resize panes
nnoremap <c-left>  <c-w>>
nnoremap <c-down>  <c-w>+
nnoremap <c-up>    <c-w>-
nnoremap <c-right> <c-w><

" leader
let mapleader=' '

" basic commands
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>a <cmd>q<cr>
nnoremap <leader>x <cmd>x<cr>
nnoremap <leader>s <cmd>wa<cr>
nnoremap <leader>c <cmd>qa<cr>
nnoremap <leader>z <cmd>wa<cr> <cmd>qa<cr>
nnoremap <leader>q <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

" nvim tree
nnoremap <leader>e <cmd>NvimTreeToggle<cr>
nnoremap <leader>f <cmd>NvimTreeFindFile<cr>

" telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

" LSP
nnoremap <leader>r <cmd>LspRestart<cr>
nnoremap <leader>d <cmd>TroubleToggle<cr>

" mason
nnoremap <leader>m <cmd>Mason<cr>

" ------------------------------------------------------------------------------
"                                   VIM PLUGINS
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

    " colour scheme
    Plug 'navarasu/onedark.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " which key
    Plug 'folke/which-key.nvim'

    " markdown previewer
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " file explorer
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'

    " terminal
    Plug 'akinsho/toggleterm.nvim', { 'tag': '*' }

    " sessions
    Plug 'rmagatti/auto-session'

    " comments
    Plug 'numToStr/Comment.nvim'

    " indenting
    Plug 'Yggdroot/indentLine'

    " telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " tree sitter
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " snippet
    Plug 'L3MON4D3/LuaSnip', { 'tag': 'v1.1.0' }
    Plug 'saadparwaiz1/cmp_luasnip'

    " completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'

    " LSP
    Plug 'folke/trouble.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'mfussenegger/nvim-dap'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'

    " status bar
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
    Plug 'nvim-lualine/lualine.nvim'

call plug#end()

" default colour scheme
colorscheme catppuccin

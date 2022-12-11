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

" moving between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" leader
let mapleader=' '

" basic commands
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>x <cmd>x<cr>
nnoremap <leader>s <cmd>wa<cr>
nnoremap <leader>c <cmd>qa<cr>
nnoremap <leader>z <cmd>wa<cr> <cmd>qa<cr>
nnoremap <leader>q <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

" vim-plug
nnoremap <leader>o <cmd>so%<cr>
nnoremap <leader>u <cmd>PlugInstall<cr> <cmd>PlugUpdate<cr>

" nvim tree
nnoremap <leader>e  <cmd>NvimTreeToggle<cr>
nnoremap <leader>te <cmd>NvimTreeFocus<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>
nnoremap <leader>tc <cmd>NvimTreeCollapse<cr>

" telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" trouble diagnostics
nnoremap <leader>d <cmd>TroubleToggle<cr>

" mason
nnoremap <leader>m <cmd>Mason<cr>

" ------------------------------------------------------------------------------
"                                   VIM PLUGINS
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

    " colour scheme
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'navarasu/onedark.nvim'

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

    " telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " snippet
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip', { 'tag': 'v1.1.0' }

    " completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " LSP
    Plug 'folke/trouble.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " status bar
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

call plug#end()

" Default colour scheme
colorscheme catppuccin

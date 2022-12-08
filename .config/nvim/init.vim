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
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>c :wa<cr> :qa<cr>

" nvim tree
nnoremap <leader>e <cmd>NvimTreeToggle<cr>
nnoremap <leader>f <cmd>NvimTreeFindFile<cr>

" telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" ------------------------------------------------------------------------------
"                                   VIM PLUGINS
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

    " colour scheme
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " dashboard
    Plug 'glepnir/dashboard-nvim'

    " markdown previewer
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " file explorer
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'

    " telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " LSP
    Plug 'folke/trouble.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " snippet
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip', { 'tag': 'v1.1.0' }

    " status bar
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

    " terminal
    Plug 'akinsho/toggleterm.nvim', { 'tag': '*' }

call plug#end()

colorscheme catppuccin

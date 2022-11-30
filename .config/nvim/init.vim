" -----------
" SET OPTIONS
" -----------

" editor
set number
set nowrap
set confirm
set mouse=a
set scrolloff=10

" visuals
set visualbell
set termguicolors
set signcolumn=yes
set colorcolumn=120

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
"set filetype

" backup
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" others
set completeopt=menu,menuone,noselect

" -----------
" KEY MAPPING
" -----------

" exit insert mode
inoremap kk <esc>

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
nnoremap <leader>q :q!<cr>
nnoremap <leader>s :xa<cr>
nnoremap <leader>l :qa!<cr>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim tree
noremap <leader>t  <cmd>NvimTreeToggle<cr>
noremap <leader>tf <cmd>NvimTreeFindFile<cr>

" --------------
" NEOVIM PLUGINS
" --------------

call plug#begin('~/.vim/plugged')

    " colour scheme
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " dashboard
    Plug 'glepnir/dashboard-nvim'

    " file explorer
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'

    " search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

    " LSP
    Plug 'folke/trouble.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

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

call plug#end()

colorscheme catppuccin

call plug#begin('~/.vim/plugged')

    " colour scheme
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " dashboard
    Plug 'glepnir/dashboard-nvim'

    " file explorer
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'

    " file searching 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " tool manager
    Plug 'mfussenegger/nvim-dap'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

call plug#end()

colorscheme catppuccin

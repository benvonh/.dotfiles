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

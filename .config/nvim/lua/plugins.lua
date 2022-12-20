return require('packer').startup(function(use)

    -- packer
    use 'wbthomason/packer.nvim'

    -- colour scheme
    use 'navarasu/onedark.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- which key
    use 'folke/which-key.nvim'

    -- markdown previewer
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

    -- file explorer
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    -- terminal
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- sessions
    use 'rmagatti/auto-session'
    use 'rmagatti/session-lens'

    -- better coding
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- plenaries
    use 'nvim-lua/plenary.nvim'
    use 'tanvirtin/vgit.nvim'
    use 'ThePrimeagen/harpoon'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }

    -- tree sitter
    use 'p00f/nvim-ts-rainbow'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- snippet
    use { 'L3MON4D3/LuaSnip', tag = 'v1.1.0' }
    use 'saadparwaiz1/cmp_luasnip'

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- LSP
    use 'folke/trouble.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'neovim/nvim-lspconfig'
    use 'VonHeikemen/lsp-zero.nvim'
    use 'mfussenegger/nvim-dap'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- status bar
    use { 'akinsho/bufferline.nvim', tag = 'v3.*' }
    use 'nvim-lualine/lualine.nvim'

    -- scroll bar
    use 'petertriho/nvim-scrollbar'

end)

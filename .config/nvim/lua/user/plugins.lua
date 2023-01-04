local fn = vim.fn

-- automatic packer install
local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        packer_path
    })
    print('Installing packer...')
    vim.cmd('packadd packer.nvim')
end

-- initialise packer
local ok, packer = pcall(require, 'packer')

if not ok then
    print('Failed to find packer')
    return
end

packer.init({
    max_jobs = 8,
    display = {
        prompt_border = 'rounded',
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

-- manage plugins
return packer.startup(function(use)

    -- packer
    use 'wbthomason/packer.nvim'

    -- colour scheme
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- file explorer
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' } }

    -- telescope
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' } }

    -- lsp + cmp
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- completion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }

    -- tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = '<cmd>TSUpdate<cr>' }

    -- key binding
    use 'folke/which-key.nvim'

    -- bootstrap
    if PACKER_BOOTSTRAP then
        packer.sync()
    end

end)

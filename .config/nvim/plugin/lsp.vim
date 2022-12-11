lua << EOF

-- nvim-cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<c-b>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.abort(),
        ['<tab>'] = cmp.mapping.confirm({ select = false }),
        ['<c-space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- mason
require('mason').setup()

-- mason-lspconfig
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',       -- C/C++
        'cmake',        -- CMake
        'pyright',      -- Python
        'bashls',       -- Bash
        'grammarly',    -- Markdown & Latex
        'sumneko_lua'   -- Lua
    },
    automatic_installation = true
})

-- lspconfig
local on_attach = function(client, bufnr)

    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<c-s>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gF', function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

require('lspconfig')['clangd'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require('lspconfig')['cmake'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require('lspconfig')['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require('lspconfig')['bashls'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require('lspconfig')['grammarly'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require('lspconfig')['sumneko_lua'].setup({
    on_attach = on_attach,
    capabilities = capabilities
})

EOF

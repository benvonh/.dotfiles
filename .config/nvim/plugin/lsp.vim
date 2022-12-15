lua << EOF

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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

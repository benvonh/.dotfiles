lua << EOF

require('catppuccin').setup({
    integrations = {
        cmp = true,
        mason = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        lsp_trouble = true,
        dap = {
            enabled = true,
            enable_ui = true
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            }
        }
    }
})

EOF

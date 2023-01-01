-- tomorrow
require('tomorrow').setup({
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = { 'italic' },
        keywords = {},
        strings = { 'bold' },
        variables = {},
        numbers = { 'bold' },
        booleans = { 'bold' },
        properties = { 'bold' },
        types = {},
        operators = {}
    },
    integrations = {
        cmp = true,
        mason = true,
        noice = true,
        notify = true,
        harpoon = true,
        nvimtree = true,
        telescope = true,
        which_key = true,
        ts_rainbow = true,
        treesitter = true,
        lsp_trouble = true,
        dap = {
            enabled = true,
            enable_ui = true
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { 'italic' },
                hints = { 'italic' },
                warnings = { 'italic' },
                information = { 'italic' }
            },
            underlines = {
                errors = { 'underline' },
                hints = { 'underline' },
                warnings = { 'underline' },
                information = { 'underline' }
            }
        }
    }
})

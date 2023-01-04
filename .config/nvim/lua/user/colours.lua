local ok, cat = pcall(require, 'catppuccin')

if not ok then
    print('Failed to find catppuccin')
    return
end

cat.setup({
    styles = {
        comments = { 'italic' },
        conditionals = {},
        loops = {},
        functions = { 'italic' },
        keywords = {},
        strings = { 'bold' },
        variables = {},
        numbers = { 'bold' },
        booleans = { 'bold' },
        properties = {},
        types = {},
        operators = { 'italic' },
    },
    color_overrides = {
        mocha = { pink = '#FAB387' },
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
    },
})

local ok, tree = pcall(require, 'nvim-tree')

if not ok then
    print('Failed to find nvim-tree')
    return
end

tree.setup({
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
        mappings = {
            list = {
                { key = 'u', action = 'dir_up' },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = 'after',
            show = { folder_arrow = false },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    git = {
        ignore = false,
    },
})

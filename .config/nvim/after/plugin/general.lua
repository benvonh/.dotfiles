-- file explorer
require('nvim-tree').setup()

-- terminal
require('toggleterm').setup({
    open_mapping = [[<space-t>]],
    direction = 'horizontal',
    size = 24
    -- float_opts = {
    --     border = 'curved',
    --     height = 32,
    --     width = 128
    -- }
})

-- sessions
require('auto-session').setup({
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = true
})

-- better coding
require('nvim-autopairs').setup()

require('Comment').setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false }
})

require('indent_blankline').setup({
    show_current_context = true,
    show_current_context_start = true
})

-- status bar
require('bufferline').setup()

require('lualine').setup({
    extensions = { 'nvim-tree' },
    options = { theme = 'catppuccin' }
})

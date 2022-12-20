-- file explorer
local function nvim_tree_window_config()
    local vim_w = vim.api.nvim_get_option('columns')
    local vim_h = vim.api.nvim_get_option('lines')
    local w = vim_w / 2
    local h = vim_h / 2
    local x = vim_w / 2 - w / 2
    local y = vim_h / 2 - h / 2

    return {
        relative = 'editor',
        border = 'rounded',
        width = w,
        height = h,
        row = y,
        col = x
    }
end

require('nvim-tree').setup({
    view = {
        float = {
            enable = true,
            open_win_config = nvim_tree_window_config
        }
    },
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_open = '',
                    arrow_closed = ''
                }
            }
        }
    }
})

-- terminal
require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'horizontal',
    size = 24
    -- float_opts = {
    --     border = 'curved',
    --     height = 32,
    --     width = 128
    -- }
})

function _G.set_terminal_keybinding()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<c-h>', [[<cmd>wincmd h<cr>]], opts)
    vim.keymap.set('t', '<c-j>', [[<cmd>wincmd j<cr>]], opts)
    vim.keymap.set('t', '<c-k>', [[<cmd>wincmd k<cr>]], opts)
    vim.keymap.set('t', '<c-l>', [[<cmd>wincmd l<cr>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keybinding()')

-- sessions
require('auto-session').setup({
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = false,
    auto_session_create_enabled = false
})

require('session-lens').setup({
    theme_conf = { border = true }
})

-- better coding
require('nvim-autopairs').setup()

require('Comment').setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false }
})

require('indent_blankline').setup({
    -- use_treesitter = true,
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = false
})

-- plenaries
require('vgit').setup()
require('telescope').load_extension('session-lens')


-- tree sitter
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
})

-- status bar
require('bufferline').setup({
    options = {
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
    }
})

local function session_name()
    return 'Session: ' .. require('auto-session-library').current_session_name()
end

require('lualine').setup({
    options = { theme = 'catppuccin' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename', 'diagnostics' },
        lualine_x = { 'filesize', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { session_name }
    },
    inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename', 'diagnostics' },
        lualine_x = { 'filesize', 'filetype' },
        lualine_y = { },
        lualine_z = { }
    },
    extensions = { 'nvim-tree' }
})

-- scroll bar
require('scrollbar').setup({
    handle = {
        color = '#585B70'
    }
})

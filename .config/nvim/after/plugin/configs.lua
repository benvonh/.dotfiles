-- file explorer
require('nvim-tree').setup({
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
local cond = require('nvim-autopairs.conds')
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({
    map_c_w = true,
    check_ts = true
})

-- npairs.add_rule(Rule('<', '>')
--     :with_cr(true):with_del(true)
--     :with_move(cond.is_bracket_line_move())
-- )

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

vim.g.indent_blankline_char = '▏'

-- plenaries
require('vgit').setup()
require('telescope').load_extension('noice')
require('telescope').load_extension('session-lens')

-- graphics
require('trouble').setup()

require('noice').setup({
    lsp = {
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true
        }
    },
    presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true
    }
})

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
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center',
                separator = true
            }
        }
    }
})

require('lualine').setup({
    options = { theme = 'catppuccin' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'filesize', 'location' },
        lualine_z = { require('auto-session-library').current_session_name }
    },
    inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
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

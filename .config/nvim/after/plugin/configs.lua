-- file explorer
require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = 'after',
            show = {
                folder_arrow = false
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true
    },
    git = {
        ignore = false
    }
})

-- terminal
require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'vertical',
    size = 80
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
require('todo-comments').setup()

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')

npairs.setup({
    map_c_w = true,
    check_ts = true
})

npairs.add_rule(Rule('template<', '>', 'cpp')
    :with_cr(true):with_del(true)
    :with_move(cond.is_bracket_line_move())
)

require('Comment').setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false }
})

require('indent_blankline').setup({
    char = '▏',
    context_char = '▏',
    use_treesitter = true,
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = false
})

-- plenaries
require('vgit').setup({
    settings = {
        scene = {
            diff_preference = 'split'
        }
    }
})

require('telescope').load_extension('noice')
require('telescope').load_extension('session-lens')

-- graphics
require('trouble').setup()

require('noice').setup({
    presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true
    },
    lsp = {
        override = {
            ['cmp.entry.get_documentation'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true
        }
    }
})

local noice_lsp = require('noice.lsp')

vim.keymap.set('n', '<c-f>', function()
    if not noice_lsp.scroll(4) then
        return '<c-f>'
    end
end, { silent = true, expr = true })

vim.keymap.set('n', '<c-b>', function()
    if not noice_lsp.scroll(-4) then
        return '<c-b>'
    end
end, { silent = true, expr = true })

-- tree sitter
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    rainbow = {
        enable = true
    }
})

-- status bar
require('lualine').setup({
    options = {
        theme = 'tomorrow',
        globalstatus = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { 'filesize' },
        lualine_y = { 'diagnostics' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename' },
        lualine_x = { 'filesize' },
        lualine_y = { },
        lualine_z = { }
    },
    extensions = { 'nvim-tree' }
})

-- scroll bar
require('scrollbar').setup({
    handle = {
        color = '#969896'
    },
    handlers = {
        cursor = false
    }
})

local cmp = require('cmp')
local lsp = require('lsp-zero')
local luasnip = require('luasnip')
local null_ls = require('null-ls')

local select_opts = { behavior = cmp.SelectBehavior.Select }

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

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

require('lsp_signature').setup({
    bind = true,
    handler_opts = { border = 'rounded' }
})

null_ls.setup({
    sources = {
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.diagnostics.cppcheck
    }
})

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    window = {
        completion = {
            col_offset = -2,
            side_padding = 1
        }
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, vim_item)
            vim_item.kind = string.format(
                '%s %s',
                kind_icons[vim_item.kind],
                vim_item.kind
            )
            local strings = vim.split(vim_item.kind, '%s', { trimempty = true })
            vim_item.kind = strings[1]
            vim_item.menu = '    (' .. strings[2] .. ')'
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<cr>']  = cmp.mapping.confirm(),
        ['<c-u>'] = cmp.mapping.scroll_docs(4),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<c-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<c-e>'] = cmp.mapping.abort(),
        ['<tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, {'i', 's'}
        ),
        ['<s-tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {'i', 's'}
        )
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'buffer' } }
    )
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
    )
})

lsp.preset('lsp-compe')
lsp.nvim_workspace()
lsp.setup()

function _G.set_terminal_keybinding()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<c-h>', [[<cmd>wincmd h<cr>]], opts)
    vim.keymap.set('t', '<c-j>', [[<cmd>wincmd j<cr>]], opts)
    vim.keymap.set('t', '<c-k>', [[<cmd>wincmd k<cr>]], opts)
    vim.keymap.set('t', '<c-l>', [[<cmd>wincmd l<cr>]], opts)
end

require('trouble').setup()
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keybinding()')

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

require('trouble').setup()

require('lsp_signature').setup({
    bind = true,
    hint_enable = false
})

null_ls.setup({
    sources = {
        -- FIXME: Warning error - no treesitter cli
        -- null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.diagnostics.zsh,
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.diagnostics.chktex,
        -- null_ls.builtins.diagnostics.cppcheck
    }
})

cmp.setup({
    preselect = cmp.PreselectMode.Insert,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = {
            col_offset = -2,
            side_padding = 1
        },
        documentation = cmp.config.window.bordered()
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
        ['<cr>']  = cmp.mapping.confirm({ select = true }),
        ['<c-d>'] = cmp.mapping.scroll_docs(4),
        ['<c-u>'] = cmp.mapping.scroll_docs(-4),
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
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }
    }, {
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' }
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'buffer' } }
    )
})

cmp.setup.cmdline({ '/', '?' }, {
    preselect = cmp.PreselectMode.Insert,
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.cmdline({
        ['<cr>']  = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                else
                    fallback()
                end
            end, {'i', 's'}
        )
    }),
    sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
    preselect = cmp.PreselectMode.Insert,
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.cmdline({
        ['<cr>']  = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                else
                    fallback()
                end
            end, {'i', 's'}
        )
    }),
    sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
    )
})

lsp.preset('lsp-compe')
lsp.nvim_workspace()
lsp.setup()

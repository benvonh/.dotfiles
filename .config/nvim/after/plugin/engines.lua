local cmp = require('cmp')
local lsp = require('lsp-zero')
local luasnip = require('luasnip')
local null_ls = require('null-ls')

local select_opts = { behavior = cmp.SelectBehavior.Select }

local kind_icons = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = 'ﴯ',
    Interface = '',
    Module = '',
    Property = 'ﰠ',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = 'פּ',
    Event = '',
    Operator = '',
    TypeParameter = ''
}

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
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'abbr', 'kind' },
        format = function(_, item)
            item.abbr = item.abbr:gsub('%b()', '')
            if string.len(item.abbr) > 32 then
                item.abbr = string.sub(item.abbr, 1, 29) .. '...'
            end
            item.kind = kind_icons[item.kind] .. ' ' .. item.kind
            return item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<cr>']  = cmp.mapping.confirm(),
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
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'nvim_lua', keyword_length = 1 }
    }, {
        { name = 'path', keyword_length = 1 },
        { name = 'buffer', keyword_length = 1 },
        { name = 'luasnip', keyword_length = 1 }
    })
})

lsp.preset('lsp-compe')
lsp.nvim_workspace()
lsp.setup()

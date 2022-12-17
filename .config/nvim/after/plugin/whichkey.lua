vim.g.mapleader = ' '

local wk = require('which-key')

wk.register(
    { w = { '<cmd>w<cr>', 'Write buffer' } },
    { prefix = '<leader>' }
)

wk.register(
    { a = { '<cmd>q<cr>', 'Quite buffer' } },
    { prefix = '<leader>' }
)

wk.register(
    { x = { '<cmd>x<cr>', 'Write and quit buffer' } },
    { prefix = '<leader>' }
)

wk.register(
    { s = { '<cmd>wa<cr>', 'Save all' } },
    { prefix = '<leader>' }
)

wk.register(
    { c = { '<cmd>qa<cr>', 'Close neovim' } },
    { prefix = '<leader>' }
)

wk.register(
    { z = { '<cmd>wa<cr> <cmd>qa<cr>', 'Save and close neovim' } },
    { prefix = '<leader>' }
)

wk.register(
    { q = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'Close and replace buffer' } },
    { prefix = '<leader>' }
)

wk.register(
    { e = { '<cmd>NvimTreeToggle<cr>', 'Toggle file explorer' } },
    { prefix = '<leader>' }
)

wk.register(
    { f = { '<cmd>NvimTreeFindFile<cr>', 'Focus file in explorer' } },
    { prefix = '<leader>' }
)

wk.register(
    { p = { '<cmd>Telescope find_files<cr>', 'Find files' } },
    { prefix = '<leader>' }
)

wk.register(
    { l = { '<cmd>Telescope live_grep<cr>', 'Grep files' } },
    { prefix = '<leader>' }
)

wk.register(
    { b = { '<cmd>Telescope buffers<cr>', 'Show buffers' } },
    { prefix = '<leader>' }
)

wk.register(
    { g = {
            name = 'Git',
            s = { '<cmd>Telescope git_status<cr>', 'Status' },
            c = { '<cmd>Telescope git_commits<cr>', 'Commits' },
            b = { '<cmd>Telescope git_branches<cr>', 'Branches' }
        }
    },
    { prefix = '<leader>' }
)

wk.register(
    { r = { '<cmd>LspRestart<cr>', 'Restart LSP' } },
    { prefix = '<leader>' }
)

wk.register(
    { d = { '<cmd>TroubleToggle<cr>', 'Toggle trouble' } },
    { prefix = '<leader>' }
)

wk.register(
    { m = { '<cmd>Mason<cr>', 'Show mason' } },
    { prefix = '<leader>' }
)

wk.register(
    { g = {
            name = 'Go to',
            D = 'Declaration',
            d = 'Definition',
            i = 'Implementation',
            r = 'References',
            F = 'Format'
        }
    },
    { }
)

wk.setup()

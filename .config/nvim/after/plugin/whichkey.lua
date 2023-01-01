vim.g.mapleader = ' '

local git = require('vgit')
local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

local wk = require('which-key')

-- basic commands
wk.register({
    ['<leader>'] = {
        w = {
            name = '+Write',
            w = { '<cmd>w<cr>',     'Write buffer' },
            a = { '<cmd>wa<cr>',    'Save all files' }
        }
    }
})
wk.register({
    ['<leader>'] = {
        q = {
            name = '+Quit',
            q = { '<cmd>q<cr>',     'Quit buffer' },
            a = { '<cmd>qa<cr>',    'Quit neovim' },
            i = { '<cmd>q!<cr>',    'Force quit buffer' },
            f = { '<cmd>qa!<cr>',   'Force quit neovim' }
        }
    }
})
wk.register({
    ['<leader>'] = {
        x = { '<cmd>x<cr>',    'Write and quite buffer' }
    }
})
wk.register({
    ['<leader>'] = {
        z = { '<cmd>wa<cr> <cmd>qa<cr>',    'Save and quit neovim' }
    }
})
wk.register({
    ['<leader>'] = {
        c = {
            '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>',
            'Close and replace buffer'
        }
    }
})
wk.register({
    ['<leader>'] = {
        i = { '<cmd>split<cr>',             'Split window horizontally' }
    }
})
wk.register({
    ['<leader>'] = {
        v = { '<cmd>vsplit<cr>',            'Split window vertically' }
    }
})

-- file xplorer
wk.register({
    ['<leader>'] = {
        e = { '<cmd>NvimTreeFindFile<cr>',    'Toggle file explorer' }
    }
})

-- plenaries (w/ better coding)
wk.register({
    ['<leader>'] = {
        t = { '<cmd>TodoTelescope<cr>',         'Show TODO' }
    }
})
wk.register({
    ['<leader>'] = {
        s = {
            name = '+Session',
            s = { '<cmd>SaveSession<cr>',       'Save session' },
            f = { '<cmd>SearchSession<cr>',     'Open session' }
        }
    }
})
wk.register({
    ['<leader>'] = {
        a = { mark.add_file,                    'Add file to Harpoon' }
    }
})
wk.register({
    ['<leader>'] = {
        h = { ui.toggle_quick_menu,             'Toggle Harpoon menu' }
    }
})
wk.register({
    ['<leader>'] = {
        j = { function() ui.nav_file(1) end,    'Go to Harpoon 1' }
    }
})
wk.register({
    ['<leader>'] = {
        k = { function() ui.nav_file(2) end,    'Go to Harpoon 2' }
    }
})
wk.register({
    ['<leader>'] = {
        p = {
            '<cmd>Telescope find_files cwd=~ hidden=true no_ignore=true<cr>',
            'Find file (from directory)'
        }
    }
})
wk.register({
    ['<leader>'] = {
        f = { '<cmd>Telescope git_files<cr>',   'Find file (from git)' }
    }
})
wk.register({
    ['<leader>'] = {
        l = { '<cmd>Telescope live_grep<cr>',   'Grep files' }
    }
})
wk.register({
    ['<leader>'] = {
        b = { '<cmd>Telescope buffers<cr>',     'Show buffer' }
    }
})
wk.register({
    ['<leader>'] = {
        g = {
            name ='+Git',
            s = { '<cmd>Telescope git_status<cr>',      'Show status' },
            c = { '<cmd>Telescope git_commits<cr>',     'Show commits' },
            b = { '<cmd>Telescope git_branches<cr>',    'Show branches' },
            d = { git.buffer_diff_preview,              'Diff preview' },
            h = { git.buffer_hunk_preview,              'Hunk preview' },
            t = { git.toggle_diff_preference,           'Toggle preference' },
            l = { git.toggle_live_gutter,               'Toggle live gutter' }
        }
    }
})

-- LSP
wk.register({
    ['<leader>'] = {
        r = { '<cmd>LspRestart<cr>',    'Restart LSP' }
    }
})
wk.register({
    ['<leader>'] = {
        d = { '<cmd>TroubleToggle<cr>', 'Toggle trouble' }
    }
})
wk.register({
    ['<leader>'] = {
        m = { '<cmd>Mason<cr>',         'Show mason' }
    }
})

wk.setup({
    show_help = false,
    show_keys = false
})

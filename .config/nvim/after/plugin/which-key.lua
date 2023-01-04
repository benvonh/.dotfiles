local function try_require(module)
    local ok, mod = pcall(require, module)

    if not ok then
        print('Failed to find ' .. module)
        return nil
    end

    return mod
end

local wk = try_require('which-key')
local ts = try_require('telescope.builtin')

if not (wk and ts) then
    return
end

vim.g.mapleader = ' '

-- basic commands
wk.register({
    ['<leader>q'] = { '<cmd>q<cr>',                       'Quit buffer' },
    ['<leader>w'] = { '<cmd>w<cr>',                       'Write buffer' },
    ['<leader>x'] = { '<cmd>x<cr>',                       'Save and quit buffer' },
    ['<leader>s'] = { '<cmd>wa<cr>',                      'Save all buffers' },
    ['<leader>m'] = { '<cmd>messages<cr>',                'Open messages' },
    ['<leader>d'] = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'Remove buffer' },
    ['<leader>'] = {
        z = {
            name = '+Neovim',
            c = { '<cmd>qa<cr>',             'Close neovim' },
            a = { '<cmd>qa!<cr>',            'Abandon neovim' },
            z = { '<cmd>wa<cr> <cmd>qa<cr>', 'Save and quit neovim' },
        }
    }
})

-- plugin commands
wk.register({
    -- file explorer
    ['<leader>e'] = { '<cmd>NvimTreeFindFileToggle<cr>',      'Focus tree' },
    ['<leader>t'] = { '<cmd>NvimTreeCollapseKeepBuffers<cr>', 'Collapse tree' },
    -- telescope
    ['<leader>b'] = { '<cmd>Telescope buffers<cr>',   'Find buffer' },
    ['<leader>l'] = { '<cmd>Telescope live_grep<cr>', 'Find word' },
    ['<leader>f'] = { '<cmd>Telescope git_files<cr>', 'Find file in repo' },
    ['<leader>p'] = { function()
        vim.ui.input({
            prompt = 'Search file location: '
        }, function(input)
            if input == nil then
                return
            end
            ts.find_files({ cwd = input })
        end)
    end, 'Find file anywhere'
    }
})

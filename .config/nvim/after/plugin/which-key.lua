local function try_require(module)
    local ok, mod = pcall(require, module)

    if not ok then
        print('Failed to find ' .. module)
        return
    end

    return mod
end

local wk = try_require('which-key')

vim.g.mapleader = ' '

wk.register({
    ['<leader>q'] = { '<cmd>q<cr>', 'Quit buffer' },
    ['<leader>w'] = { '<cmd>w<cr>', 'Write buffer' },
    ['<leader>x'] = { '<cmd>x<cr>', 'Save and quit buffer' },
})

wk.register({
    ['<leader>'] = {
        z = {
            name = '+Basic',
            c = { '<cmd>qa<cr>',                      'Quit neovim' },
            z = { '<cmd>wa<cr> <cmd>qa<cr>',          'Save and quit neovim' },
            d = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'Delete buffer' },
        }
    }
})

wk.register({
    ['<leader>e'] = { '<cmd>NvimTreeFindFile<cr>',    'Focus nvim tree' },
    ['<leader>f'] = { '<cmd>Telescope git_files<cr>', 'Find file in git repo' },
    ['<leader>l'] = { '<cmd>Telescope live_grep<cr>', 'Grep files' },
    ['<leader>p'] = { function()
        vim.ui.input({
            prompt = 'Search file location: '
        }, function(input)
            if input == nil then
                return
            end
            local ts = try_require('telescope.builtin')
            ts.find_files({ cwd = input })
        end)
    end, 'Find file anywhere'
    }
})

local ok, wk = pcall(require, 'which-key')

if not ok then
    print('Failed to find which-key')
    return
end

vim.g.mapleader = ' '

-- basic commands
wk.register({
    ['<leader>q'] = { '<cmd>q<cr>',                       'Quit buffer' },
    ['<leader>w'] = { '<cmd>w<cr>',                       'Write buffer' },
    ['<leader>x'] = { '<cmd>x<cr>',                       'Save and quit buffer' },
    ['<leader>m'] = { '<cmd>messages<cr>',                'Open messages' },
    ['<leader>r'] = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'Remove buffer' },
    ['<leader>'] = {
        z = {
            name = '+Neovim',
            c = { '<cmd>qa<cr>',             'Close neovim' },
            a = { '<cmd>qa!<cr>',            'Abandon neovim' },
            z = { '<cmd>wa<cr> <cmd>qa<cr>', 'Save and quit neovim' },
        },
    },
})

-- plugin commands
wk.register({
    -- file explorer
    ['<leader>e'] = { '<cmd>NvimTreeFindFileToggle<cr>',      'Focus tree' },
    ['<leader>t'] = { '<cmd>NvimTreeCollapseKeepBuffers<cr>', 'Collapse tree' },
    -- telescope
    ['<leader>b'] = { '<cmd>Telescope buffers<cr>',   'Find buffer' },
    ['<leader>g'] = { '<cmd>Telescope live_grep<cr>', 'Find word' },
    ['<leader>f'] = { '<cmd>Telescope git_files<cr>', 'Find file in repo' },
    ['<leader>p'] = {
        function()
            vim.ui.input(
                { prompt = 'Search file location: ' },
                function(input)
                    if input == nil then
                        return
                    end
                    vim.cmd('Telescope find_files cwd=' .. input)
                end
            )
        end, 'Find file anywhere'
    },
    -- sessions
    ['<leader>s'] = { '<cmd>SaveSession<cr>', 'Save session' },
    ['<leader>l'] = {
        '<cmd>Telescope session-lens search_session<cr>',
        'Session lens'
    },
})

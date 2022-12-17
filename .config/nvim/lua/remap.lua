local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- exit insert mode with esc
map('i', '<c-c>', '<esc>')

-- don't cut with paste
map('v', 'p', '"_dp')

-- centre after motions
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '<c-u>', '<c-u>zz')
map('n', '<c-d>', '<c-d>zz')

-- move between panes
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- move panes
map('n', '<a-h>', '<c-w>H')
map('n', '<a-j>', '<c-w>J')
map('n', '<a-k>', '<c-w>K')
map('n', '<a-l>', '<c-w>L')

-- resize panes
map('n',  '<c-left>', '<c-w>>')
map('n',  '<c-down>', '<c-w>+')
map('n',    '<c-up>', '<c-w>-')
map('n', '<c-right>', '<c-w><')

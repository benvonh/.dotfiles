lua << EOF

require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'vertical',
    size = 80
    -- float_opts = {
    --     border = 'curved',
    --     height = 32,
    --     width = 128
    -- }
})

function _G.set_terminal_keybinding()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<c-h>', [[<cmd>wincmd h<cr>]], opts)
    vim.keymap.set('t', '<c-j>', [[<cmd>wincmd j<cr>]], opts)
    vim.keymap.set('t', '<c-k>', [[<cmd>wincmd k<cr>]], opts)
    vim.keymap.set('t', '<c-l>', [[<cmd>wincmd l<cr>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keybinding()')

EOF

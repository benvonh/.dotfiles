-- disable recording
vim.keymap.set('n', 'q', '<nop>')

-- don't cut with paste
vim.keymap.set('v', 'p', '"_dp')

-- exit insert mode with esc
vim.keymap.set('i', '<c-c>', '<esc>')

-- clear highlight
vim.keymap.set('n', '<c-c>', '<cmd>nohl<cr>')

-- why does this exist
vim.keymap.set('n', 'J', '<nop>')

-- centre after motions
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

-- move between panes
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- move panes
vim.keymap.set('n', '<a-h>', '<c-w>H')
vim.keymap.set('n', '<a-j>', '<c-w>J')
vim.keymap.set('n', '<a-k>', '<c-w>K')
vim.keymap.set('n', '<a-l>', '<c-w>L')

-- resize panes
vim.keymap.set('n',  '<c-left>', '<c-w>>')
vim.keymap.set('n',  '<c-down>', '<c-w>+')
vim.keymap.set('n',    '<c-up>', '<c-w>-')
vim.keymap.set('n', '<c-right>', '<c-w><')

-- move lines
vim.keymap.set('v', 'K', ':m \'<-2<cr>gv=gv')
vim.keymap.set('v', 'J', ':m \'>+1<cr>gv=gv')

local opt = vim.opt

-- editor
opt.wrap = false
opt.mouse = 'a'
opt.number = true
opt.confirm = true
opt.scrolloff = 16

-- visuals
opt.pumheight = 16
opt.cursorline = true
opt.visualbell = true
opt.signcolumn = 'yes'
opt.colorcolumn = { 81 }
opt.termguicolors = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smarttab = true
opt.expandtab = true

-- indentation
opt.shiftround = true
opt.autoindent = true
opt.smartindent = true

-- backup
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- others
opt.hidden = true
opt.completeopt = 'menu,menuone,noselect'

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

lua << EOF

local wk = require('which-key')

wk.register(
    { w = 'write buffer' },
    { prefix = '<leader>' }
)

wk.register(
    { a = 'quite buffer' },
    { prefix = '<leader>' }
)

wk.register(
    { x = 'write and quit buffer' },
    { prefix = '<leader>' }
)

wk.register(
    { s = 'save all' },
    { prefix = '<leader>' }
)

wk.register(
    { c = 'close neovim' },
    { prefix = '<leader>' }
)

wk.register(
    { z = 'save and close neovim' },
    { prefix = '<leader>' }
)

wk.register(
    { q = 'close and replace buffer' },
    { prefix = '<leader>' }
)

wk.register(
    { e = 'toggle file explorer' },
    { prefix = '<leader>' }
)

wk.register(
    { f = 'focus file in explorer' },
    { prefix = '<leader>' }
)

wk.register(
    { p = 'find files' },
    { prefix = '<leader>' }
)

wk.register(
    { l = 'grep files' },
    { prefix = '<leader>' }
)

wk.register(
    { b = 'show buffers' },
    { prefix = '<leader>' }
)

wk.register(
    { g = {
        name = 'git',
        s = 'status',
        c = 'commits',
        b = 'branches'
        }
    },
    { prefix = '<leader>' }
)

wk.register(
    { r = 'restart LSP' },
    { prefix = '<leader>' }
)

wk.register(
    { d = 'toggle trouble' },
    { prefix = '<leader>' }
)

wk.register(
    { m = 'show mason' },
    { prefix = '<leader>' }
)

wk.setup()

EOF

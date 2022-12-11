lua << EOF

require('Comment').setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false }
})

EOF

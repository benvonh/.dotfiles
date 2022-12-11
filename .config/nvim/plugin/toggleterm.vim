lua << EOF

require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'float',
    float_opts = {
        border = 'curved',
        height = 32,
        width = 128
    }
})

EOF

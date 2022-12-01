lua << EOF

local db = require('dashboard')

db.custom_center = {
    {
        icon = '  ',
        desc = 'File explorer                           ',
        shortcut = 'SPC t'
    },
    {
        icon = '  ',
        desc = 'Find file                               ',
        shortcut = 'SPC p'
    },
    {
        icon = '  ',
        desc = 'Find word                               ',
        shortcut = 'SPC g'
    }
}

EOF

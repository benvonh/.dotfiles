lua << EOF

require('auto-session').setup({
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = true
})

EOF

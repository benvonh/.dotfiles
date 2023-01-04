local ok, comment = pcall(require, 'comment')

if not ok then
    print('Failed to find comment')
    return
end

comment.setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false },
})

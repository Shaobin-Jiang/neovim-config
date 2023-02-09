local status, toggleterm = pcall(require, 'toggleterm')
if not status then
    vim.notify('没有找到 toggleterm')
    return
end

toggleterm.setup({
    open_mapping = '<C-t>',
    direction = 'float',
    float_opts = {
        border = 'curved'
    },
})

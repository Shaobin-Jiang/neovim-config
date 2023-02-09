local status, nvim_scrollview = pcall(require, 'scrollview')
if not status then
    vim.notify('没有找到 nvim-scrollview')
    return
end

nvim_scrollview.setup({
    excluded_filetypes = { 'nvimtree' },
    current_only = true,
    winblend = 75,
    base = 'right',
    column = 1
})

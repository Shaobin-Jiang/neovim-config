local status, markdown_preview = pcall(require, 'lualine')
if not status then
    vim.notify('没有找到 markdown-preview')
  return
end

markdown_preview.setup({})

-- Disable automatically closing preview when switching to another buffer
vim.g.mkdp_auto_close = 0

-- vim.g.mkdp_theme = 'dark'

local status, outline = pcall(require, 'symbols-outline')
if not status then
    vim.notify('没有找到 symbols-outline')
end

outline.setup({
    show_symbol_details = true,
    winblend = 20,
    keymaps = require("keybindings").outline,
    wrap = true
})

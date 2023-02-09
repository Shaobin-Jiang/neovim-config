local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    vim.notify('没有找到 nvim-tree')
  return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    git = {
        enable = false,
    },
    -- Support switching directories
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- Hide files beginning with a dot and node_modules folders
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 30,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
})

-- Automatically close
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

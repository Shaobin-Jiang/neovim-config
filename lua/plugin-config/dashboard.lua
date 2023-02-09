local status, db = pcall(require, 'dashboard')
if not status then
  vim.notify('没有找到 dashboard')
  return
end

db.header_pad = 6 -- Lines from header to top
db.center_pad = 4 -- Lines from center to header
db.footer_pad = 4 -- Lines from footer to center

-- Icons: see more at https://www.nerdfonts.com/cheat-sheet
db.custom_center = {
    {
        icon = '  ',
        desc = 'Preview colorscheme',
        action = 'Telescope colorscheme'
    },
    {
        icon = '  ',
        desc = 'Edit keybindings   ',
        action = 'edit C:/Users/dell/AppData/Local/nvim/lua/keybindings.lua'
    },
    {
        icon = '  ',
        desc = 'Edit preferences   ',
        action = 'edit C:/Users/dell/AppData/Local/nvim/init.lua'
    },
    {
        icon = '  ',
        desc = 'Install plugins    ',
        action = 'edit C:/Users/dell/AppData/Local/nvim/lua/plugins.lua'
    }
}

-- http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=neovim
db.custom_header = {
    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    [[]],
    [[                      0.7.2                       ]]
}

db.custom_footer = {
  'Work hard, and enjoy coding with vim.',
}

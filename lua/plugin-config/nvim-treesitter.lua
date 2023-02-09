local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
    vim.notify('没有找到 nvim-treesitter')
    return
end

treesitter.setup({
    -- Install language parser
    -- Use :TSInstallInfo to look for supported languages
    ensure_installed = { 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua', 'python', 'typescript', 'tsx', 'go', 'fortran', 'org' },
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
        additional_vim_regex_highlighting = {'org'},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        },
    },
    -- Use = to format code
    -- Disable this or it might be in conflict with orgmode
    -- indent = {
    --     enable = true,
    -- },
    rainbow = {
        enable = true,
        -- disable = { 'html' },
        extended_mode = true,
        max_file_lines = nil
    },
})

-- Enable folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Unfold all upon opening a file, see:
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

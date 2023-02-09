-- local colorscheme = 'gruvbox'
-- require("gruvbox").setup({
--     italic = false,
--     contrast = "hard"
-- })

local colorscheme = "tokyonight"
require("tokyonight").setup({
    style = "moon",
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})

pcall(vim.cmd, "colorscheme " .. colorscheme)

-- For gruvbox theme
if colorscheme == "gruvbox" then
	vim.o.background = "dark"
end

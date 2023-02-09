local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({
	defaults = {
		initial_mode = "insert",
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		find_files = {
			-- dropdown / cursor / ivy
            winblend = 20
		},
	},
	extensions = {
		-- See https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or 'ignore_case' or 'respect_case'
		},
	},
})

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "env")

local status, transparent = pcall(require, "transparent")
if not status then
	vim.notify("没有找到 transparent")
	return
end

transparent.setup({
	enable = true,
	extra_groups = {
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"BufferLineFill",
        -- "BufferLineGroupSeparator",
        -- "BufferLineOffsetSeparator",
        -- "BufferLineTabSeparator",
        -- "BufferLineTabSeparatorSelected",
        -- "BufferLineSeparatorSelected",
	},
})
